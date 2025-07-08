import '../../../../core/core_export.dart';
import '../../../cart/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel)? onAddToCart;
  const ProductCard({super.key, required this.product, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onAddToCart != null) {
          onAddToCart!(product);
        }
      },
      child: Column(
        spacing: 10,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0XFFDADADA)
                      .withValues(alpha: 0.4), // Light Blue Background
                ),
                child: Image.asset(
                  product.imagePath ?? '',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error, color: Colors.red)),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(product.name,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              Text('\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Color(0xFF424242),
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}
