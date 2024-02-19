import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/products/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          'Detail Product',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                ),
                child: Image.asset(
                  product.image,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name.toUpperCase(),
                      style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$' '${product.price}',
                      style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold),

                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(product.description,
                  textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
