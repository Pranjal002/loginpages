import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginpage/Domain/API/api_signin.dart';
import 'package:loginpage/Presentation/Screens/change_password.dart';
import 'package:loginpage/Presentation/Widgets/unsuccesful_login_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final customerID ='';
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
                SizedBox(height: 5.h,),
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
                        icon: Icon(_obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,color:Colors.grey),
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
                SizedBox(height: 5.h,),

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
                  onTap: () async{
                    if (_emailEditingController.text.isEmpty || _passwordEditingController.text.isEmpty) {
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
                    }else {
                      print('login');
                      // Map<String, dynamic> loginDetails= await ApiSignin().userSignIn(_emailEditingController.text, _passwordEditingController.text);
                      // loginDetails.map((key, value) => )
                      



                    }
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            UnsuccessfulLoginAlert());

                    // if (!isEmailEmpty && !isPasswordEmpty) {
                    //   // Perform your authentication logic here
                    //   final isAuthenticated = await _authenticateUser(
                    //       _emailEditingController.text, _passwordEditingController.text);
                    //
                    //   if (isAuthenticated) {
                    //     // Navigate to the next screen or perform any other action upon successful login
                    //     print("Login successful!");
                    //   } else {
                    //     // Show an error message or handle failed login
                    //     print("Login failed. Invalid email or password.");
                    //   }
                    // }
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
                    child:  Container(
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
                    child:  Container(
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
                Container(
                  width: 339.w,
                  height: 44.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 70.w),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/Google.svg'),
                        SizedBox(
                          width: 22.w,
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 339.w,
                  height: 44.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 70.w),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/Vector.svg'),
                        SizedBox(
                          width: 22.w,
                        ),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.w,
                ),
                Container(
                  width: 339.w,
                  height: 44.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 70.w),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/Apple.svg'),
                        SizedBox(
                          width: 22.w,
                        ),
                        Text(
                          'Continue with Apple',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By signing up, you agree to Peppaca’s ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ', ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ', \nand ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Cookie Use',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
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
