import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/firestore/models/kategori.dart';
import 'package:flutter_finpro_mobile/firestore/providers/kategori_provider.dart';
import 'package:provider/provider.dart';

class EntryFormKategori extends StatefulWidget {
  final Kategori kategori;

  EntryFormKategori([this.kategori]);

  @override
  _EntryFormKategoriState createState() => _EntryFormKategoriState();
}

class _EntryFormKategoriState extends State<EntryFormKategori> {
  final namakategoriController = TextEditingController();
  final deskripsiController = TextEditingController();

  @override
  void dispose() {
    namakategoriController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.kategori == null) {
      namakategoriController.text = "";
      deskripsiController.text = "";
      new Future.delayed(Duration.zero, () {
        final kategoris = Provider.of<KategoriProvider>(context, listen: false);
        kategoris.loadValues(Kategori());
      });
    } else {
      //Controller Update
      namakategoriController.text = widget.kategori.namakategori.toString();
      deskripsiController.text = widget.kategori.deskripsi.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final kategoris = Provider.of<KategoriProvider>(context, listen: false);
        kategoris.loadValues(widget.kategori);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kategoris = Provider.of<KategoriProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Kategori',
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
              controller: namakategoriController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                kategoris.changeNamaKategori(value);
              },
            ),
            TextField(
              controller: deskripsiController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              onChanged: (value) {
                kategoris.changeDeskripsi(value);
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
                kategoris.saveKategori();
                Navigator.of(context).pop();
              },
            ),
            (widget.kategori != null)
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
                      kategoris.removeKategori(widget.kategori.kategoriId);
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
// import 'package:flutter_uts_stokatk/Helpers/DbHelper.dart';
// import 'package:flutter_uts_stokatk/Models/Kategori.dart';

// class EntryFormKategori extends StatefulWidget {
//   final Kategori kategori;

//   EntryFormKategori(this.kategori);
  
//   @override
//   EntryFormKategoriState createState() => EntryFormKategoriState(this.kategori);
// }

// //class controller
// class EntryFormKategoriState extends State<EntryFormKategori> {
//   Kategori kategori;
  
//   DbHelper dbHelper = DbHelper();
  
//   EntryFormKategoriState(this.kategori);

//   TextEditingController namakategoriController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     //kondisi
//     if (kategori != null) {
//       namakategoriController.text = kategori.namakategori;
//     }

//     //rubah
//     return Scaffold(
//       appBar: AppBar(
//         title: kategori == null ? 
//         Text(
//           'Tambah Kategori',
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'CandaraBold',
//           ),
//         ) 
//         : 
//         Text(
//           'Ubah Kategori',
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'CandaraBold',
//           ),
//         ),
//         leading: Container(
//           child: new IconButton(
//             icon: new Icon(Icons.keyboard_arrow_left,), 
//             onPressed: (){
//               Navigator.pop(context, '/');
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
//             // nama kategori
//             Padding(
//               padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: TextField(
//                 controller: namakategoriController,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   labelText: 'Nama Kategori',
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
//                           if (kategori == null) {
//                             // tambah data
//                             kategori = Kategori(
//                               namakategoriController.text
//                             );
//                           } else {
//                             // ubah data
//                             kategori.namakategori = namakategoriController.text;
//                           }
//                           // kembali ke layar sebelumnya dengan membawa objek item
//                           Navigator.pop(context, kategori);
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
//                           Navigator.pop(context, '/');
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
