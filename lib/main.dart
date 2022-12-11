import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notebook/screens/add_screen.dart';
import 'package:notebook/screens/login_screen.dart';
import 'package:notebook/services/firestore_services.dart';
import 'package:notebook/utils/colors.dart';
import 'package:notebook/utils/styles.dart';
import 'package:sizer/sizer.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

final appColors = AppColors();
final appStyles = AppStyles();
final api = API();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notebook',
        theme: ThemeData(
          primaryColor: appColors.blueColor,
          textTheme: TextTheme(
            bodyText2: appStyles.bodyFont,
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(10.sp),
            border: appStyles.appBorderStyle,
            enabledBorder: appStyles.appBorderStyle,
            disabledBorder: appStyles.appBorderStyle,
            hintStyle: appStyles.smallBodyFont,
            labelStyle: GoogleFonts.robotoSlab(
              fontSize: 12.sp,
              color: appColors.blueColor,
            ),
          ),
          canvasColor: appColors.whiteColor,
          dividerColor: appColors.blueColor,
          splashColor: appColors.splashColor,
          textButtonTheme: appStyles.textButtonStyle,
          elevatedButtonTheme: appStyles.elevatedButtonStyle,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: appColors.blueColor),
        ),
        initialRoute:
            //  FirebaseAuth.instance.currentUser != null
            //     ? HomeScreen.idScreen
            //     :
            LoginScreen.idScreen,
        routes: {
          HomeScreen.idScreen: (context) => const HomeScreen(),
          LoginScreen.idScreen: (context) => const LoginScreen(),
          AddNoteScreen.idScreen: (context) => const AddNoteScreen(),
        },
      );
    });
  }
}
