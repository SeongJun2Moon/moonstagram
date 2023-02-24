import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.data}) : super(key: key);

  final data;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    

  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (c, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.data[i]['image']),
              Container(
                constraints:BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("좋아요: ${widget.data[i]['likes']}", style: TextStyle(fontWeight: FontWeight.w900,)),
                    Text("${widget.data[i]['user']}"),
                    Text("${widget.data[i]['content']}"),
                  ],
                ),
              )
            ],
          );
        },
      );
    } else {
      return Text("로딩중");
    }
  }
}

