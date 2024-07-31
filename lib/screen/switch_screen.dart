import 'package:flutter/material.dart';
import 'package:provider_basic_example/screen/container_screen.dart';
import 'package:provider_basic_example/screen/count_screen.dart';
import 'package:provider_basic_example/screen/favourite_screen.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        title: const Text(
          'PROVIDER',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CountScreen();
                  },
                ));
              },
              child: const Text(
                'COUNTER PROVIDER EXAMPLE',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ContainerScreen();
                    },
                  ));
                },
                child: const Text(
                  'CONTAINER PROVIDER EXAMPLE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const FavouriteScreen();
                      },
                    ));
                  },
                  child: const Text(
                    'FAVOURITE PROVIDER EXAMPLE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )))
        ],
      ),
    );
  }
}
