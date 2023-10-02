import 'dart:io';
import 'dart:math';

class BankAccount {
  int _accountNumber=0;
  double _balance=0.0;

  BankAccount() {
    // Generate a random account number
    _accountNumber = Random().nextInt(90000) + 10000;
    _balance = 0.0;
  }

  void deposit(double amount) {
    _balance += amount;
    print('Deposit successful.');
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      print('Withdrawal successful.');
    } else {
      print('Insufficient funds.');
    }
  }

  double getBalance() {
    return _balance;
  }

  int getAccountNumber() {
    return _accountNumber;
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
  BankAccount? account;
  int? choice;

  print('Banking System Program');

  do {
    print('1. Create Account');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Check Balance');
    print('5. Exit');
    stdout.write('Enter your choice: ');

    try {
      choice = int.tryParse(stdin.readLineSync()!);

      if (choice == 1) {
        account = BankAccount();
        print(
            'Account created successfully. Account number: ${account.getAccountNumber()}');
      } else if (choice == 2) {
        if (account != null) {
          stdout.write('Enter the amount to deposit: ');
          double amount = double.parse(stdin.readLineSync()!);
          account.deposit(amount);
        } else {
          print('No account found. Please create an account first.');
        }
      } else if (choice == 3) {
        if (account != null) {
          stdout.write('Enter the amount to withdraw: ');
          double amount = double.parse(stdin.readLineSync()!);
          account.withdraw(amount);
        } else {
          print('No account found. Please create an account first.');
        }
      } else if (choice == 4) {
        if (account != null) {
          print('Account balance: ${account.getBalance()}');
        } else {
          print('No account found. Please create an account first.');
        }
      } else if (choice == 5) {
        print('Exiting the program. Thank you!');
      } else {
        print('Invalid choice. Please try again.');
      }
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
      choice = 0;
    }

    // Wait for user to acknowledge before displaying the menu again
    if (choice != 5) {
      stdout.write('Press Enter to continue...');
      stdin.readLineSync();
      clearScreen();
    }
  } while (choice != 5);
}
