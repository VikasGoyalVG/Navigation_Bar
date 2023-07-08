import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key, required this.onCounterChange,});

  final void Function(int counter) onCounterChange;
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
        title: const Text('Favourite'),
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
