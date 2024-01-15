import 'package:assignment/show_dialogues.dart';
import 'package:flutter/material.dart';
import 'cart_builder.dart';
import 'constants.dart';

class CardWidget extends StatefulWidget {
  final VoidCallback onItemChanged;

  const CardWidget({
    Key? key,
    required this.onItemChanged,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _addItem(int index) {
    setState(() {
      itemQuantities[index]++;
      if (itemQuantities[index] == 5) {
        DialogUtils.showAdd5UnitsDialog(context, items[index]['productName']);
      }
      widget.onItemChanged();
    });
  }

  void _removeItem(int index) {
    setState(() {
      itemQuantities[index] =
          (itemQuantities[index] > 0) ? itemQuantities[index] - 1 : 0;
      widget.onItemChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CartBuilder(
              index: index,
              itemCount: itemQuantities[index],
              unitPrice: items[index]['price'],
              onItemAdded: _addItem,
              onItemRemoved: _removeItem,
              productName: items[index]['productName'],
              productColor: items[index]['productColor'],
              productSize: items[index]['productSize'],
              imageURL: items[index]['imageURL'],
            ),
          );
        },
      ),
    );
  }
}
