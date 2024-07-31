import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ValueNotifierStatelesswidget extends StatelessWidget {
  const ValueNotifierStatelesswidget({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> _count = ValueNotifier(0);
    ValueNotifier<bool> bubble = ValueNotifier(true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless widget works as statefull'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: bubble,
            builder: (context, value, child) {
              return TextField(
                obscureText: bubble.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        //  bubble.value = !bubble.value;
                        if (bubble.value) {
                          bubble.value = false;
                        } else {
                          bubble.value = true;
                        }
                      },
                      icon: Icon(bubble.value
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  hintText: 'password',
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          ValueListenableBuilder(
            valueListenable: _count,
            builder: (context, value, child) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  child: Text(
                    _count.value.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 28),
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
        },
        child: Icon(Icons.ad_units),
      ),
    );
  }
}
