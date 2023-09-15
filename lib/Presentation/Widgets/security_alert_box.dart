import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecurityAlertBox extends StatefulWidget {
  const SecurityAlertBox({super.key});

  @override
  State<SecurityAlertBox> createState() => _SecurityAlertBoxState();
}

class _SecurityAlertBoxState extends State<SecurityAlertBox> {
  String selectedTitle = 'Mr.';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        '\n Please answer the security question:\n',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
      content: Column(
        children: [
          Row(
            children: [
              Text(
                ' Select your question ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(width: 2.w,),
              Text('*',style: TextStyle(color: Colors.red,fontSize: 16.sp),),

            ],
          ),
          Container(
            width: 290.w,
            height: 44.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: DropdownButton<String>(
              value: selectedTitle,
              onChanged: (newValue) {
                setState(() {
                  selectedTitle = newValue!;
                });
              },
              items: <String>['Mr.', 'Mrs.']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
                  .toList(),
            ),
          ),
          Row(
            children: [
              Text(
                ' Answer your question ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(width: 2.w,),
              Text('*',style: TextStyle(color: Colors.red,fontSize: 16.sp),),
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


            ],
          ),

        ],
      ),
    );
  }
}
