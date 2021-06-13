import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/firestore/models/barang.dart';
import 'package:flutter_finpro_mobile/firestore/providers/barang_provider.dart';
import 'package:provider/provider.dart';

class EntryFormBarang extends StatefulWidget {
  final Barang barang;

  EntryFormBarang([this.barang]);

  @override
  _EntryFormBarangState createState() => _EntryFormBarangState();
}

class _EntryFormBarangState extends State<EntryFormBarang> {
  final kodeBrgController = TextEditingController();
  final namakategoriController = TextEditingController();
  final namaBrgController = TextEditingController();
  final hargaController = TextEditingController();
  final stokAwalController = TextEditingController();
  final inBrgController = TextEditingController();
  final outBrgController = TextEditingController();
  final stokAkhirController = TextEditingController();

  @override
  void dispose() {
    kodeBrgController.dispose();
    namakategoriController.dispose();
    namaBrgController.dispose();
    hargaController.dispose();
    stokAwalController.dispose();
    inBrgController.dispose();
    outBrgController.dispose();
    stokAkhirController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.barang == null) {
      kodeBrgController.text = "";
      namakategoriController.text = "";
      namaBrgController.text = "";
      hargaController.text = "";
      stokAwalController.text = "";
      inBrgController.text = "";
      outBrgController.text = "";
      stokAkhirController.text = "";
      new Future.delayed(Duration.zero, () {
        final barangs = Provider.of<BarangProvider>(context, listen: false);
        barangs.loadValues(Barang());
      });
    } else {
      //Controller Update
      kodeBrgController.text = widget.barang.kodeBrg.toString();
      namakategoriController.text = widget.barang.namakategori.toString();
      namaBrgController.text = widget.barang.namaBrg.toString();
      hargaController.text = widget.barang.harga.toString();
      stokAwalController.text = widget.barang.stokAwal.toString();
      inBrgController.text = widget.barang.inBrg.toString();
      outBrgController.text = widget.barang.outBrg.toString();
      stokAkhirController.text = widget.barang.stokAkhir.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final barangs = Provider.of<BarangProvider>(context, listen: false);
        barangs.loadValues(widget.barang);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final barangs = Provider.of<BarangProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Stok',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Candara Bold',
          ),
        ),
        backgroundColor: Color.fromRGBO(49, 39, 79, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: kodeBrgController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Kode Barang',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changekodeBrg(value);
              },
            ),
            TextField(
              controller: namakategoriController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changenamakategori(value);
              },
            ),
            TextField(
              controller: namaBrgController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Barang',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changenamaBrg(value);
              },
            ),
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Harga',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changeharga(value);
              },
            ),
            TextField(
              controller: stokAwalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Stok Awal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changestokAwal(value);
              },
            ),
            TextField(
              controller: inBrgController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Barang Masuk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changeinBrg(value);
              },
            ),
            TextField(
              controller: outBrgController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Barang Keluar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changeoutBrg(value);
              },
            ),
            TextField(
              controller: stokAkhirController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Stok Akhir',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                barangs.changestokAkhir(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text(
                'Save',
                style: TextStyle(fontFamily: 'Nunito'),
              ),
              onPressed: () {
                barangs.saveBarang();
                Navigator.of(context).pop();
              },
            ),
            (widget.barang != null)
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(fontFamily: 'Nunito'),
                    ),
                    onPressed: () {
                      barangs.removeBarang(widget.barang.barangId);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_finpro_mobile/firestore/models/Barang.dart';
// import 'package:flutter_finpro_mobile/firestore/models/Kategori.dart';

// class EntryFormBarang extends StatefulWidget {
//   final Barang barang;

//   EntryFormBarang(this.barang);

//   @override
//   EntryFormBarangState createState() => EntryFormBarangState(this.barang);
  
// }

// //class controller
// class EntryFormBarangState extends State<EntryFormBarang> {
//   Barang barang;

//   EntryFormBarangState(this.barang);

//   TextEditingController kodeBrgController = TextEditingController();
//   TextEditingController namakategoriController = TextEditingController();
//   TextEditingController namaBrgController = TextEditingController();
//   TextEditingController hargaController = TextEditingController();
//   TextEditingController stokAwalController = TextEditingController();
//   TextEditingController inBrgController = TextEditingController();
//   TextEditingController outBrgController = TextEditingController();
//   TextEditingController stokAkhirController = TextEditingController();

//   String dropdownkategori;

//   int count = 0;
//   List<Kategori> itemList = [];

//   // void dropDownKategori() async {
//   //   final Future<Database> dbFuture = dbHelper.initDb();

//   //   dbFuture.then((database) {
//   //     Future<List<Kategori>> itemListFuture = dbHelper.getKategoriList();
//   //     itemListFuture.then((itemList) {
//   //       setState(() {
//   //         this.itemList = itemList;
//   //         this.dropdownkategori = itemList[0].idkategori.toString();
//   //         this.count = itemList.length;
//   //       });
//   //     });
//   //   });
//   // }

//   // void initState() {
//   //   super.initState();
//   //   dropDownKategori();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     //kondisi
//     if (barang != null) {
//       kodeBrgController.text = barang.kodeBrg;
//       namakategoriController.text = barang.nama  ;
//       namaBrgController.text = barang.namaBrg;
//       hargaController.text = barang.harga.toString();
//       stokAwalController.text = barang.stokAwal.toString();
//       inBrgController.text = barang.inBrg.toString();
//       outBrgController.text = barang.outBrg.toString();
//       stokAkhirController.text = barang.stokAkhir.toString();
//     }

//     //rubah
//     return Scaffold(
//       appBar: AppBar(
//         title: barang == null ? 
//         Text(
//           'Tambah Barang',
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'CandaraBold',
//           ),
//         ) 
//         : 
//         Text(
//           'Ubah Barang',
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'CandaraBold',
//           ),
//         ),
//         leading: Container(
//           child: new IconButton(
//             icon: new Icon(Icons.keyboard_arrow_left,), 
//             onPressed: (){
//               Navigator.pop(context, '/barang');
//             },
//           ),
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff0096ff), Color(0xff6610f2)],
//               begin: FractionalOffset.bottomLeft,
//               end: FractionalOffset.topRight
//             )
//           ),
//         ),
//       ),

