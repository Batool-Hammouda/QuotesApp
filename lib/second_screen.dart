import 'package:flutter/material.dart';

class FetchQuotes extends StatelessWidget {
  var quotesList=[];
  FetchQuotes({super.key, required this.quotesList});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quotes"),),
        body: SafeArea(
          child: ListView.builder(
            itemCount: quotesList.length,
            itemBuilder: (context,index){
              var quote = quotesList[index]['quote'];
              var author = quotesList[index]['author'];
              return ListTile(
                title: Text(quote),
                subtitle: Text("- $author"),
              );
            },
            )
          ),
      ),
    );
  }
}