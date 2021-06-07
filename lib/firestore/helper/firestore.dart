import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_finpro_mobile/firestore/models/barang.dart';
import 'package:flutter_finpro_mobile/firestore/models/kategori.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //barang
  Future<void> saveBarang(Barang barang) {
    return _db.collection('barangs').doc(barang.barangId).set(barang.toMap());
  }

  Stream<List<Barang>> getBarangs() {
    return _db.collection('barangs').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Barang.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeBarang(String Id) {
    return _db.collection('barangs').doc(Id).delete();
  }

  //kategori
  Future<void> saveKategori(Kategori kategori) {
    return _db
        .collection('kategoris')
        .doc(kategori.kategoriId)
        .set(kategori.toMap());
  }

  Stream<List<Kategori>> getKategoris() {
    return _db.collection('kategoris').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Kategori.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeKategori(String Id) {
    return _db.collection('kategoris').doc(Id).delete();
  }
}
