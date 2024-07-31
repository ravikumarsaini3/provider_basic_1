import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic_example/provider/provider_container.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  @override
  Widget build(BuildContext context) {
    print('object');
    final provider = Provider.of<ProviderContainer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider Example',
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ProviderContainer>(
              builder: (context, value, child) {
                return Slider(
                  divisions: 3,
                  activeColor: Colors.blue,
                  autofocus: true,
                  secondaryActiveColor: Colors.green,
                  value: value.value,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (val) {
                    provider.setvalue(val);
                  },
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<ProviderContainer>(
              builder: (context, value, child) => Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 90,
                      color: const Color.fromARGB(255, 247, 22, 5)
                          .withOpacity(value.value),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 91,
                      color: const Color.fromARGB(255, 7, 232, 14)
                          .withOpacity(value.value),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
