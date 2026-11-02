import 'package:flutter/material.dart';
import 'latihan1_push_pop.dart';
import 'latihan2_kirim_data.dart';
import 'latihan3_named_routes.dart';
// import 'bonus_bottom_nav.dart';

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
      // Mendaftarkan Named Routes untuk Latihan 3 agar berjalan di satu window
      routes: {
        '/halaman-dua': (context) => const HalamanDua(),
        '/halaman-tiga': (context) => const HalamanTiga(),
      },
      home: const MainWindowScreen(),
    );
  }
}

class MainWindowScreen extends StatefulWidget {
  const MainWindowScreen({super.key});

  @override
  State<MainWindowScreen> createState() => _MainWindowScreenState();
}

class _MainWindowScreenState extends State<MainWindowScreen> {
  int _selectedFileIndex = 0;

  // Daftar ke-4 file latihan yang ditampilkan di dalam 1 window
  final List<Widget> _daftarFileLatihan = const [
    BerandaPage(),          // Dari latihan1_push_pop.dart
    DaftarProdukPage(),     // Dari latihan2_kirim_data.dart
    HalamanSatu(),          // Dari latihan3_named_routes.dart
    // MainNavigationScreen(), // Dari bonus_bottom_nav.dart
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai menu Navbar yang dipilih
      body: _daftarFileLatihan[_selectedFileIndex],

      // Navbar Utama untuk berpindah antar-file latihan
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedFileIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedFileIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined),
            selectedIcon: Icon(Icons.swap_horiz_rounded),
            label: 'Latihan 1',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag_rounded),
            label: 'Latihan 2',
          ),
          NavigationDestination(
            icon: Icon(Icons.route_outlined),
            selectedIcon: Icon(Icons.route_rounded),
            label: 'Latihan 3',
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.stars_outlined),
          //   selectedIcon: Icon(Icons.stars_rounded),
          //   label: 'Bonus Tab',
          // ),
        ],
      ),
    );
  }
}