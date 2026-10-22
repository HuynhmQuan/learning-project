import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test_project_1/data_row.dart';
import 'package:flutter_test_project_1/cart_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  Color getRandomColor() {
    final randomColor = Random();
    return Color.fromARGB(
      255,
      randomColor.nextInt(256),
      randomColor.nextInt(256),
      randomColor.nextInt(256),
    );
  }

  // void addToCart() {
  //   ConstantsNotifier.isAddedNotifier.value =
  //       !ConstantsNotifier.isAddedNotifier.value;
  //   print('added');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catalog',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CartPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SafeArea(child: DataColor()),
      ),
    );
  }
}
