import 'dart:io';
import 'package:coffee_shop_master_rebuild/components/selectionButtonWidget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/constants.dart';
import 'listitem.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'components/selectionButtonWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _uploadedFileURL;
final _firestore = FirebaseFirestore.instance;

class ProductDetails extends StatefulWidget {
  static const id = 'itemModel';
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final textController = TextEditingController();
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  File _image;
  String name;
  String description1;
  String description2;
  double price;
  bool featured = false;
  String type = 'coffee';
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xFFdd9e42),
          title: Text('Product Update'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Selected Image'),
                _image != null && _uploadedFileURL == null
                    ? Image.asset(
                        _image.path,
                        height: 150,
                      )
                    : Container(),
                _uploadedFileURL != null
                    ? Image.network(
                        _uploadedFileURL,
                        height: 150,
                      )
                    : Container(),
                _image == null
                    ? selectionButtonWidget(
                        label: 'Select image',
                        onPressed: chooseFile,
                        color: Colors.yellow[800],
                      )
                    : Container(),
                _image != null && _uploadedFileURL == null
                    ? RaisedButton(
                        child: Text('Upload File'),
                        onPressed: uploadFile,
                        color: Colors.cyan,
                      )
                    : Container(),
                _uploadedFileURL == null
                    ? Text('please upload Image')
                    : Container(
                        child: Expanded(
                          child: ListView(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextField(
                                        controller: textController,
                                        onChanged: (value) {
                                          name = value;
                                        },
                                        decoration:
                                            KTextFieldDecoration.copyWith(
                                                hintText: 'Product name'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      TextField(
                                        controller: textController1,
                                        maxLength: 35,
                                        onChanged: (value) {
                                          description1 =
                                              value; // Value must be only 40 char max if not overflow will occur in described screen
                                        },
                                        decoration:
                                            KTextFieldDecoration.copyWith(
                                                hintText:
                                                    'Product description1'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      TextField(
                                        controller: textController2,
                                        maxLength:400,
                                        onChanged: (value) {
                                          description2 =
                                              value; // Value must be only 450 char max if not overflow will occur in described screen
                                        },
                                        decoration:
                                            KTextFieldDecoration.copyWith(
                                                hintText:
                                                    'Product description2'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      TextField(
                                        controller: textController3,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          price = double.parse(value);
                                        },
                                        decoration:
                                            KTextFieldDecoration.copyWith(
                                                hintText: 'Product price'),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      // TextField(
                                      //   onChanged: (value) {
                                      //     type = value;
                                      //   },
                                      //   decoration:
                                      //       KTextFieldDecoration.copyWith(
                                      //           hintText: 'Product type'),
                                      // ),
                                      DropdownButton<String>(
                                        value: type,
                                        icon: Icon(EvaIcons.arrowDownOutline),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(color: Colors.brown),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            type = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'coffee',
                                          'tea',
                                          'shake',
                                          'juice'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 130.0,
                                          ),
                                          Text(
                                            'feature',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          Switch(
                                            value: featured,
                                            activeColor: Colors.black,
                                            onChanged: (value) {
                                              setState(() {
                                                toggle(value);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      selectionButtonWidget(
                                        onPressed: () {
                                          if (Provider.of<ListItems>(context,
                                                  listen: false)
                                              .addItem(
                                                  name,
                                                  description1,
                                                  description2,
                                                  price,
                                                  featured,
                                                  type,_uploadedFileURL,)) {
                                            Alert(
                                              context: context,
                                              type: AlertType.success,
                                              title: "Success ",
                                              desc: "Uploaded Successfully",
                                              buttons: [
                                                DialogButton(
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                  setState(() {
                                                    textController.clear();
                                                    textController1.clear();
                                                    textController2.clear();
                                                    textController3.clear();
                                                    _image=null;
                                                    _uploadedFileURL=null;
                                                  });
                                                    Navigator.pop(context);
                                                  },
                                                  width: 120,
                                                  color: Colors.yellow[800],
                                                )
                                              ],
                                            ).show();
                                          } else {
                                            Alert(
                                              context: context,
                                              type: AlertType.error,
                                              title: "ALERT",
                                              desc: "Please give valid input",
                                              buttons: [
                                                DialogButton(
                                                  child: Text(
                                                    "Okay",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    textController.clear();
                                                    name=null;
                                                    _uploadedFileURL='';
                                                    Navigator.pop(context);
                                                  },
                                                  width: 120,
                                                  color: Colors.yellow[800],
                                                )
                                              ],
                                            ).show();
                                          }
                                        },
                                        label: 'Upload',
                                        color: Colors.brown[300],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Todo update and delete for admin

  void toggle(bool value) {
    if (value != true) {
      featured = false;
    } else {
      featured = true;
    }
  }


  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('/product_images/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        print(_uploadedFileURL);
      });
    });
  }
}

class Item {
  final String imageUrl, name, description1, description2, type;
  final bool featured;
  final double price;

  Item({
    @required this.name,
    @required this.imageUrl,
    @required this.description1,
    @required this.description2,
    @required this.price,
    @required this.type,
    @required this.featured,
  });
}

