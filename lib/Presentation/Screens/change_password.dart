import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginpage/Domain/API/api_signin.dart';
import 'package:loginpage/Presentation/Screens/login_page.dart';
import 'package:loginpage/Presentation/Widgets/security_alert_box.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _emailEditingController = TextEditingController();
  final _newpasswordEditingController = TextEditingController();
  final _confirmnewpasswordEditingController = TextEditingController();

  bool isNewEmailEmpty = true;
  bool isNewPasswordEmpty = true;
  bool isConfirmPasswordEmpty = true;
  bool isConfirmPasswordmatch = true;

  final _controller = SuperTooltipController();
  bool _obscurenewPassword = true;
  bool _obscureConfirmnewPassword = true;
  // void showtooltips() {
  //   _newpasswordEditingController.addListener(() {
  //     // Update the displayedText whenever the text changes
  //     setState(() {
  //       _controller.showTooltip();
  //     });
  //   });
  // }

  void _NewPasswordVisibility() {
    setState(() {
      _obscurenewPassword = !_obscurenewPassword;
    });
  }

  void _NewConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmnewPassword = !_obscureConfirmnewPassword;
    });
  }

  void initState() {
    super.initState();
    _newpasswordEditingController.addListener(() {
      // Check if password requirements are fulfilled
      String password = _newpasswordEditingController.text;

      if (password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[0-9]')) &&
          password.contains(RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,./?~-]')) &&
          password.length >= 8) {
        _controller.hideTooltip();
      } else {
        _controller.showTooltip();
      }
    });
  }
  // void initState() {
  //   super.initState();
  //   _newpasswordEditingController.addListener(() {
  //     // Show the SuperTooltip when the text field gains focus
  //     if (_newpasswordEditingController.text.isNotEmpty) {
  //       _controller.showTooltip();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push((MaterialPageRoute(
                            builder: (context) => LoginPage())));
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      )),
                  Text(
                    'Change the password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 31.h,
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
                            ]),
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
                            ))),
                    SizedBox(
                      height: 5.h,
                    ),
                    if (!isNewEmailEmpty)
                      Container(
                        height: 20.h,
                        child: Visibility(
                          visible: !isNewEmailEmpty,
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
                            ]),
                        child: TextField(
                            controller: _newpasswordEditingController,
                            obscureText: _obscurenewPassword,
                            obscuringCharacter: '●',
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurenewPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                                onPressed: _NewPasswordVisibility,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'New Password',
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
                            ))),
                    Container(
                      width: 300.w,
                      child: SuperTooltip(
                        borderWidth: 1.6,
                        borderColor: Color(0xFFC2612C),
                        shadowColor: Colors.transparent,
                        barrierColor: Colors.transparent,

                        backgroundColor: Colors.white,
                        // showCloseButton: false, // Remove close button
                        // showArrow: false, // Remove arrow
                        popupDirection:
                            TooltipDirection.down, // Direction of the tooltip
                        controller: _controller,
                        content: Container(
                          width: 298.w,
                          height: 95.85.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password must contain at least:',
                                style: TextStyle(
                                  color: Color(0xFFC2612C),
                                  fontSize: 10.sp,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .fiber_manual_record, // Use a black dot icon
                                      size: 6.sp, // Adjust the size as needed
                                      color: Color(
                                          0xFFC2612C), // Specify the color
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      'One uppercase letter',
                                      style: TextStyle(
                                        color: Color(0xFFC2612C),
                                        fontSize: 10.sp,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .fiber_manual_record, // Use a black dot icon
                                      size: 6, // Adjust the size as needed
                                      color: Color(
                                          0xFFC2612C), // Specify the color
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      'One number',
                                      style: TextStyle(
                                        color: Color(0xFFC2612C),
                                        fontSize: 10.sp,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .fiber_manual_record, // Use a black dot icon
                                      size: 6.sp, // Adjust the size as needed
                                      color: Color(
                                          0xFFC2612C), // Specify the color
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      'One special character (~`!@#\$%^&*()-_+={}[]|\;:"<>,./?)',
                                      style: TextStyle(
                                        color: Color(0xFFC2612C),
                                        fontSize: 10.sp,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .fiber_manual_record, // Use a black dot icon
                                      size: 6.sp, // Adjust the size as needed
                                      color: Color(
                                          0xFFC2612C), // Specify the color
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      '8 characters minimum',
                                      style: TextStyle(
                                        color: Color(0xFFC2612C),
                                        fontSize: 10.sp,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: SizedBox(
                          height: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    if (!isNewPasswordEmpty)
                      Container(
                        height: 20.h,
                        child: Visibility(
                          visible: !isNewPasswordEmpty,
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
                            ]),
                        child: TextField(
                            controller: _confirmnewpasswordEditingController,
                            obscureText: _obscureConfirmnewPassword,
                            obscuringCharacter: '●',
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _obscureConfirmnewPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.grey),
                                onPressed: _NewConfirmPasswordVisibility,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Confirm new password',
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
                            ))),
                    if (!isConfirmPasswordEmpty)
                      Container(
                        height: 20.h,
                        child: Visibility(
                          visible: !isConfirmPasswordEmpty,
                          child: Text(
                            'Password doesn\'t match.',
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
                    SizedBox(height: 20.h,),
    // if(_confirmnewpasswordEditingController.text.isNotEmpty &&
    // _confirmnewpasswordEditingController.text !=
    // _newpasswordEditingController.text) {
    // setState(() {
    // isConfirmPasswordMatch = false;
    // });
    // }


                      Container(
                        height: 20.h,
                        child: Visibility(
                          visible: !isConfirmPasswordmatch,
                          child: Text(
                            "Password doesn't match",
                            style: TextStyle(
                              color: Color(0xFFEA4335),
                              fontSize: 12.sp,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 325.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // ApiSignin().getSecureQuestions()

                          if (_emailEditingController.text.isEmpty) {
                            setState(() {
                              isNewEmailEmpty = false;
                            });
                          } else {
                            setState(() {
                              isNewEmailEmpty = true;
                            });
                          }
                          if (_newpasswordEditingController.text.isEmpty) {
                            setState(() {
                              isNewPasswordEmpty = false;
                            });
                          } else {
                            setState(() {
                              isNewPasswordEmpty = true;
                            });
                          }
                          if (_confirmnewpasswordEditingController
                              .text.isEmpty) {
                            setState(() {
                              isConfirmPasswordEmpty = false;
                            });
                          } else {
                            if (_confirmnewpasswordEditingController.text ==
                                _newpasswordEditingController)
                              setState(() {
                                isConfirmPasswordEmpty = true;
                                isConfirmPasswordmatch = false;
                              });
                          }
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return SecurityAlertBox();
                          //     });
                        },
                        child: Container(
                          width: 205.w,
                          height: 50.h,
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
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
