part of '../../screen.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({super.key, required this.character, required this.isFavorite});

  static const name = 'detail';
  final CharactersModel character;
  final bool isFavorite;

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {

  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final CharactersStore store = charactersStore;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_rounded, size: 30,)
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (isFavorite) {
                        final rest = await store.deleteFavorite(widget.character.id);
                        if(rest) setState(() {isFavorite = false;});
                        return;
                      }
                      final rest = await store.addFavorite(widget.character.id);
                      if(rest) setState(() {isFavorite = true;});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation);
                          return SlideTransition(position: offsetAnimation, child: child);
                        },
                        child: isFavorite 
                        ? SvgPicture.asset(
                            'assets/favorite.svg',
                            key: const ValueKey('favorite'),
                            height: size.height * 0.05,
                            width: size.width * 0.1,
                            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                            fit: BoxFit.cover,
                          )
                        : SvgPicture.asset(
                            'assets/add.svg',
                            key: const ValueKey('add'),
                            height: size.height * 0.05,
                            width: size.width * 0.07,
                            colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.01,),
              Center(child: Text(widget.character.name, style: textBold(size: 25),)),
              SizedBox(height: size.height * 0.03,),
              Center(
                child: Hero(
                  tag: widget.character.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: size.height * 0.35,
                      width: size.width * 0.8,
                      child: FadeInImage(
                        image: NetworkImage(widget.character.image),
                        placeholder:  const AssetImage('assets/loading-image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusCharacter(size: size, character: widget.character),
                    SizedBox(height: size.height * 0.02,),
                    ItemsCharacter(item: widget.character.species, title:"Species:",),
                    SizedBox(height: size.height * 0.02,),
                    ItemsCharacter(item: widget.character.gender, title:"Gender:",),
                    SizedBox(height: size.height * 0.02,),
                    ItemsCharacter(item: widget.character.origin.name, title:"Origin:",),
                    SizedBox(height: size.height * 0.02,),
                    ItemsCharacter(item: widget.character.location.name, title:"Location:",),
                    SizedBox(height: size.height * 0.02,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


