part of 'widget.dart';

class ButtonGeneral extends StatelessWidget {
  const ButtonGeneral({
    super.key, this.action, required this.title,
  });

  final String title;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: action,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        height: size.height * 0.075,
        width: size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Color de la sombra con opacidad
                spreadRadius: 1, // Radio de dispersión
                blurRadius: 2, // Radio de desenfoque
                offset: const Offset(0, 3), 
              )
            ],
          border: Border.all(
            color:  const Color(0xFF19abc8),
            width: 2
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}