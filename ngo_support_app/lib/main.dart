import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'services/location_service.dart';
import 'services/local_database_service.dart';
import 'constants/app_branding.dart';
import 'views/auth/enhanced_login_screen.dart';
import 'views/services/service_divisions_screen.dart';
import 'views/home/home_screen.dart';
import 'views/emergency/emergency_screen.dart';
import 'views/auth/register_screen.dart';
import 'views/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize local database
  await LocalDatabaseService.database;
  
  runApp(const NGOSupportApp());
}

class NGOSupportApp extends StatelessWidget {
  const NGOSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<LocationService>(
          create: (_) => LocationService(),
        ),
      ],
      child: MaterialApp(
        title: AppBranding.appName,
        debugShowCheckedModeBanner: false,
        theme: AppBranding.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => AuthWrapper(),
          '/login': (context) => EnhancedLoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/services': (context) => ServiceDivisionsScreen(),
          '/emergency': (context) => EmergencyScreen(),
        },
      ),
    );
  }
}
