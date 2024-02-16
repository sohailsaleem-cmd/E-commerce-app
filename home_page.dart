import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  _buildProductCategory({required int index, required String name}) =>
      Container(
        height: 30,
        width: 80,
        margin: const EdgeInsets.only(top: 2, right: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.greenAccent : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white,fontSize: 11),
        ),
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
                fontSize: 10, color:Colors.black,),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildProductCategory(index: 0, name: "all products"),
            _buildProductCategory(index: 1, name: "Sneakers"),
            _buildProductCategory(index: 2, name: "Jackets"),
          ],
        ),
      ],
    );
  }
}
