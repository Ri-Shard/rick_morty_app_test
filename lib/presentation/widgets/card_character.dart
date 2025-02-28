part of 'widget.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    super.key,
    required this.character,
    required this.size,
  });

  final CharactersModel character;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.01,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Color de la sombra con opacidad
              spreadRadius: 2, // Radio de dispersión
              blurRadius: 4, // Radio de desenfoque
              offset: const Offset(0, 3), 
            )
          ]
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.17,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                child: FadeInImage(
                  image: NetworkImage(character.image),
                  placeholder:  const AssetImage('assets/loading-image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  character.name, 
                  style: textNormal(size: 15), 
                  textAlign: TextAlign.center,
                  )
              )
            )
          ],
        ),
      ),
    );
  }
}