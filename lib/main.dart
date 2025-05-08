import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/second_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotes_app/second_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(home: const HomePage(),);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Welcome",
              style:GoogleFonts.playfairDisplay(
                fontSize: 50,
                fontWeight: FontWeight.w800,
                        ),
              ),
            ),
            Image.asset('assets/Images/quote.jfif'),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("It's not just a collection of words... \nit's sharing thoughts and touching each other's souls.",
              style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w500,
                      ),
              ),
            ),
            ElevatedButton(style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black),
              foregroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: ()async{
                var url= Uri.parse(
                  'https://dummyjson.com/quotes'
                );
                var response=await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
                var data= jsonDecode(response.body);
                var info=[];
                for(var quoteInfo in data['quotes']){
                  var quote=quoteInfo['quote'];
                  var author=quoteInfo['author'];
                  info.add({
                    'quote':quote,
                    'author':author
                  });
                }
                print(info);
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FetchQuotes(quotesList:info,)));
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const FetchQuotes()));
            },
             child: Text(
              "Let's see Quotes",
              ),
             )
          ],
        ),
      ),
    );
  }
}


