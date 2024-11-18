import 'package:flutter/material.dart';
import 'package:wisata_candi_rismanto/screens/detail_screen.dart';

import '../models/candi.dart';
class ItemCard extends StatelessWidget {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // TODO: 6. implementasi routing ke detailScreen
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(candi: candi),
            ),
          );
        },
      child: Card(
      // TODO: 2. Tetapkan parameter shape, margin, dan elevation dari cari
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),

      ),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: 3. buat image sebagai anak dari column
          Expanded(
            // TODO; 7. Implementasi Hero animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                    candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
          ),
          // TODO: 4. buat Text sebagai anak dari column
          Text(
            candi.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,

            ),
          ),
          // TODO: 5. buat Text sebagai anak dari column
          Padding(
            padding: const EdgeInsets.only(
                left: 16,
            bottom: 8),
            child: Text(
              candi.type,
              style: TextStyle(
                fontSize: 12,
               ),
             ),
           ),
          ],
       ),
      ),
    );
  }
}
