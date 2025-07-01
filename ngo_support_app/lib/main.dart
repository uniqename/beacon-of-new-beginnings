import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth_service_minimal.dart';
import 'services/location_service.dart';
import 'services/local_database_service.dart';
import 'constants/app_branding.dart';
import 'views/auth/optional_signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize local database
  await LocalDatabaseService.database;
  print('Beacon of New Beginnings - Production Ready');
  
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
        home: const OptionalSigninScreen(),
      ),
    );
  }
}
