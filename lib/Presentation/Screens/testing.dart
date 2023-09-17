import 'dart:async'; // Import the dart:async library

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int failedAttempts = 0;
  Timer? lockoutTimer; // Timer to manage the lockout countdown

  _SignInPageState() {
    checkLockout();
  }

  Future<void> checkLockout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int lastFailedTimestamp = prefs.getInt('lastFailedTimestamp') ?? 0;

    if (lastFailedTimestamp > 0) {
      // Calculate the current time
      int currentTime = DateTime.now().millisecondsSinceEpoch;

      // Calculate the time difference in milliseconds
      int timeDifference = currentTime - lastFailedTimestamp;

      // If the time difference is less than one hour (3600000 milliseconds),
      // show a lockout message and start the countdown timer
      if (timeDifference < 3600000) {
        int remainingTime = 3600000 - timeDifference;
        startLockoutTimer(remainingTime); // Start the countdown timer
        showLockoutDialog(remainingTime); // Show the lockout dialog
      } else {
        // If the lockout period has passed, reset the failed attempts
        resetFailedAttempts();
      }
    }
  }

  // Function to start the countdown timer
  void startLockoutTimer(int remainingTime) {
    lockoutTimer = Timer(Duration(milliseconds: remainingTime), () {
      // When the timer reaches 0, reset failed attempts
      resetFailedAttempts();
      lockoutTimer = null; // Reset the timer
    });
  }

  // Function to show the lockout dialog
  void showLockoutDialog(int remainingTime) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lockout Alert'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You cannot sign in for 1 hour.'),
              Text(
                  'Time Remaining: ${Duration(milliseconds: remainingTime).toString().split('.').first}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    lockoutTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform login logic
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                if (email == 'ram@gmail.com' && password == '1234') {
                  // Reset failed attempts on successful login
                  resetFailedAttempts();
                  // Navigate to the home screen or perform desired action
                  // For this example, we're displaying a success message
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login successful!'),
                  ));
                } else {
                  // Increment failed attempts and check for lockout
                  incrementFailedAttempts();
                }
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> incrementFailedAttempts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    failedAttempts = prefs.getInt('failedAttempts') ?? 0;
    failedAttempts++;

    if (failedAttempts >= 5) {
      // Set the timestamp of the last failed attempt
      prefs.setInt(
          'lastFailedTimestamp', DateTime.now().millisecondsSinceEpoch);
      // Display a message indicating lockout

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You cannot sign in for 1 hour.'),
      ));
      // Start the countdown timer and show the lockout dialog
      startLockoutTimer(3600000);
      showLockoutDialog(3600000);
    } else {
      // Update the count of failed attempts
      prefs.setInt('failedAttempts', failedAttempts);
    }
  }

  Future<void> resetFailedAttempts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('failedAttempts', 0);
    prefs.remove('lastFailedTimestamp'); // Remove the lockout timestamp
  }
}