import '../core_export.dart';

class DefaultTextWidget extends StatelessWidget {
  const DefaultTextWidget({super.key, required this.text, this.style});
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
    );
  }
}
