import 'package:flutter/material.dart';

class DialogUtils {
  static void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(239, 46),
                maximumSize: const Size(239, 46),
              ),
              child: const Text(
                'OKAY',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showAdd5UnitsDialog(BuildContext context, String itemName) {
    final message = 'You have added\n 5 \n $itemName on your bag!';
    _showDialog(context, 'Congratulations!', message);
  }
}
