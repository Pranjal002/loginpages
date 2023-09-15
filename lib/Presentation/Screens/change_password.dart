import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginpage/Presentation/Screens/login_page.dart';
import 'package:loginpage/Presentation/Widgets/security_alert_box.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _emailEditingController =TextEditingController();
  final _newpasswordEditingController =TextEditingController();
  final _confirmnewpasswordEditingController =TextEditingController();
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
                SizedBox(height: 31.h,),
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
                SizedBox(height: 33.h,),
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
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(

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

                SizedBox(height: 33.h,),

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
                SizedBox(height: 325.h,),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return SecurityAlertBox();
                      });
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
