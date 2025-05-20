import 'package:flutter/material.dart';

import 'core/network/network_info.dart';
import 'router/app_router.dart';

// Temporary implementation of NetworkInfo for demo purposes
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async => true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {


  const MyApp({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Talent Insider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // ⬅️ latar belakang utama
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFAA0A24),       // warna merah utama
          onPrimary: Colors.white,          // teks di atas warna utama
          surface: Color(0xFF1E1E1E),        // latar card/form field
          onSurface: Colors.white70,        // teks di atas surface
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
