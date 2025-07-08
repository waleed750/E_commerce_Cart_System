import '../core_export.dart';

class LogoCircleAvatar extends StatelessWidget {
  const LogoCircleAvatar(
      {super.key, required this.radius, required this.imagePath});
  final double radius;
  final String imagePath;
  @override

  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.cardBackground, width: 10),
      ),
      child: CircleAvatar(
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
