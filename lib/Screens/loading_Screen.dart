import 'package:flutter/material.dart';
import 'package:quiz_app_firebase/Screens/sign_in.dart';
import 'package:quiz_app_firebase/Screens/sign_up.dart';

class LoadingScreeN extends StatefulWidget {
  const LoadingScreeN({super.key});

  @override
  State<LoadingScreeN> createState() => _LoadingScreeNState();
}

class _LoadingScreeNState extends State<LoadingScreeN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor:  const Color.fromARGB(255, 233, 199, 238),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                  child: Container(height: 90,
                  width: 140,
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(12)),
                               child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 25),)),
                  ),
                ),
                SizedBox(height: 20,),
                 GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                  },
                   child: Container(height: 90,
                                 width: 140,
                                 decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(12)),
                                child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 25),)),
                                 ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}