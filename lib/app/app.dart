
import 'package:challenge_about_you/navigation/app_router.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:challenge_about_you/theme/colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key, required AppRouter appRouter}) :
        _appRouter = appRouter,
        super(key: key);

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge About You',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(color: AppColors.violet3B),
      ),
      initialRoute: Routes.root,
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}