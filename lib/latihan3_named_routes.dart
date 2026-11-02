import 'package:flutter/material.dart';

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({super.key});

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  final TextEditingController _pesanController = TextEditingController(
    text: 'Halo dari Halaman 1!',
  );

  @override
  void dispose() {
    _pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan 3: Halaman 1 (Named Routes)'),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Kirim Satu Argumen via Named Route',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _pesanController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Argumen Pesan',
                        prefixIcon: const Icon(Icons.message_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/halaman-dua',
                          arguments: _pesanController.text,
                        );
                      },
                      icon: const Icon(Icons.send_rounded),
                      label: const Text('Kirim ke Halaman 2'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
    final String argumenPesan =
        (ModalRoute.of(context)?.settings.arguments as String?) ??
            'Tidak ada argumen';

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 2'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Argumen Diterima di Halaman 2:',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"$argumenPesan"',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/halaman-tiga',
                        arguments: argumenPesan,
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Teruskan ke Halaman 3'),
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

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    final String argumenPesan =
        (ModalRoute.of(context)?.settings.arguments as String?) ??
            'Tidak ada argumen';

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 3 (Akhir)'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 64,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Argumen Berhasil Sampai di Halaman 3:',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"$argumenPesan"',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    icon: const Icon(Icons.restart_alt_rounded),
                    label: const Text('Kembali ke Halaman 1'),
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