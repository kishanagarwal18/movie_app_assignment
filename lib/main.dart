import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/notification_service.dart';
import 'core/utils/app_colors.dart';
import 'providers/movie_provider.dart';
import 'providers/favourites_provider.dart';
import 'providers/watchlist_provider.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => FavouritesProvider()),
        ChangeNotifierProvider(create: (_) => WatchlistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ✅ Global App Theme
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
      ),

      home: SplashScreen(),
    );
  }
}
