import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/firestore/models/kategori.dart';
import 'package:flutter_finpro_mobile/firestore/providers/kategori_provider.dart';
import 'package:provider/provider.dart';

import 'EntryFormKategori.dart';

class HomeKategori extends StatefulWidget {
  final Kategori kategori;

  HomeKategori([this.kategori]);

  @override
  _HomeKategoriState createState() => _HomeKategoriState();
}

class _HomeKategoriState extends State<HomeKategori> {
  @override
  Widget build(BuildContext context) {
    final kategori = Provider.of<List<Kategori>>(context);
    final kategoris = Provider.of<KategoriProvider>(context);

    return Scaffold(
        body: Container(
            child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Kategori',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Candara Bold',
          ),
        ),
        backgroundColor: Color.fromRGBO(49, 39, 79, 1),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EntryFormKategori(),
                ),
              );
            },
          )
        ],
      ),
      body: (kategori != null)
          ? ListView.builder(
              itemCount: kategori.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[100],
                      child: Icon(Icons.book),
                    ),
                    title: Text(
                      kategori[index].namakategori,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Deskripsi : ' + kategori[index].deskripsi,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                      ),
                    ),
                    trailing: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      onTap: () {
                        //TODO 3 Panggil Fungsi untuk delete dari DB berdasarkan Item
                        kategoris.removeKategori(widget.kategori.kategoriId);
                        Navigator.of(context).pop();
                      },
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EntryFormKategori(
                            kategori[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    )));
  }
}
