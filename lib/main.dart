import 'dart:async';
import 'dart:developer';
import 'package:challenge_about_you/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  final appRouter = AppRouter();
  final app = App(appRouter: appRouter);
  runZonedGuarded(
          () => runApp(app),
          (error, stackTrace) => log(error.toString(), stackTrace: stackTrace)
  );
}
