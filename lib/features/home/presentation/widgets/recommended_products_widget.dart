import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

class Product {
  final String title;
  final String description;
  final int compatibility;
  final String imageUrl;
  final double price;

  Product({
    required this.title,
    required this.description,
    required this.compatibility,
    required this.imageUrl,
    required this.price,
  });
}

class RecommendedProductsWidget extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: "Modern Accent Chair",
      description: "Comfortable velvet upholstered chair with gold metal legs",
      compatibility: 96,
      imageUrl:
          "https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=200&h=200&fit=crop",
      price: 289.99,
    ),
    Product(
      title: "Scandinavian Coffee Table",
      description:
          "Minimalist oak wood coffee table with clean geometric lines",
      compatibility: 94,
      imageUrl:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200&h=200&fit=crop",
      price: 429.99,
    ),
    Product(
      title: "Industrial Bookshelf",
      description:
          "5-tier metal and wood bookshelf with rustic industrial design",
      compatibility: 91,
      imageUrl:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop",
      price: 199.99,
    ),
    Product(
      title: "Luxury Dining Table",
      description: "Solid walnut dining table seats 6 people comfortably",
      compatibility: 89,
      imageUrl:
          "https://images.unsplash.com/photo-1549497538-303791108f95?w=200&h=200&fit=crop",
      price: 849.99,
    ),
    Product(
      title: "Memory Foam Mattress",
      description:
          "Queen size gel-infused memory foam mattress with cooling technology",
      compatibility: 97,
      imageUrl:
          "https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=200&h=200&fit=crop",
      price: 599.99,
    ),
    Product(
      title: "Vintage Leather Sofa",
      description: "3-seater genuine leather sofa with distressed finish",
      compatibility: 93,
      imageUrl:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200&h=200&fit=crop",
      price: 1299.99,
    ),
  ];

  RecommendedProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text('Recommended For You',
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 2),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey.shade400,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Product Title
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Product Description
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Price
              Row(
                children: [
                  Text(
                    'Compatibility: ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    '${product.compatibility}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _getCompatibilityColor(product.compatibility),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Compatibility

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'EGP ',
                      style: AppStyles.textStyle14, // Smaller font for EGP
                    ),
                    TextSpan(
                      text: '${product.price}',
                      style: AppStyles.textStyle18.copyWith(
                          fontWeight:
                              FontWeight.w600), // Original font for price
                    ),
                  ],
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCompatibilityColor(int compatibility) {
    if (compatibility >= 95) return Colors.green.shade600;
    if (compatibility >= 90) return Colors.orange.shade600;
    return Colors.red.shade600;
  }
}

// Example usage in a full a
