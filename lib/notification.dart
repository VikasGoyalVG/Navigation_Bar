import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.onCounterChange});

  final void Function(int counter) onCounterChange;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        title: const Text('Notification'),
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
