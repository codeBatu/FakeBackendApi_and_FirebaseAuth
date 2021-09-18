import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample01/core/mdoels/usermodel.dart';
import 'package:sample01/core/utily/constat.dart';
import 'package:sample01/view/useradd/user_add_page.dart';
import 'package:sample01/viewmodel/home/homepage_viewmodel.dart';
import 'package:sample01/widget.dart/text_form_field_widget.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  User? user;
  HomePageViewModel hvm = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: GetBuilder<HomePageViewModel>(
        builder: (x) {
          return FutureBuilder(
            future: hvm.getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemCount: x.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(25)),
                          child: InkWell(
                            onLongPress: () {
                              Get.defaultDialog(
                                  title: "Update Page",
                                  middleText: "Please Lon21g Pres");
                            },
                            onTap: () {
                              Get.defaultDialog(
                                  title: "Update Page",
                                  middleText: "Please Long Pres");
                            },
                            child: ListTile(
                              title: Text(
                                x.userList[index].firstName.toString(),
                              ),
                              subtitle: Text(
                                x.userList[index].email.toString(),
                              ),
                              leading: Text(
                                "Kulanıcı ID : \n ${x.userList[index].id.toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  print(x.userList[index].id.toString());

                                  hvm.deleteUser(x.userList[index]);
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                              hoverColor: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
              ;
            },
          );
        },
      ),
      floatingActionButton: _userAddPageShowDialog(context),
    );
  }

  FloatingActionButton _userAddPageShowDialog(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (builder) {
              return AlertDialog(
                actions: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textFormField(
                          Icons.person,
                          TextValue.fName,
                          TextValue.fName,
                          TextValue.fNameTextController,
                          false),
                      SizedBox(
                        height: 30,
                      ),
                      textFormField(
                          Icons.person,
                          TextValue.lName,
                          TextValue.lName,
                          TextValue.lNameTextController,
                          false),
                      SizedBox(
                        height: 30,
                      ),
                      textFormField(
                          Icons.person,
                          TextValue.email,
                          TextValue.email,
                          TextValue.emailUserTextController,
                          false),
                      MaterialButton(
                        color: Colors.black,
                        onPressed: () async {
                          if (TextValue.fNameTextController.text == "" ||
                              TextValue.lNameTextController.text == "" ||
                              TextValue.emailUserTextController.text == "") {
                            Navigator.pop(context);

                            Get.snackbar(
                              "Hatalı Ekleme",
                              "Adınız :      ${TextValue.fNameTextController.text.toString().toUpperCase()} \nSoyadınız: ${TextValue.lNameTextController.text.toString().toUpperCase()}  \nE-mail :     ${TextValue.emailUserTextController.text.toString()}  \nBoş Alan Bırakmayınız.... ",
                              colorText: Colors.white,
                              backgroundColor: Colors.black,
                            );
                            TextValue.fNameTextController.text = "";
                            TextValue.lNameTextController.text = "";
                            TextValue.emailUserTextController.text = "";
                          } else {
                            hvm.createUser(
                              TextValue.fNameTextController.text.toString(),
                              TextValue.lNameTextController.text.toString(),
                              TextValue.emailUserTextController.text,
                            );
                            //    setState(() {});
                            Navigator.pop(context);

                            Get.snackbar(
                              "User Add Page",
                              "Adınız :      ${TextValue.fNameTextController.text.toString().toUpperCase()} \nSoyadınız: ${TextValue.lNameTextController.text.toString().toUpperCase()}  \nE-mail :     ${TextValue.emailUserTextController.text.toString()}  \nKişiyi Eklediniz...",
                              colorText: Colors.white,
                              backgroundColor: Colors.black,
                            );
                            TextValue.fNameTextController.text = "";
                            TextValue.lNameTextController.text = "";
                            TextValue.emailUserTextController.text = "";
                          }
                          Get.defaultDialog(
                              title: "Kişi Sayısı",
                              middleText:
                                  "Listede ki Kişi Sayısı :${hvm.userList.length}");
                          setState(() {});
                        },
                        child: Text(
                          "Ekle",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
      },
      child: Icon(Icons.add),
    );
  }
}
//TODO TEXTFİLEDLARA VALİDATOR KOY SONRA NULL KONTROLÜNE SCAFOOLD MESSENGER EKLE