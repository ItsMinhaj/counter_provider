import 'dart:async';

import 'package:count_provider/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter With Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(
              builder: (context, value, child) => Text(
                countProvider.counterValue.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
