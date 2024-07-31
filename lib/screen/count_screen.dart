import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic_example/provider/provider_count.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  var updatetime = '';
  late Timer _timer;
  void time2() {
    var now = DateTime.now();

    setState(() {
      updatetime = '${now.hour}:${now.minute}:${now.second}';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        return time2();
      },
    );

    final countprovider = Provider.of<Countprovider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countprovider.incrementcount();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final countprovider = Provider.of<Countprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<Countprovider>(
              builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: TextStyle(color: Colors.blue, fontSize: 50),
                );
              },
            ),
          ),
          Text(updatetime),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprovider.incrementcount();
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
