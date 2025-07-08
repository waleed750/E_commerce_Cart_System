import 'package:e_commerce_cart_system/core/utils/utils_epxort.dart';
import 'package:flutter/material.dart';

class CartSummarySection extends StatelessWidget {
  final double itemTotalBeforeDiscount;
  final double itemTotalAfterDiscount;
  final double discount;
  final double deliveryCharge;

  const CartSummarySection({
    super.key,
    required this.itemTotalBeforeDiscount,
    required this.discount,
    this.deliveryCharge = 0,
    required this.itemTotalAfterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    final toPay = itemTotalAfterDiscount + deliveryCharge;

    return Card(
      margin: const EdgeInsets.only(top: 16, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Billable Amount",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildRow(
              "Item Total",
              "\$ ${itemTotalBeforeDiscount.toStringAsFixed(2)}",
            ),
            _buildRow(
                "Delivery Charges",
                deliveryCharge == 0
                    ? "Free"
                    : "\$ ${deliveryCharge.toStringAsFixed(2)}",
                isGreen: true),
            divider(),
            _buildRow(
              "Item Discount",
              "- \$ ${discount.toStringAsFixed(2)}",
              isGreen: true,
            ),
            divider(),
            _buildRow(
              "To Pay",
              "\$ ${toPay.toStringAsFixed(2)}",
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() => Divider(
        thickness: 0.5,
        height: 1,
        color: AppColors.gray.withValues(alpha: 0.2),
      );
  Widget _buildRow(
    String label,
    String value, {
    bool isGreen = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.font12.copyWith(color: AppColors.textMuted),
          ),
          Text(
            value,
            style: AppTextStyles.font12.copyWith(
              color: isGreen ? Colors.green : null,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ],
      ),
    );
  }
}
