part of 'widget.dart';

class ItemsCharacter extends StatelessWidget {
  const ItemsCharacter({
    super.key,
    required this.item, required this.title,
  });

  final String item;
  final String title;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Text(
          title,
          style: textBold(size: 20),
        ),
        SizedBox(width: size.width * 0.04,),
        Expanded(
          child: Text(
            item,
            style: textRegular(size: 20),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}