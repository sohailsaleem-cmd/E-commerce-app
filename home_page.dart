import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/products/detail_prod.dart';
import 'package:practice/products/my_product.dart';
import 'package:practice/widgets/prod_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(
          () => isSelected = index,
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 30,
          width: 85,
          // margin: const EdgeInsets.only(top: 2, right: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.redAccent:Colors.black54,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
      );
  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProduct.allProducts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(product: allProducts),
              ),
            ),
            child: ProductCard(product: allProducts),
          );
        },
      );

  _buildSneaker() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.allProducts.length,
        itemBuilder: (context, index) {
          final sneakerList = MyProduct.sneakerList[index];
          // return ProductCard(product: sneakerList);
                return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(product:sneakerList),
              ),
            ),
            child: ProductCard(product: sneakerList),
          );
        },
      );

  _buildJackets() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.allProducts.length,
        itemBuilder: (context, index) {
          final jacketList = MyProduct.jacketList[index];
                return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(product: jacketList),
              ),
            ),
            child: ProductCard(product: jacketList),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "Our-Products",
            // textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight:FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildProductCategory(index: 0, name: "all products"),
            _buildProductCategory(index: 1, name: "Sneakers"),
            _buildProductCategory(index: 2, name: "Jackets"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: isSelected == 0
                ? _buildAllProducts()
                : isSelected == 1
                    ? _buildSneaker()
                    : _buildJackets()),
        //    Expanded(
        //   child: _buildSneaker(),

        // ),
      ],
    );
  }
}
