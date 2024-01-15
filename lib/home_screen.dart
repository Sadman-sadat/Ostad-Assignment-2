import 'package:flutter/material.dart';
import 'card_widget.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalAmount = 0.0;

  void updateTotalAmount() {
    setState(() {
      totalAmount = calculateTotalPrice();
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < items.length; i++) {
      totalPrice += itemQuantities[i] * items[i]['price'];
    }
    return totalPrice;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("My Bag",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                ),
                CardWidget(onItemChanged: updateTotalAmount),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Amount',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300)),
                    Text('\$${totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Congratulations! Your order has been placed.'),
                        margin: EdgeInsets.only(bottom: 100),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(343, 48),
                    maximumSize: const Size(343, 48),
                  ),
                  child: const Text('Checkout'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
