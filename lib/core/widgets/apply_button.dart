import '/core/core_export.dart';

class ApplyButton extends StatelessWidget {
  final bool applied;
  final VoidCallback onTap;

  const ApplyButton({
    super.key,
    required this.applied,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: applied ? AppColors.success : AppColors.primary,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(
        applied ? 'Applied' : 'Apply',
        style: AppTextStyles.font10
            .copyWith(color: applied ? AppColors.success : AppColors.primary),
      ),
    );
  }
}
