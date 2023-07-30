import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_app/Widgets/theme.dart';
import 'package:units_app/models/units.dart';
import 'package:units_app/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UnitData(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: light,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.homepage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
