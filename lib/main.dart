import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpage/Domain/model/hive_constants.dart';
import 'package:loginpage/Presentation/Screens/login_page.dart';
import 'package:loginpage/Presentation/Widgets/custom_tool_tip.dart';
import 'package:hive/hive.dart';
Future<void> initializeHive() async {
  // Open the 'Setting' box (you can replace 'Setting' with the desired box name)
  boxSetting = await Hive.openBox(settingBox);
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initializeHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size(375, 812),
        builder: (_, child) {

      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginPage());
    });
  }
}
