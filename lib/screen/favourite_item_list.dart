import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic_example/provider/favorite_provider.dart';

class Favourite_Item_List extends StatefulWidget {
  const Favourite_Item_List({super.key});

  @override
  State<Favourite_Item_List> createState() => _Favourite_Item_ListState();
}

class _Favourite_Item_ListState extends State<Favourite_Item_List> {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('Ahh No Nothing Here Please Select Item',
          style: TextStyle(color: Colors.white)),
    );
    print('built');
    final provider = Provider.of<FavoriteProvider>(context, listen: false);
    if (!provider.selectitems.isEmpty) {
      content = Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.selectitems.length,
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
      );
    }
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: content);
  }
}
