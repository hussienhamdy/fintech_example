import 'package:fintech_example/core/presentation/screens/main_screen.dart';
import 'package:fintech_example/core/utils/app_colors.dart';
import 'package:fintech_example/core/utils/constants.dart';
import 'package:fintech_example/core/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        // adjusting the size for web or mobile
        designSize: Size(width > 600 ? 1366 : 430, width > 600 ? 768 : 932),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.background,
                appBarTheme: AppBarTheme(
                    titleTextStyle: mainTextStyle.copyWith(
                        color: AppColors.primaryText, fontSize: 20.sp),
                    backgroundColor: AppColors.bottomNavbarBackground),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedIconTheme:
                        IconThemeData(size: 30.w, color: AppColors.blue),
                    selectedItemColor: AppColors.blue,
                    selectedLabelStyle: mainTextStyle.copyWith(fontSize: 14.sp),
                    unselectedItemColor: AppColors.primaryText,
                    unselectedIconTheme:
                        IconThemeData(size: 24.w, color: Colors.white),
                    backgroundColor: AppColors.bottomNavbarBackground),
                textTheme: TextTheme(
                  labelSmall: mainTextStyle.copyWith(
                      color: AppColors.primaryText, fontSize: 12.sp),
                  labelMedium: mainTextStyle.copyWith(
                      color: AppColors.primaryText, fontSize: 14.sp),
                  labelLarge: mainTextStyle.copyWith(
                      color: AppColors.primaryText, fontSize: 16.sp),
                ),
              ),
              home: const MainScreen());
        });
  }
}
