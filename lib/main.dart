import 'package:flutter/material.dart';
import 'bonus_bottom_nav.dart';
import 'latihan3_named_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Pertemuan 3 - Pemrograman Mobile 5A',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      // Mendaftarkan Named Routes untuk Latihan 3
      routes: {
        '/halaman-dua': (context) => const HalamanDua(),
        '/halaman-tiga': (context) => const HalamanTiga(),
      },
      home: const MainNavigationScreen(),
    );
  }
}
