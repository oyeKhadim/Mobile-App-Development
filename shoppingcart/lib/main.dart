import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ShoppingCart {
  List<String> _items = [];

  void addItem(String item) {
    if (item.isNotEmpty) {
      _items.add(item);
    }
  }

  List<String> getItems() {
    return _items;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      home: ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  ShoppingCart cart = ShoppingCart();

  void _addItemToCart(String item) {
    setState(() {
      cart.addItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddItemDialog(addItem: _addItemToCart);
                  },
                );
              },
              child: Text('Add Item to Cart'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ViewCartDialog(cart: cart);
                  },
                );
              },
              child: Text('View Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddItemDialog extends StatelessWidget {
  final Function(String) addItem;
  final TextEditingController _itemController = TextEditingController();

  AddItemDialog({required this.addItem});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item to Cart'),
      content: TextField(
        controller: _itemController,
        decoration: InputDecoration(hintText: 'Enter item'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            String item = _itemController.text.trim();
            if (item.isNotEmpty) {
              addItem(item);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

class ViewCartDialog extends StatelessWidget {
  final ShoppingCart cart;

  ViewCartDialog({required this.cart});

  @override
  Widget build(BuildContext context) {
    List<String> cartItems = cart.getItems();

    return AlertDialog(
      title: Text('Cart Contents'),
      content: cartItems.isEmpty
          ? Text('Your cart is empty.')
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: cartItems
                  .asMap()
                  .entries
                  .map((entry) => ListTile(
                        title: Text('${entry.key + 1}. ${entry.value}'),
                      ))
                  .toList(),
            ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
