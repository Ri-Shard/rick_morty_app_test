part of '../../screen.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  static const name = 'characters';

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final CharactersStore store = charactersStore;
  bool isFocus = false;
  late final TextEditingController controllerText = TextEditingController()
    ..addListener(() {
      setState(() {
        controllerText.text == '' ? isFocus = false : isFocus = true;
      });
    });

  @override
  void initState() {
    store.fetchCharacters(500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personajes",
                    style: textBold(size: 25),
                  ),
                  GestureDetector(
                    onTap: () => context.push('/favorite'),
                    child: SizedBox(
                      height:
                          isLandscape ? size.height * 0.10 : size.height * 0.04,
                      width: isLandscape ? size.width * 0.05 : size.width * 0.1,
                      child: SvgPicture.asset(
                        'assets/favorite.svg',
                        fit: BoxFit.cover,
                        colorFilter:
                            const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                controller: controllerText,
                onChanged: (value) => store.applyFilter(value),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  label: const Text(
                    'Nombre del personaje',
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: isFocus
                      ? GestureDetector(
                          onTap: () => setState(() {
                                controllerText.text = '';
                                store.applyFilter(controllerText.text);
                              }),
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.red[300],
                          ))
                      : null,
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xff61D491),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0XffC0C3C4),
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Color(0xff61D491),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(child: Observer(
                builder: (_) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                          20.0, // Espacio horizontal entre columnas
                      mainAxisSpacing: 20.0, // Espacio vertical entre filas
                      childAspectRatio: (isLandscape
                              ? size.width * 0.03
                              : size.width * 0.35) /
                          (isLandscape
                              ? size.height * 0.04
                              : size.height * 0.19),
                    ),
                    itemCount: store.filterCharacters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final character = store.filterCharacters[index];
                      return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final bool isFavorite = store.favorites
                                .any((e) => e.id == character.id);
                            context.push('/detail/${isFavorite.toString()}',
                                extra: character);
                          },
                          child:
                              CardCharacter(character: character, size: size));
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
