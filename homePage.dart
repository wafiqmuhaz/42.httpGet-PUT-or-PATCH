// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  static const root = "/One";

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController namaC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasil = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HTTP - PUT or PATCH"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: namaC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nama",
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: jobC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Pekerjaan",
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              //http.put digunakan untuk mereplace data
              //http.patch digunakan untuk mengupdate data
              var isi = await http.put(
                Uri.parse("https://reqres.in/api/users/2"),
                body: {"name": namaC.text, "job": jobC.text},
              );

              Map<String, dynamic> data =
                  json.decode(isi.body) as Map<String, dynamic>;

              setState(
                () {
                  hasil = "${data['name']} - ${data['job']}";
                  print(hasil);
                },
              );
            },
            child: Text(
              "Submit",
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            height: 10,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            hasil,
          ),
        ],
      ),
    );
  }
}
