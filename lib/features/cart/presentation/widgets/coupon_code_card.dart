import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/discount_strategy.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/apply_button.dart' show ApplyButton;

class CouponCodeCard extends StatelessWidget {
  final DiscountStrategy code;
  final bool applied;
  final void Function(DiscountStrategy) onApply;

  const CouponCodeCard({
    super.key,
    required this.code,
    this.applied = false,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          Text(code.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Apply for ${code.toString()}"),
      trailing: ApplyButton(applied: applied, onTap: () => onApply(code)),
    );
  }
}
