import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'enum/categories.dart';

class Db {
  CollectionReference userec = FirebaseFirestore.instance.collection("users");
  CollectionReference uploadrec =
      FirebaseFirestore.instance.collection("uploads");

  Future post(categoriesEnum? cat, List<XFile>? img, String title,
      String description) async {
    var category;
    if (cat == categoriesEnum.Mantain_Body_Muscle) {
      category = "Mantain_Body_Muscle";
    } else if (cat == categoriesEnum.Weight_Gain) {
      category = "Weight_Gain";
    } else if (cat == categoriesEnum.Weight_Loose) {
      category = "Weight_Loose";
    }

    print(cat);
    List<String> imgname = [];
    List<String> downloadedurl = [];
    print("called");
    try {
      for (int i = 0; i < img!.length; i++) {
        imgname.add(uploadrec.doc().id);
        await FirebaseStorage.instance
            .ref('uploads/${imgname.elementAt(i)}')
            .putFile(File(img[i].path))
            .whenComplete(() async {
          print("uploaded");
        });
      }

      for (int i = 0; i < img.length; i++) {
        downloadedurl.add(await FirebaseStorage.instance
            .ref('uploads/${imgname.elementAt(i)}')
            .getDownloadURL());
      }

      print(downloadedurl);
    } catch (e) {
      print("you have error on upload " + e.toString());
    }
    await uploadrec.add({
      'title': title,
      'description': description,
      'category': category,
      'url': downloadedurl
    });
    print('post complete');
  }
}
