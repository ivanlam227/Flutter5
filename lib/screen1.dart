import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class TwoPage extends StatefulWidget {
  const TwoPage({super.key, required this.title});

  final String title;

  @override
  State<TwoPage> createState() => _TwoPageState();
}




class _TwoPageState extends State<TwoPage> {
 String data ="Переданная строка:";


  @override
  Widget build(BuildContext context) {
    String takedString = (ModalRoute.of(context)?.settings.arguments ?? "empty") as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$data$takedString',
              style: Theme.of(context).textTheme.headline4,
            ),
           
           


          ],
        ),
      ),
      floatingActionButton:SizedBox(
          height: 100.0,
         width: 100.0,
     child:  FloatingActionButton(
        onPressed: (){
           Navigator.pushNamed(context, '/');

        },
        child: const Text("Назад"),
      ),
       ), 
    );
  }
}
