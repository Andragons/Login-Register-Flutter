// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, file_names, unused_local_variable, deprecated_member_use, non_constant_identifier_names, unused_import, unused_field, import_of_legacy_library_into_null_safe, avoid_print, unnecessary_new, avoid_unnecessary_containers, depend_on_referenced_packages, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

// import 'dart:convert';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   static const List<String> list = <String>[
//     'Semarang',
//     'Solo',
//     'Brebes Barat',
//     'Brebes Timur'
//   ];

//   File? selectedImage;
//   String jenis = '';
//   String tarif = '';
//   String tujuan = '';
//   String SelectedTujuan = list.first;
//   bool visible = false;

//   Future getImageGallery() async {
//     final pickedImage =
//         await ImagePicker().getImage(source: ImageSource.gallery);
//     selectedImage = File(pickedImage!.path);
//     print(selectedImage);
//     setState(() {});
//   }

//   Future getImageCamera() async {
//     final pickedImage =
//         await ImagePicker().getImage(source: ImageSource.camera);
//     selectedImage = File(pickedImage!.path);
//     print(selectedImage);
//     setState(() {});
//   }

//   Future uploadImage() async {
//     setState(() {
//       visible = true;
//     });
//     final request = http.MultipartRequest(
//       "POST",
//       Uri.parse('http://192.168.43.123:5000/image/upload'),
//     );
//     final headers = {"Content-type": "multipart/form-data"};
//     request.files.add(http.MultipartFile('image',
//         selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
//         filename: selectedImage!.path.split("/").last));
//     request.fields['tujuan'] = SelectedTujuan;
//     request.headers.addAll(headers);
//     final response = await request.send();
//     if (response.statusCode == 200) {
//       http.Response res = await http.Response.fromStream(response);
//       final resJson = jsonDecode(res.body);
//       jenis = resJson['message']['jenis_kendaraan'];
//       tarif = resJson['message']['tarif'];
//       tujuan = resJson['message']['tujuan'];

//       setState(() {
//         visible = false;
//       });
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             selectedImage == null
//                 ? Text("Please pick a Image upload")
//                 : Image.file(
//                     selectedImage!,
//                     width: 250,
//                     height: 150,
//                   ),
//             SizedBox(height: 20),
//             Text(
//               'Pilih Tujuan : ',
//               style: TextStyle(fontSize: 18),
//             ),
//             DropdownButton<String>(
//               value: SelectedTujuan,
//               elevation: 16,
//               style: const TextStyle(color: Colors.black, fontSize: 20),
//               onChanged: (String? value) {
//                 // This is called when the user selects an item.
//                 setState(() {
//                   SelectedTujuan = value!;
//                 });
//               },
//               items: list.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextButton.icon(
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all(Colors.lightBlueAccent),
//               ),
//               onPressed: uploadImage,
//               icon: Icon(Icons.upload),
//               label: Text(
//                 "Upload",
//                 style: TextStyle(color: Colors.white, fontSize: 15),
//               ),
//             ),
//             Visibility(
//                 maintainSize: true,
//                 maintainAnimation: true,
//                 maintainState: true,
//                 visible: visible,
//                 child: Container(child: CircularProgressIndicator())),
//             SizedBox(
//               height: 10,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Jenis: ' + '${jenis}',
//                   style: TextStyle(fontSize: 25),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   'Tarif: ' + '${tarif}',
//                   style: TextStyle(fontSize: 25),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   'Tujuan:' + ' ${tujuan}',
//                   style: TextStyle(fontSize: 25),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog<void>(
//             context: context,
//             builder: (_) {
//               return Container(
//                 child: SimpleDialog(
//                   title: Text(
//                     "From ",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       height: 1.5,
//                     ),
//                   ),
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Expanded(
//                             child: SimpleDialogOption(
//                           onPressed: getImageCamera,
//                           child: Text(
//                             "Camera",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: SimpleDialogOption(
//                             onPressed: getImageGallery,
//                             child: Text(
//                               "Gallery",
//                               style: TextStyle(fontSize: 15),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'mainvideo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super (key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                myAlert();
              },
              child: const Text('Upload Photo'),
            ),
            const SizedBox(
              height: 10,
            ),
            image != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(image!.path),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ),
                  )
                : const Text(
                    "No Image",
                    style: TextStyle(fontSize: 20),
                  )
          ],
        ),
      ),
    );
  }
}