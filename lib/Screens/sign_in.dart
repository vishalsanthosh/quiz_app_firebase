import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app_firebase/Screens/homescreen.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late Box box;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _loginmessage = "";

  @override
  void initState() {
    super.initState();
    box = Hive.box('box');
  }

  void _login() {
    setState(() {
      String storedusername = box.get('username');
      String storedpassword = box.get('password');

      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        _loginmessage = "Please enter both username and password";
      } else if (storedusername == usernameController.text &&
          storedpassword == passwordController.text) {
        _loginmessage = "Login successful";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizHome()),
        );
      } else {
        _loginmessage = "Invalid credentials";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 199, 238),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Sign In",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 50, 150, 255),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Username",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text("Sign In"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 50, 150, 255),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _loginmessage,
                style: TextStyle(
                  color: _loginmessage == "Login successful"
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
