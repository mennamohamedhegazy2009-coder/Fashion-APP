import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/l10n/app_localizations.dart';
import 'package:flutter_application_1/core/route/app_route.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppLocalizations.of(context)!.appName,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          theme: AppTheme.lightMode,
          initialRoute: AppRoutes.forgotPassword,
          // onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
      
    );
  }
  }
    