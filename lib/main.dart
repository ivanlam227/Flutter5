
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter5',
      initialRoute: '/',
      routes: {
        '/':(context) => MyPage(title: 'Flutter5'),
        '/second':(context) => TwoPage(title: 'Flutter5')
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.title});

  final String title;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _counter = 0;
  String savedString ="";
  late SharedPreferences sharedPreferences;


  void _increment() {
    setState(() {
      _counter++;
    });
    sharedPreferences.setInt("counter", _counter);
  }
  Future<void> initShared() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  
  @override
  void initState(){
    initShared().then((value) {
      _counter=sharedPreferences.getInt('counter') ?? 0;
      savedString =sharedPreferences.getString('savedString')??"empty";
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController _controller= TextEditingController();



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            Text(
              'Сохраненная строка: $savedString'
            ),
       
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400, vertical: 16),
            child: TextFormField(
                   
                
  decoration: const InputDecoration(
    border: UnderlineInputBorder(),
    labelText: 'Введите что-нибудь',
  ),

              controller: _controller,),
                ),
     
            ElevatedButton(
            onPressed: (){
                Navigator.pushNamed(context, '/second', arguments: _controller.text);
                sharedPreferences.setString("savedString", _controller.text);
                _controller.clear();
            },
             child: Text("Новое окно")
            ), 
           


          ],
        ),
      ),
      floatingActionButton:SizedBox(
          height: 100.0,
         width: 100.0,
     child:  FloatingActionButton(
      
        onPressed: _increment,
 
        child: const Text("Обновить"),
      ), 
      ),
    );
  }
}
