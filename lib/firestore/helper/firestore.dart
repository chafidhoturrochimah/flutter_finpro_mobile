import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_finpro_mobile/firestore/models/barang.dart';
import 'package:flutter_finpro_mobile/firestore/models/kategori.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  //barang
  Future<void> saveBarang(Barang barang) {
    return _db.collection('barang').doc(barang.barangId).set(barang.toMap());
  }

  Stream<List<Barang>> getBarang() {
    return _db.collection('barang').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Barang.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeBarang(String barangId) {
    return _db.collection('barang').doc(barangId).delete();
  }

  //kategori
  Future<void> saveKategori(Kategori kategori) {
    return _db
        .collection('kategori')
        .doc(kategori.kategoriId)
        .set(kategori.toMap());
  }

  Stream<List<Kategori>> getKategori() {
    return _db.collection('kategori').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Kategori.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeKategori(String kategoriId) {
    return _db.collection('kategori').doc(kategoriId).delete();
  }
}
