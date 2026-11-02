import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final String harga;
  final IconData ikon;

  const Produk({
    required this.nama,
    required this.harga,
    required this.ikon,
  });
}

class DaftarProdukPage extends StatelessWidget {
  const DaftarProdukPage({super.key});

  final List<Produk> daftarProduk = const [
    Produk(
      nama: 'Mechanical Keyboard Wireless',
      harga: 'Rp 850.000',
      ikon: Icons.keyboard_alt_rounded,
    ),
    Produk(
      nama: 'Mouse Gaming Ergonomis',
      harga: 'Rp 450.000',
      ikon: Icons.mouse_rounded,
    ),
    Produk(
      nama: 'Monitor IPS 27 Inch 144Hz',
      harga: 'Rp 2.750.000',
      ikon: Icons.desktop_windows_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan 2: Daftar 3 Produk'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: daftarProduk.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  produk.ikon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(
                produk.nama,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                produk.harga,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProdukPage(produk: produk),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailProdukPage extends StatelessWidget {
  final Produk produk;

  const DetailProdukPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(
                      produk.ikon,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    produk.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      produk.harga,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FilledButton.tonalIcon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Kembali ke Daftar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}