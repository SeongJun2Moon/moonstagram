import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key, this.userImage, this.title}) : super(key: key);

  final userImage;
  final title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage),
          TextField(
              onChanged: (value){},
              decoration: InputDecoration(hintText: "좋아요")
          ),
          TextField(
              onChanged: (value){},
              decoration: InputDecoration(hintText: "글 제목")
          ),
          TextField(
              onChanged: (value){},
              decoration: InputDecoration(hintText: "글 내용")
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("발행")),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("취소")),
            ],
          )
        ],
      ),
    );
  }
}
