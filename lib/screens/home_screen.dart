import 'package:flutter/material.dart';
import 'package:wisata_candi_rismanto/data/candi_data.dart';
import 'package:wisata_candi_rismanto/models/candi.dart';
import 'package:wisata_candi_rismanto/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 1 buat appbar dengan judul wisata candi
      appBar: AppBar(title: Text('wisata Candi'),),
      // TODO: 2 buat body dengan GridView.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          ),
          padding: EdgeInsets.all(8),
          itemCount: candiList.length,
          itemBuilder: (context, index) {
            Candi candi = candiList[index];
            return ItemCard(candi: candi);
          }
          ),
    );
  }
}