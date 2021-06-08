class Kategori {
  final String kategoriId;
  final String namakategori;
  final String deskripsi;

  // konstruktor versi 1 untuk mengeset nilai
  Kategori({this.kategoriId, this.namakategori, this.deskripsi});

  // konstruktor versi 2: konversi dari Map ke bARANG
  //untuk mengambil data dari sql yang tersimpan berbentuk Map
  //setelah itu akan disimpan kembali dalam bentuk variabel
  Map<String, dynamic> toMap() {
    return {
      'kategoriId': 'kategoriId',
      'namakategori': 'namakategori',
      'deskripsi': 'deskripsi'
    };
  }

  Kategori.fromFirestore(Map<String, dynamic> firestore)
      : kategoriId = firestore['kategoriId'],
        namakategori = firestore['namakategori'],
        deskripsi = firestore['deskripsi'];
}
