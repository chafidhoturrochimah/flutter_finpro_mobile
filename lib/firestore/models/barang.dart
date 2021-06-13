class Barang {
  final String barangId;
  final String kodeBrg;
  final String namakategori;
  final String namaBrg;
  final int harga;
  final int stokAwal;
  final int inBrg;
  final int outBrg;
  final int stokAkhir;

  // konstruktor versi 1 untuk mengeset nilai
  Barang(
      {this.barangId,
      this.kodeBrg,
      this.namakategori,
      this.namaBrg,
      this.harga,
      this.stokAwal,
      this.inBrg,
      this.outBrg,
      this.stokAkhir});

  // konstruktor versi 2: konversi dari Map ke bARANG
  //untuk mengambil data dari sql yang tersimpan berbentuk Map
  //setelah itu akan disimpan kembali dalam bentuk variabel
  Map<String, dynamic> toMap() {
    return {
      'barangId': barangId,
      'kodeBrg': kodeBrg,
      'namakategori': namakategori,
      'namaBrg': namaBrg,
      'harga': harga,
      'stokAwal': stokAwal,
      'inBrg': inBrg,
      'outBrg': outBrg,
      'stokAkhir': stokAkhir
    };
  }

  Barang.fromFirestore(Map<String, dynamic> firestore)
      : barangId = firestore['barangId'],
        kodeBrg = firestore['kodeBrg'],
        namakategori = firestore['namakategori'],
        namaBrg = firestore['namaBrg'],
        harga = firestore['harga'],
        stokAwal = firestore['stokAwal'],
        inBrg = firestore['inBrg'],
        outBrg = firestore['outBrg'],
        stokAkhir = firestore['stokAkhir'];
}
