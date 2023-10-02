import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

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
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
    }
  }

  double getBalance() {
    return _balance;
  }

  int getAccountNumber() {
    return _accountNumber;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      home: BankingScreen(),
    );
  }
}

class BankingScreen extends StatefulWidget {
  @override
  _BankingScreenState createState() => _BankingScreenState();
}

class _BankingScreenState extends State<BankingScreen> {
  BankAccount? account;
  double? amount;
  String? operationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banking App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  account = BankAccount();
                  operationResult =
                      'Account created successfully. Account number: ${account!.getAccountNumber()}';
                });
              },
              child: Text('Create Account'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (account != null) {
                  setState(() {
                    operationResult = null;
                  });
                  _showInputDialog(
                      context, 'Enter the amount to deposit:', true);
                } else {
                  setState(() {
                    operationResult =
                        'No account found. Please create an account first.';
                  });
                }
              },
              child: Text('Deposit'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (account != null) {
                  setState(() {
                    operationResult = null;
                  });
                  _showInputDialog(
                      context, 'Enter the amount to withdraw:', false);
                } else {
                  setState(() {
                    operationResult =
                        'No account found. Please create an account first.';
                  });
                }
              },
              child: Text('Withdraw'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (account != null) {
                  setState(() {
                    operationResult =
                        'Account balance: ${account!.getBalance()}';
                  });
                } else {
                  setState(() {
                    operationResult =
                        'No account found. Please create an account first.';
                  });
                }
              },
              child: Text('Check Balance'),
            ),
            SizedBox(height: 20),
            operationResult != null ? Text(operationResult!) : Container(),
          ],
        ),
      ),
    );
  }

  void _showInputDialog(
      BuildContext context, String labelText, bool isDeposit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isDeposit ? 'Deposit' : 'Withdraw'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              amount = double.tryParse(value);
            },
            decoration: InputDecoration(labelText: labelText),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (amount != null) {
                  setState(() {
                    if (isDeposit) {
                      account!.deposit(amount!);
                      operationResult = 'Deposit successful.';
                    } else {
                      account!.withdraw(amount!);
                      operationResult = 'Withdrawal successful.';
                    }
                  });
                } else {
                  setState(() {
                    operationResult =
                        'Invalid amount. Please enter a valid number.';
                  });
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
