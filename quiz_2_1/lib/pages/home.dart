import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _buildHorizontalRow(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                _buildHorizontalRow2(),
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                ),

                _buildHorizontalRow3(),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                ),
                _buildHorizontalRow4(),
                  Padding(
                  padding: EdgeInsets.only(bottom: 25),
                ),

                _buildHorizontalRow5(),
                //_buildRowAndColumn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildHorizontalRow() {
    return Row(children: [
      IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
      Text("Forgot Password?"),
      Padding(padding: EdgeInsets.only(left: 200)),
      IconButton(onPressed: () {}, icon: Icon(Icons.close))
    ]);
  }

  Row _buildHorizontalRow2() {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          "Enter Your Email that is used to send email",
          style: TextStyle(
            color: Colors.black
                .withOpacity(0.5), // Adjust opacity (0.5 for 50% opacity)
          ),
        ),
      ],
    );
  }

  Row _buildHorizontalRow3() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Email",
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16, // Adjust the font size as needed
                ),
              ),
              TextSpan(
                text: "*",
                style: TextStyle(
                  color: Colors.red, // Red color for the asterisk
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

Row _buildHorizontalRow4() {
    final TextEditingController emailController = TextEditingController();

    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Container(
          width: 370, // Set the width to 300
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter your email",
            ),
          ),
        ),
      ],
    );
  }
Row _buildHorizontalRow5() {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Container(
          width: 370, // Set the width to 370
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Set the button color to blue
            ),
            onPressed: () {
              // Add the functionality to send the link here
            },
            child: Text("Send link"),
          ),
        ),
      ],
    );
  }


  Row _buildRowAndColumn() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.yellow,
              height: 60.0,
              width: 60.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Container(
              color: Colors.amber,
              height: 40.0,
              width: 40.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Container(
              color: Colors.brown,
              height: 20.0,
              width: 20.0,
            ),
            Divider(),
            _buildRowAndStack(),
            Divider(),
            Text('End of the Line'),
          ],
        ),
      ],
    );
  }

  Row _buildRowAndStack() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 100.0,
          child: Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.yellow,
              ),
              Container(
                height: 60.0,
                width: 60.0,
                color: Colors.amber,
              ),
              Container(
                height: 40.0,
                width: 40.0,
                color: Colors.brown,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
