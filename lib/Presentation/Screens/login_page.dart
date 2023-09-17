import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginpage/Domain/API/api_signin.dart';
import 'package:loginpage/Presentation/Screens/change_password.dart';
import 'package:loginpage/Presentation/Screens/home_page.dart';
import 'package:loginpage/Presentation/Widgets/continue_with.dart';
import 'package:loginpage/Presentation/Widgets/text_rich.dart';
import 'package:loginpage/Presentation/Widgets/unsuccesful_login_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //------------for delaying 1hour-------------------
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
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white, // Set the dialog background color to white
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              side: BorderSide(
                width: 2,
                color: Color(0xFFC2612C),
              ), // Border color
            ),
            content: Container(
              height: 235.h,
              width: 340.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
                child: Column(
                  children: [

                    Text(
                      'You have made 5 unsuccessful login attempts, reaching the maximum limit. Please try again after  ${Duration(milliseconds: remainingTime).toString().split('.').first} hour. \n\n ',
                      style: TextStyle(
                        color: Color(0xFFC2612C),
                        fontSize: 14.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 10.h,),
                    Text(
                      'If you require assistance, please contact Peppaca customer support at  ',
                      style: TextStyle(
                        color: Color(0xFFC2612C),
                        fontSize: 14.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.h,),
                    GestureDetector(
                      onTap: () {
                        SystemNavigator.pop();
                        // Navigator.pop(context);
                      },
                      child: Container(
                        width: 65.w,
                        height: 27.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFC2612C),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFD1D1D6)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Close',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        //   AlertDialog(
        //   title: Text('Lockout Alert'),
        //   content: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Text('You cannot sign in for 1 hour.'),
        //       Text(
        //           'Time Remaining: ${Duration(milliseconds: remainingTime).toString().split('.').first}'),
        //     ],
        //   ),
        //   actions: <Widget>[
        //     TextButton(
        //       child: Text('OK'),
        //       onPressed: () {
        //         Navigator.of(context).pop(); // Close the dialog
        //       },
        //     ),
        //   ],
        // );
      },
    );
  }


  @override
  void dispose() {
    lockoutTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
  //------------shared preferences--------------//

  final customerID = '';
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                Center(
                  child: Text(
                    'Welcome to Peppaca Seller',
                    style: TextStyle(
                      color: Color(0xFFC2612C),
                      fontSize: 22.sp,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 55.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1E000000),
                        blurRadius: 3,
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _emailEditingController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email address',
                      hintStyle: TextStyle(
                        color: Color(0xFF6E6E6E),
                        fontSize: 12.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF808080),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF808080),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF808080),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                if (!isEmailEmpty)
                  Container(
                    height: 20.h,
                    child: Visibility(
                      visible: !isPasswordEmpty,
                      child: Text(
                        'Email can’t be blank.',
                        style: TextStyle(
                          color: Color(0xFFEA4335),
                          fontSize: 12.sp,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox(height: 20.h),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1E000000),
                        blurRadius: 3,
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _passwordEditingController,
                    obscureText: _obscureText,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey),
                        onPressed: _togglePasswordVisibility,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0xFF6E6E6E),
                        fontSize: 12.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF808080),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF808080),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF808080),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                if (!isPasswordEmpty)
                  Container(
                    height: 20.h,
                    child: Visibility(
                      visible: !isPasswordEmpty,
                      child: Text(
                        'Password can’t be blank.',
                        style: TextStyle(
                          color: Color(0xFFEA4335),
                          fontSize: 12.sp,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox(height: 20.h),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                      },
                      child: Text(
                        'Forgot your password ?',
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 12.sp,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_emailEditingController.text.isEmpty ||
                        _passwordEditingController.text.isEmpty) {
                      if (_emailEditingController.text.isEmpty) {
                        setState(() {
                          isEmailEmpty = false;
                        });
                      } else {
                        setState(() {
                          isEmailEmpty = true;
                        });
                      }
                      if (isPasswordEmpty =
                          _passwordEditingController.text.isEmpty) {
                        setState(() {
                          isPasswordEmpty = false;
                        });
                      } else {
                        setState(() {
                          isPasswordEmpty = true;
                        });
                      }

                    } else {
                      final email = _emailEditingController.text.trim();
                      final password = _passwordEditingController.text.trim();
                      if (email == 'ram@gmail.com' && password == '1234') {
                        // Reset failed attempts on successful login
                        resetFailedAttempts();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                        // Navigate to the home screen or perform desired action
                        // For this example, we're displaying a success message
                        
                      } else {

                        // Increment failed attempts and check for lockout
                        incrementFailedAttempts();
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   backgroundColor: Color(0xFFEA4335),
                        //   content: Text('Login Unsuccessful!' ,style: TextStyle(color:Colors.white),),
                        // ));
                      }
                      // Map<String, dynamic> loginDetails= await ApiSignin().userSignIn(_emailEditingController.text, _passwordEditingController.text);
                      // loginDetails.map((key, value) => )
                    }

                  },
                  child: Container(
                    width: 339.w,
                    height: 55.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFC2612C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                      child: Divider(
                        color: Colors.grey.shade400,
                        height: 36.h,
                      ),
                    ),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                      color: Color(0xFF747070),
                      fontSize: 12.sp,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0.w, right: 10.0.w),
                      child: Divider(
                        color: Colors.grey.shade400,
                        height: 36.h,
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 24.h,
                ),
                ContinueWith(title:                     'Continue with Google',
                 svg: 'assets/svg/Google.svg'),
                SizedBox(
                  height: 16.h,
                ),
                ContinueWith(title: 'Continue with facebook', svg: 'assets/svg/Vector.svg'),
                SizedBox(
                  height: 16.w,
                ),
                ContinueWith(title: 'Continue with Apple', svg: 'assets/svg/Apple.svg'),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: TextRichh(),
                ),
              ],
            ),
          ),
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

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('You cannot sign in for 1 hour.'),
      // ));
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
