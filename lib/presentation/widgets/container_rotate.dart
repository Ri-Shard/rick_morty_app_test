part of 'widget.dart';

class ContainerRotate extends StatelessWidget {
  const ContainerRotate({
    super.key,
    required this.size, required this.rotate,
  });

  final Size size;
  final double rotate;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.6,
        decoration:  BoxDecoration(
          color: const Color(0xff263238),
          borderRadius: BorderRadius.circular(20)
        ),
      ), 
    );
  }
}