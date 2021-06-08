import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/firestore/helper/firestore.dart';
import 'package:flutter_finpro_mobile/firestore/models/barang.dart';
import 'package:uuid/uuid.dart';

class BarangProvider with ChangeNotifier {
  final firestore = FirestoreService();

  String _barangId;
  String _kodeBrg;
  String _namakategori;
  String _namaBrg;
  int _harga;
  int _stokAwal;
  int _inBrg;
  int _outBrg;
  int _stokAkhir;

  var uuid = Uuid();

  //Getters
  String get barangId => _barangId;
  String get kodeBrg => _kodeBrg;
  String get namakategori => _namakategori;
  String get namaBrg => _namaBrg;
  int get harga => _harga;
  int get stokAwal => _stokAwal;
  int get inBrg => _inBrg;
  int get outBrg => _outBrg;
  int get stokAkhir => _stokAkhir;

  //Setters
  changebarangId(String value) {
    _barangId = (value);
    notifyListeners();
  }

  changekodeBrg(String value) {
    _kodeBrg = (value);
    notifyListeners();
  }

  changenamakategori(String value) {
    _namakategori = value;
    notifyListeners();
  }

  changenamaBrg(String value) {
    _namaBrg = value;
    notifyListeners();
  }

  changeharga(String value) {
    _harga = int.parse(value);
    notifyListeners();
  }

  changestokAwal(String value) {
    _stokAwal = int.parse(value);
    notifyListeners();
  }

  changeinBrg(String value) {
    _inBrg = int.parse(value);
    notifyListeners();
  }

  changeoutBrg(String value) {
    _outBrg = int.parse(value);
    notifyListeners();
  }

  changestokAkhir(String value) {
    _stokAkhir = int.parse(value);
    notifyListeners();
  }

  //read
  loadValues(Barang barang) {
    _barangId = barang.barangId;
    _kodeBrg = barang.kodeBrg;
    _namakategori = barang.namakategori;
    _namaBrg = barang.namaBrg;
    _harga = barang.harga;
    _stokAwal = barang.stokAwal;
    _inBrg = barang.inBrg;
    _outBrg = barang.outBrg;
    _stokAkhir = barang.stokAkhir;
  }

//create
  saveBarang() {
    print(_barangId);
    if (_barangId == null) {
      var newBarang = Barang(
          kodeBrg: kodeBrg,
          namakategori: namakategori,
          namaBrg: namaBrg,
          harga: harga,
          stokAwal: stokAwal,
          inBrg: inBrg,
          outBrg: outBrg,
          stokAkhir: stokAkhir,
          barangId: uuid.v4());
      firestore.saveBarang(newBarang);
    } else {
      //Update
      var updatedBarang = Barang(
          barangId: barangId,
          kodeBrg: kodeBrg,
          namakategori: namakategori,
          namaBrg: namaBrg,
          harga: harga,
          stokAwal: stokAwal,
          inBrg: inBrg,
          outBrg: outBrg,
          stokAkhir: stokAkhir);
      firestore.saveBarang(updatedBarang);
    }
  }

//delete
  removeBarang(String barangId) {
    firestore.removeBarang(barangId);
  }
}
