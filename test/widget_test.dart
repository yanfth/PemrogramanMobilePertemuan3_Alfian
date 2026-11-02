import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mengimpor semua file yang ada di folder lib/
import 'package:untitled/main.dart';
import 'package:untitled/latihan1_push_pop.dart';
import 'package:untitled/latihan2_kirim_data.dart';
import 'package:untitled/latihan3_named_routes.dart';
import 'package:untitled/bonus_bottom_nav.dart';

void main() {
  testWidgets('1. Menguji tampilan utama MyApp dan Navbar 1 Window', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Memastikan aplikasi utama berhasil dimuat
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('2. Menguji Latihan 1 (Push & Pop - Beranda ke Tentang)', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BerandaPage()));

    // Memastikan halaman Beranda tampil
    expect(find.byType(BerandaPage), findsOneWidget);

    // Menekan tombol untuk berpindah ke halaman Tentang (Push)
    await tester.tap(find.text('Buka Halaman Tentang'));
    await tester.pumpAndSettle();

    // Memastikan halaman Tentang terbuka
    expect(find.byType(TentangPage), findsOneWidget);
  });

  testWidgets('3. Menguji Latihan 2 (Kirim Data 3 Produk ke Detail)', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DaftarProdukPage()));

    // Memastikan daftar produk tampil
    expect(find.byType(DaftarProdukPage), findsOneWidget);
    expect(find.text('Mechanical Keyboard Wireless'), findsOneWidget);

    // Mengetuk produk pertama untuk membuka halaman detail
    await tester.tap(find.text('Mechanical Keyboard Wireless'));
    await tester.pumpAndSettle();

    // Memastikan DetailProdukPage tampil beserta harga produknya
    expect(find.byType(DetailProdukPage), findsOneWidget);
    expect(find.text('Rp 850.000'), findsOneWidget);
  });

  testWidgets('4. Menguji Latihan 3 (Named Routes & Kirim 1 Argumen)', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HalamanSatu(),
          '/halaman-dua': (context) => const HalamanDua(),
          '/halaman-tiga': (context) => const HalamanTiga(),
        },
      ),
    );

    // Memastikan Halaman 1 tampil dan mengirim argumen ke Halaman 2
    expect(find.byType(HalamanSatu), findsOneWidget);
    await tester.tap(find.text('Kirim ke Halaman 2'));
    await tester.pumpAndSettle();

    // Memastikan Halaman 2 menerima argumen
    expect(find.byType(HalamanDua), findsOneWidget);
  });

  testWidgets('5. Menguji Bonus (BottomNavigationBar 3 Tab)', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainNavigationScreen()));

    // Memastikan BottomNavigationBar beserta 3 tab (Beranda, Cari, Profil) tampil
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Cari'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);
  });
}