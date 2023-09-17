import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRichh extends StatelessWidget {
  const TextRichh({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }
}
