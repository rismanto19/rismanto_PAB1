import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel untuk menyimpan label aksi
  String actionLabel = 'Belum ada aksi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interaction'), // Judul appbar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun children di tengah
          children: [
            // GestureDetector membungkus Container
            GestureDetector(
              onTap: () {
                setState(() {
                  actionLabel = 'Pengguna melakukan Tap';
                });
              },
              onDoubleTap: () {
                setState(() {
                  actionLabel = 'Pengguna melakukan Double Tap';
                });
              },
              onLongPress: () {
                setState(() {
                  actionLabel = 'Pengguna melakukan Long Press';
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25), // Sudut melengkung
                ),
                child: Center(
                  child: Text(
                    'Aksi', // Teks yang ada di dalam Container
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                      fontSize: 18, // Ukuran font
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Spasi antara Container dan Text
            Text(
              actionLabel, // Menampilkan status aksi
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
