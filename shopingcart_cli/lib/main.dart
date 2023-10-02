import 'dart:io';

class ShoppingCart {
  List<String> _items = [];

  void addItem(String item) {
    _items.add(item);
    print('Item added to the cart.');
  }

  void viewCart() {
    if (_items.isEmpty) {
      print('Your cart is empty.');
    } else {
      print('Items in the cart:');
      for (int i = 0; i < _items.length; i++) {
        print('${i + 1}. ${_items[i]}');
      }
    }
  }
}

void clearScreen() {
  if (Platform.isWindows) {
    // Clear the screen for Windows
    print('\x1B[2J\x1B[0;0H');
  } else {
    // Clear the screen for other platforms
    print('\x1B[2J\x1B[3J\x1B[H');
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();
  int choice;

  clearScreen();
  do {
    print('Shopping Cart Program');
    print('1. Add item to cart');
    print('2. View cart');
    print('3. Exit');
    stdout.write('Enter your choice: ');

    try {
      choice = int.parse(stdin.readLineSync()!);

      if (choice == 1) {
        stdout.write('Enter the item to add to the cart: ');
        String item = stdin.readLineSync()!;
        cart.addItem(item);
      } else if (choice == 2) {
        clearScreen();
        print('Cart contents:');
        cart.viewCart();
      } else if (choice == 3) {
        print('Exiting the program. Thank you.');
      } else {
        print('Invalid choice. Please try again.');
      }
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
      choice = 0;
    }

    // Wait for user to acknowledge before clearing screen
    if (choice != 3) {
      stdout.write('Press Enter to continue...');
      stdin.readLineSync();
      clearScreen();
    }
  } while (choice != 3);
}
