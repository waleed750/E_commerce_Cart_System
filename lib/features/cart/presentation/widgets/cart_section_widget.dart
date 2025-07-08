// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_cart_system/core/widgets/default_text_widget.dart';

import '../../../../core/core_export.dart';

class CartSectionWidget extends StatelessWidget {
  const CartSectionWidget({
    super.key,
    required this.children,
    required this.title,
  });
  final List<Widget> children;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              bottom: 16,
            ),
            child: const DefaultTextWidget(
              text: "Coupon Code",
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
