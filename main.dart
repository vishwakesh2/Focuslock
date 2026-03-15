import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/focus_provider.dart';
import 'screens/home_screen.dart';
import 'screens/setup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF0A0A0F),
  ));
  final prefs = await SharedPreferences.getInstance();
  final setupDone = prefs.getBool('setup_done') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => FocusProvider(prefs),
      child: FocusLockApp(setupDone: setupDone),
    ),
  );
}

class FocusLockApp extends StatelessWidget {
  final bool setupDone;
  const FocusLockApp({super.key, required this.setupDone});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusLock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF3CAC),
          secondary: Color(0xFF784BA0),
          surface: Color(0xFF0A0A0F),
          background: Color(0xFF0A0A0F),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        fontFamily: 'Roboto',
      ),
      home: setupDone ? const HomeScreen() : const SetupScreen(),
    );
  }
}