//       body: Padding(
//         padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
//         child: ListView(
//           children: <Widget>[
//             // kode barang
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: kodeBrgController,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   labelText: 'Kode Barang',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // idkategori 
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 value: dropdownkategori,
//                 items: itemList.map((value) {
//                   return new DropdownMenuItem<String>(
//                     value: value.idkategori.toString(),
//                     child: new Text(
//                       value.namakategori,
//                       style: TextStyle(
//                         fontFamily: 'Candara'
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (selectedItem) => setState(() {
//                   dropdownkategori = selectedItem;
//                 }),
//               ),
//             ),

//             // nama barang
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: namaBrgController,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   labelText: 'Nama Barang',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // harga barang
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: hargaController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Harga',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // stok awal
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: stokAwalController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Stok Awal',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // in barang / barang masuk
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: inBrgController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Barang Masuk',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // out barang / barang keluar
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: outBrgController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Barang Keluar',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // stok akhir
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: stokAkhirController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Stok Akhir',
//                   labelStyle: TextStyle(
//                     fontFamily: 'Candara',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //
//                 },
//               ),
//             ),

//             // tombol button
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: Row(
//                 children: <Widget>[
//                   // tombol simpan
//                   Expanded(
//                     // ignore: deprecated_member_use
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50.0),
//                         gradient: LinearGradient(
//                           // Where the linear gradient begins and ends
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomLeft,
//                           // Add one stop for each color. Stops should increase from 0 to 1
//                           stops: [0.1, 0.9],
//                           colors: [
//                             // Colors are easy thanks to Flutter's Colors class.
//                             Color(0xff0096ff),
//                             Color(0xff6610f2),
//                           ],
//                         ),
//                       ),
//                       // ignore: deprecated_member_use
//                       child: RaisedButton(
//                         child: Text(
//                           'Save',
//                           style: TextStyle(
//                             fontFamily: 'CandaraBold',
//                             color: Colors.white,
//                           ),
//                           textScaleFactor: 1.5,
//                         ),
//                         color: Colors.transparent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(60.0)
//                         ),
//                         onPressed: () {
//                           if (barang == null) {
//                             // tambah data
//                             barang = Barang(
//                               kodeBrgController.text,
//                               int.parse(dropdownkategori),
//                               namaBrgController.text,
//                               int.parse(hargaController.text),
//                               int.parse(stokAwalController.text),
//                               int.parse(inBrgController.text),
//                               int.parse(outBrgController.text),
//                               int.parse(stokAkhirController.text)
//                             );
//                           } else {
//                             // ubah data
//                             barang.kodeBrg = kodeBrgController.text;
//                             barang.idkategori = int.parse(dropdownkategori);
//                             barang.namaBrg = namaBrgController.text;
//                             barang.harga = int.parse(hargaController.text);
//                             barang.stokAwal = int.parse(stokAwalController.text);
//                             barang.inBrg = int.parse(inBrgController.text);
//                             barang.outBrg = int.parse(outBrgController.text);
//                             barang.stokAkhir = int.parse(stokAkhirController.text);
//                           }
//                           // kembali ke layar sebelumnya dengan membawa objek item
//                           Navigator.pop(context, barang);
//                         },
//                       ),
//                     ),
//                   ),

//                   Container(
//                     width: 5.0,
//                   ),

//                   // tombol batal
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50.0),
//                         gradient: LinearGradient(
//                           // Where the linear gradient begins and ends
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           // Add one stop for each color. Stops should increase from 0 to 1
//                           stops: [0.1, 0.9],
//                           colors: [
//                             // Colors are easy thanks to Flutter's Colors class.
//                             Color(0xff0096ff),
//                             Color(0xff6610f2),
//                           ],
//                         ),
//                       ),
//                       // ignore: deprecated_member_use
//                       child: RaisedButton(
//                         child: Text(
//                           'Cancel',
//                           style: TextStyle(
//                             fontFamily: 'CandaraBold',
//                             color: Colors.white,
//                           ),
//                           textScaleFactor: 1.5,
//                         ),
//                         color: Colors.transparent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(60.0)
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context, '/barang');
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
