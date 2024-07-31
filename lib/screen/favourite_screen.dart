import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic_example/provider/favorite_provider.dart';
import 'package:provider_basic_example/screen/favourite_item_list.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('built');
    //  final provider = Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Favourite_Item_List();
                },
              ));
            },
            child: const Icon(
              Icons.favorite_sharp,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        title: const Text(
          'FAVOURITE LIST ',
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (context, value, child) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          value.addlist(index);
                        },
                        title: Text('List $index'),
                        trailing: Icon(
                          value.selectitems.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: value.selectitems.contains(index)
                              ? Colors.red
                              : null,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
