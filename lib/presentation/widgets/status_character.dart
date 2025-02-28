part of 'widget.dart';

class StatusCharacter extends StatelessWidget {
  const StatusCharacter({
    super.key,
    required this.size,
    required this.character,
  });

  final Size size;
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Status:',
          style: textBold(size: 20),
        ),
        SizedBox(width: size.width * 0.04,),
        Container(
          height: size.height * 0.04,
          width: size.width * 0.04,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  (character.status == 'Dead') 
            ? Colors.red 
            : (character.status == 'Alive') ? Colors.green
            : Colors.grey[700] 
          ),
        ),
        SizedBox(width: size.width * 0.02,),
        Text(
          character.status,
          style: textRegular(size: 20),
        ),
      ],
    );
  }
}
