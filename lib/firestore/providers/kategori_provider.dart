import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/firestore/helper/firestore.dart';
import 'package:flutter_finpro_mobile/firestore/models/kategori.dart';
import 'package:uuid/uuid.dart';

class KategoriProvider with ChangeNotifier {
  final firestore = FirestoreService();

  String _kategoriId;
  String _namakategori;
  String _deskripsi;

  var uuid = Uuid();

  //Getters
  String get kategoriId => _kategoriId;
  String get namakategori => _namakategori;
  String get deskripsi => _deskripsi;

  //Setters
  changekategoriId(String value) {
    _kategoriId = value;
    notifyListeners();
  }

  changeNamaKategori(String value) {
    _namakategori = value;
    notifyListeners();
  }

  changeDeskripsi(String value) {
    _deskripsi = value;
    notifyListeners();
  }

  //read
  loadValues(Kategori kategori) {
    _kategoriId = kategori.kategoriId;
    _namakategori = kategori.namakategori;
    _deskripsi = kategori.deskripsi;
  }

//create/update
  saveKategori() {
    print(_kategoriId);
    if (_kategoriId == null) {
      var newKategori = Kategori(
          namakategori: namakategori,
          deskripsi: deskripsi,
          kategoriId: uuid.v4());
      firestore.saveKategori(newKategori);
    } else {
      //Update
      var updateKategori = Kategori(
          kategoriId: kategoriId,
          namakategori: namakategori,
          deskripsi: deskripsi);
      firestore.saveKategori(updateKategori);
    }
  }

//delete
  removeKategori(String kategoriId) {
    firestore.removeKategori(kategoriId);
  }
}
