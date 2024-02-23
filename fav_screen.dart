import 'package:flutter/material.dart';
import 'package:practice/provider/favorite_prov.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorite;
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'favorite products',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.green),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (contex, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          finalList.removeAt(index);
                          setState(() {
                            
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                        icon: Icons.delete,
                        label: "Delete",
                      )
                    ]),
                    child: ListTile(
                      title: Text(
                        finalList[index].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        finalList[index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(finalList[index].image),
                        backgroundColor:
                            const Color.fromARGB(255, 237, 199, 199),
                      ),
                      trailing: Text(
                        '\$ ${finalList[index].price}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
