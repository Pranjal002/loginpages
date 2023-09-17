// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:super_tooltip/super_tooltip.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _controller = SuperTooltipController();
//
//   void makeTooltip() {
//     _controller.showTooltip();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Super Tooltip Example'),
//       ),
//       body: Column(
//         children: [
//
//           GestureDetector(
//             onTap: () {
//             },
//             child: SuperTooltip(
//               borderColor: Color(0xFFC2612C),
//               shadowColor: Colors.transparent,
//               barrierColor: Colors.transparent,
//
//               backgroundColor: Colors.white,
//               // showCloseButton: false, // Remove close button
//               // showArrow: false, // Remove arrow
//               popupDirection: TooltipDirection.down, // Direction of the tooltip
//               controller: _controller,
//               content: Container(
//                 width: 298.w,
//                 height: 95.85.h,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Password must contain at least:',
//                       style: TextStyle(
//                         color: Color(0xFFC2612C),
//                         fontSize: 10.sp,
//                         fontFamily: 'Open Sans',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 6.w),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.fiber_manual_record, // Use a black dot icon
//                             size: 6.sp, // Adjust the size as needed
//                             color: Color(0xFFC2612C), // Specify the color
//                           ),
//                           SizedBox(
//                             width: 7.w,
//                           ),
//                           Text(
//                             'One uppercase letter',
//                             style: TextStyle(
//                               color: Color(0xFFC2612C),
//                               fontSize: 10.sp,
//                               fontFamily: 'Open Sans',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 6.w),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.fiber_manual_record, // Use a black dot icon
//                             size: 6, // Adjust the size as needed
//                             color: Color(0xFFC2612C), // Specify the color
//                           ),
//                           SizedBox(
//                             width: 7.w,
//                           ),
//                           Text(
//                             'One number',
//                             style: TextStyle(
//                               color: Color(0xFFC2612C),
//                               fontSize: 10.sp,
//                               fontFamily: 'Open Sans',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:  EdgeInsets.only(left: 6.w),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.fiber_manual_record, // Use a black dot icon
//                             size: 6.sp, // Adjust the size as needed
//                             color: Color(0xFFC2612C), // Specify the color
//                           ),
//                           SizedBox(
//                             width: 7.w,
//                           ),
//                           Text(
//                             'One special character (~`!@#\$%^&*()-_+={}[]|\;:"<>,./?)',
//                             style: TextStyle(
//                               color: Color(0xFFC2612C),
//                               fontSize: 10.sp,
//                               fontFamily: 'Open Sans',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:  EdgeInsets.only(left: 6),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.fiber_manual_record, // Use a black dot icon
//                             size: 6.sp, // Adjust the size as needed
//                             color: Color(0xFFC2612C), // Specify the color
//                           ),
//                           SizedBox(width: 7.w,),
//                           Text(
//                             '8 characters minimum',
//                             style: TextStyle(
//                               color: Color(0xFFC2612C),
//                               fontSize: 10.sp,
//                               fontFamily: 'Open Sans',
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue,
//                 ),
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
