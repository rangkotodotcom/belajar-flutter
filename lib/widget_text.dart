import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ! Widget Text
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("My Apps"),
        ),
        body: const Center(
          child: Text(
            "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Veniam dolore deleniti quae impedit nam quibusdam perspiciatis, eos suscipit laborum necessitatibus numquam sunt eius quasi illum, sapiente mollitia ipsam consectetur dignissimos. Asperiores magnam, debitis quidem quod natus, doloribus eaque qui modi veniam aliquid, aut dolor voluptatem. Recusandae excepturi quos quisquam corrupti, nobis, quidem dolores perspiciatis quam, totam nihil rem officiis fugit quasi illo provident deserunt ullam est at numquam iusto aperiam voluptates molestiae! Unde nesciunt atque temporibus quaerat amet, pariatur expedita sequi officia dicta perferendis maiores vitae minima asperiores aut eum non eligendi neque excepturi magnam et nemo fugiat harum ullam.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.amberAccent,
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
              decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
              decorationThickness: 5,
            ),
          ),
        ),
      ),
    );
  }
}
