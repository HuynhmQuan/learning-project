import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project_1/all_json.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> savedCartItems = [];

  Future loadCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cartItemsDataPage =
        prefs.getStringList('cart_items') ?? [];
    setState(() {
      savedCartItems = cartItemsDataPage;
    });

    loadCartPriceTotal();
  }

  // LOAD CART PRICE TOTAL
  int priceTotal = 0;
  void loadCartPriceTotal() {
    int tempTotal = 0;
    for (var item in dataColors) {
      if (savedCartItems.contains(item['text'])) {
        tempTotal += (item['price'] as num).toInt();
      }
    }
    setState(() {
      priceTotal = tempTotal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.amberAccent,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 70,
              child: Padding(
                padding: const EdgeInsetsGeometry.all(20.0),
                child: savedCartItems.isEmpty
                    ? const Text('text')
                    : ListView.builder(
                        itemCount: savedCartItems.length,
                        itemBuilder: (context, index) {
                          String itemText = savedCartItems[index];
                          return ListTile(
                            leading: const Icon(
                              Icons.shopping_bag,
                              color: Colors.blue,
                            ),
                            title: Text(
                              itemText,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),

            const Divider(
              thickness: 5.0,
              color: Colors.white,
            ),

            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsetsGeometry.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$priceTotal đ',
                      style: const TextStyle(
                        fontSize: 35,
                      ),
                    ),

                    const SizedBox(
                      width: 30.0,
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'BUY',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
