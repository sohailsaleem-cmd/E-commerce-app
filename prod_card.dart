import 'package:flutter/material.dart';
import 'package:practice/products/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(
              widget.product.image,

              // fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 10, color: Colors.green),
          ),
          Text('\$' '${widget.product.price}',style: const TextStyle(fontSize: 14,color:Colors.red),),
        ],
      ),
    );
  }
}
