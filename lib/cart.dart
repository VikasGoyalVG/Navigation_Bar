import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    required this.onCounterChange,
  });

  final void Function(int counter) onCounterChange;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    shape: const BeveledRectangleBorder(),
    fixedSize: const Size(120, 50),
  );

  int count = 0;

  void increaseCount() {
    count = count + 1;
    widget.onCounterChange(count);
  }

  void decreaseCount() {
    if (count == 0) {
      return;
    }
    count = count - 1;
    widget.onCounterChange(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: increaseCount,
              style: style,
              child: const Text('Increment'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: decreaseCount,
              style: style,
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
