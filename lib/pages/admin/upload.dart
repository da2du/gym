import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import '../../enum/categories.dart';
import '../../firebase_db_service.dart';
import 'widget/custom_app_bar.dart';

class Upload extends StatefulWidget {
  Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final ImagePicker picker = ImagePicker();
  List<XFile>? images = [];
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  void addPicGal() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    images!.add(XFile(image!.path));

    setState(() {});
  }

  categoriesEnum? cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const UploadAppBar(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  images!.isEmpty
                      ? Center(
                          child: Wrap(
                            spacing: 12,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.purple,
                                child: IconButton(
                                    onPressed: () {
                                      addPicGal();
                                    },
                                    icon: const Icon(Icons.photo)),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Image.file(
                                    File(images!.elementAt(0).path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                images!.asMap().containsKey(1)
                                    ? Container(
                                        margin: const EdgeInsets.all(5),
                                        child: Image.file(
                                          File(images!.elementAt(1).path),
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Center(
                                        child: Wrap(
                                          spacing: 12,
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.purple,
                                              child: IconButton(
                                                  onPressed: () {
                                                    addPicGal();
                                                  },
                                                  icon:
                                                      const Icon(Icons.photo)),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,

                    //validator: validator,
                    controller: title,
                    onChanged: (val) {},
                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                        hintText: "enter Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: description,
                    onChanged: (val) {},
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                    minLines: 6,
                    decoration: InputDecoration(
                        hintText: "enter Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Category ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Wrap(
                    children: [
                      ListTile(
                        title: const Text("maintain body"),
                        leading: Radio(
                            value: categoriesEnum.Mantain_Body_Muscle,
                            groupValue: cat,
                            onChanged: (categoriesEnum? value) {
                              setState(() {
                                cat = value;
                              });
                            }),
                      ),
                      ListTile(
                        title: const Text("weight gain"),
                        leading: Radio(
                            value: categoriesEnum.Weight_Gain,
                            groupValue: cat,
                            onChanged: (categoriesEnum? value) {
                              setState(() {
                                cat = value;
                              });
                            }),
                      ),
                      ListTile(
                        title: const Text("weight loose"),
                        leading: Radio(
                            value: categoriesEnum.Weight_Loose,
                            groupValue: cat,
                            onChanged: (categoriesEnum? value) {
                              setState(() {
                                cat = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  IconButton(
                      color: Colors.purple,
                      onPressed: () => {
                            Db().post(cat, images, title.text, description.text)
                          },
                      icon: const Icon(Icons.done))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
