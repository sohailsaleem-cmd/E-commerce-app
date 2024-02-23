import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/hompage/cart_deatail.dart';
import 'package:practice/hompage/fav_screen.dart';
import 'package:practice/hompage/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    const HomeScreen(),
    const FavoriteScreen(),
    const Center(
      child: Text('profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          'E-Commerce Shop',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartDetail(),
                      ),
                    ),
                icon: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: tabs[_currentIndex],

      //bottom   navigation

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        // type: BottomNavigationBarType.fixed,
        iconSize: 15,
        selectedFontSize: 10,
        unselectedFontSize: 8,
        selectedItemColor: Colors.redAccent,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
