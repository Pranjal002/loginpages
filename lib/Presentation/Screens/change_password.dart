import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  final _controller = SuperTooltipController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void makeTooltip() {
    _controller.showTooltip();
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push((MaterialPageRoute(
                              builder: (context) => LoginPage())));
                        },
                        icon: Icon(Icons.chevron_left)),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'Change the password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )
                  ],
                ),
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
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
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
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _togglePasswordVisibility,
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
                ),
                GestureDetector(
                  onTap: () {
                    _controller.showTooltip();
                  },
                  child: SuperTooltip(
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
                                  color: Color(0xFFC2612C), // Specify the color
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
                                  color: Color(0xFFC2612C), // Specify the color
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
                                  color: Color(0xFFC2612C), // Specify the color
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
                                  color: Color(0xFFC2612C), // Specify the color
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
                    child: Container(
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
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: _togglePasswordVisibility,
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
                  ),
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
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
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
                        'New password can’t be blank.',
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
                  height: 325.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
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
                      if (_confirmnewpasswordEditingController.text.isEmpty) {
                        setState(() {
                          isConfirmPasswordEmpty = false;
                        });
                      } else {
                        setState(() {
                          isConfirmPasswordEmpty = true;
                        });
                      }
                      // showDialog(context: context, builder: (BuildContext context){
                      //   return SecurityAlertBox();
                      // });
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
        ),
      ),
    );
  }
}
