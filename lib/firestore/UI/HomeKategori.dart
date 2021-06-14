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
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
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
                  child: Container(
                    margin: EdgeInsets.fromLTRB(6, 7, 6, 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple[100],
                        child: Icon(
                          Icons.category_outlined,
                        ),
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
                          Icons.edit_location_sharp,
                          color: Colors.deepPurple,
                        ),
                        onTap: () {
                          //TODO 3 Panggil Fungsi untuk edit dari DB berdasarkan Item
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EntryFormKategori(
                                kategori[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
