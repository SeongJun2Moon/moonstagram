//외부 라이브러리
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//프로젝트 내 패키지
import 'package:moonstagram/style.dart' as style;
import 'package:moonstagram/widgets/home.dart';
import 'package:moonstagram/widgets/uproad.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: style.mainTheme,
      // initialRoute: '/',
      // routes: {
      //   '/' : (c) => Home(),
      //   '/detail' : (c) => Upload(),
      // },
      home: MyApp()

  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var tab = 0;
  var data = [];
  var userImage;
  var title;

  getData()async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);

    
    //스테이터스코드로 예외처리
    if (result.statusCode == 200) {
      print("데이터 가져옴");
    } else {
      print("데이터 못가져옴");
    }

    setState(() {
      data = result2;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    List<dynamic> homeWidget = [Home(data : data), Text("$data")];

    return Scaffold(
        appBar: AppBar(
          title: Text("Moonstagram"),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);

                if (image != null) {
                  setState(() {
                    userImage = File(image.path);
                  });
                }

                Navigator.push(context,
                  MaterialPageRoute(builder:(c) => Upload(userImage : userImage, title : title))
                );
              },
            )
          ],
        ),
        body: homeWidget[tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: '샵'),
        ],
      )
    );
  }
}