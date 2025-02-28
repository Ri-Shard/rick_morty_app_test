part of '../../screen.dart';

class FavoriteCharactersScreen extends StatelessWidget {
  const FavoriteCharactersScreen({super.key});
  static const name = 'favorite';
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final CharactersStore store = charactersStore;
    
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: size.height * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_rounded, size: 30,)
                ),
                Text('Favoritos', style: textBold(size: 30),),
                Container(width: size.width * 0.05,)
              ],
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0, // Espacio horizontal entre columnas
                      mainAxisSpacing: 20.0, // Espacio vertical entre filas
                      childAspectRatio: (size.width * 0.35) / (size.height * 0.19),
                    ),
                    itemCount: store.favorites.length,
                    itemBuilder: (BuildContext context, int index) {
                      final character = store.favorites[index];
                      return GestureDetector(
                        
                        onTap: () {
                          final bool isFavorite = store.favorites.any((e) => e.id == character.id );
                          context.push('/detail/${isFavorite.toString()}',extra: character);
                        },
                        child: CardCharacter(character: character, size: size)
                      );
                    },
                  );
                },
              ) 
            )
          ],
        ),
      ),
    );
  }
}