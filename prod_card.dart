import 'package:flutter/material.dart';
import 'package:practice/products/product.dart';
import 'package:practice/provider/favorite_prov.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
      final provider = FavoriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => provider.toggleFavorite(widget.product),
                child: Icon(
                  provider.isExist(widget.product)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(
              widget.product.image,
            ),
          ),
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 10, color: Colors.green),
          ),
          Text(
            '\$' '${widget.product.price}',
            style: const TextStyle(fontSize: 14, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
