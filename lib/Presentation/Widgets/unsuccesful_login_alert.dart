import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnsuccessfulLoginAlert extends StatefulWidget {
  const UnsuccessfulLoginAlert({super.key});

  @override
  State<UnsuccessfulLoginAlert> createState() => _UnsuccessfulLoginAlertState();
}

class _UnsuccessfulLoginAlertState extends State<UnsuccessfulLoginAlert> {
  @override
  Widget build(BuildContext context) {
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
                  'You have made 5 unsuccessful login attempts, reaching the maximum limit. Please try again after one hour. \n\n ',
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
                    Navigator.pop(context);
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
  }
}
