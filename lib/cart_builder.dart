import 'package:flutter/material.dart';

class CartBuilder extends StatefulWidget {
  final int index;
  final int itemCount;
  final double unitPrice;
  final String productName;
  final String productColor;
  final String productSize;
  final String imageURL;
  final ValueChanged<int> onItemAdded;
  final ValueChanged<int> onItemRemoved;

  const CartBuilder({
    super.key,
    required this.index,
    required this.itemCount,
    required this.unitPrice,
    required this.productName,
    required this.productColor,
    required this.productSize,
    required this.imageURL,
    required this.onItemAdded,
    required this.onItemRemoved,
  });

  @override
  _CartBuilderState createState() => _CartBuilderState();
}

class _CartBuilderState extends State<CartBuilder> {
  late TextEditingController imageURLController;

  @override
  void initState() {
    super.initState();
    imageURLController = TextEditingController(text: widget.imageURL);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _imageBuilder(),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.productName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const InkWell(
                      child: Icon(Icons.more_vert, color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'color: ',
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.productColor,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Size: ',
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.productSize,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: _quantityControls(),
                    ),
                    const Spacer(),
                    _displayCost()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _imageBuilder() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      ),
      child: SizedBox(
        width: 104,
        height: 104,
        child: Image.network(
          imageURLController.text,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row _quantityControls() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onItemRemoved(widget.index);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            elevation: 0.5,
          ),
          child: const Icon(Icons.remove),
        ),
        Text("${widget.itemCount}"),
        ElevatedButton(
          onPressed: () {
            widget.onItemAdded(widget.index);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            elevation: 0.5,
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Padding _displayCost() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('${widget.unitPrice}\$',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
