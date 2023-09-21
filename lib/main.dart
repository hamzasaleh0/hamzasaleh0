import 'dart:async';
import 'package:flutter/material.dart';


void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamza App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashScreen(),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        printt.routeName: (context) => printt(),
        HamzaApp.routeName: (context) => HamzaApp(),
        Calculatorr.routeName: (context) => Calculatorr(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: CircleAvatar(
          radius: 120,

          child: Text('Hamza Saleh' , style:TextStyle(
            color:Colors.indigo,fontSize: 40,),

          ),
        ),
      ),);
  }
}

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String projectName = 'حمزة الجبري';
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Text(
            'الوقت : ${DateTime.now()}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            'اسم الطالب : $projectName',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            child: Text('اضغط على القائمة '),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList[index]),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                'القائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text(' طباعة'),
              onTap: () {
                Navigator.pushNamed(context, printt.routeName);
              },
            ),
            ListTile(
              title: Text(' الحاسبة'),
              onTap: () {
                Navigator.pushNamed(context, Calculatorr.routeName);
              },
            ),
            ListTile(
              title: Text('الكويز'),
              onTap: () {
                Navigator.pushNamed(context, HamzaApp.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class printt extends StatefulWidget{
  static const routeName = '/printt';
  @override
  _printtState createState() => _printtState();
}

class _printtState extends State<printt> {
  TextEditingController _textEditingController = TextEditingController();
  String _printedName = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _printName() {
    setState(() {
      _printedName = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طباعة'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                'القائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text(' طباعة'),
              onTap: () {
                Navigator.pushNamed(context, printt.routeName);
              },
            ),
            ListTile(
              title: Text(' الحاسبة'),
              onTap: () {
                Navigator.pushNamed(context, Calculatorr.routeName);
              },
            ),
            ListTile(
              title: Text('الكويز'),
              onTap: () {
                Navigator.pushNamed(context, HamzaApp.routeName);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'ادحل اسمك',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _printName,
              child: Text('اطبع '),
            ),
            SizedBox(height: 16.0),
            Text(
              _printedName,
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
class HamzaApp extends StatefulWidget {
  static const routeName = '/HamzaApp';

  @override
  _HamzaAppState createState() => _HamzaAppState();
}

class _HamzaAppState extends State<HamzaApp> {
  TextEditingController _numberC = TextEditingController();
  String _re = '';
  List<String> itemList = [];

  @override
  void dispose() {
    _numberC.dispose();
    super.dispose();
  }

  void _multi() {
    int? n = int.tryParse(_numberC.text);
    if (n != null) {
      setState(() {
        for (int i =0 ; i<n ;i++){
          _re = (n *i ).toString();
        }});
    } else {
      setState(() {
        _re = '';
      });
    }
  }
  void _duppel() {
    int? n = int.tryParse(_numberC.text);

    if (n != null) {
      setState(() {
        for (int i =0 ; i<=n ;i++){
          _re = (n * 2 ).toString();
        }});
    } else {
      setState(() {
        _re = '';
      });
    }
  }

  void _Swap() {
    int? n = int.tryParse(_numberC.text);

    if (n! < 0 ) {
      setState(() {

        _re = (-1*n ).toString();
      });
    } else {
      setState(() {
        _re = '';
      });
    }
  }
  void _clearScreen() {
    setState(() {
      _numberC.clear();
      _re = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(' الكويز '),
      ),



      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'القائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text(' طباعة'),
              onTap: () {
                Navigator.pushNamed(context, printt.routeName);
              },
            ),
            ListTile(
              title: Text(' الحاسبة'),
              onTap: () {
                Navigator.pushNamed(context, Calculatorr.routeName);
              },
            ),
            ListTile(
              title: Text('الكويز'),
              onTap: () {
                Navigator.pushNamed(context, HamzaApp.routeName);
              },
            ),
          ],
        ),
      ),
      body: Center(child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          TextField(
            controller: _numberC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'اكتب الرقم هنا ',
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(


            onPressed: _multi,
            child: Text('مضروب'),
          ),
          ElevatedButton(

            onPressed: _duppel,
            child: Text('مضاعفات'),
          ),
          ElevatedButton(


            onPressed: _Swap,
            child: Text('التحويل'),
          ),
          SizedBox(height: 50 , ),
          Text(
            'ناتج العملية: $_re',
            style: TextStyle(fontSize: 20 , color: Colors.red),
          ),
          SizedBox(height: 50),
          ElevatedButton(

            onPressed: _clearScreen,
            child: Text('المسح'),
          ),
        ],
      ),),
    );
  }
}



class Calculatorr extends StatefulWidget {
  static const routeName = '/CalculatorrApp';
  @override
  _CalculatorrState createState() => _CalculatorrState();
}

class _CalculatorrState extends State<Calculatorr> {
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();
  String _re = '';

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  void _calculate(String operation) {
    double num1 = double.parse(_num1Controller.text);
    double num2 = double.parse(_num2Controller.text);
    double re ;

    switch (operation) {
      case '+':
        re  = num1 + num2;
        break;
      case '-':
        re = num1 - num2;
        break;
      case '*':
        re = num1 * num2;
        break;
      case '/':
        re= num1 / num2;
        break;
      case '%':
        re = num1 % num2;
        break;
    }

    setState(() {
      _re = "$_re" ;
    });
  }

  void _clear() {
    _num1Controller.clear();
    _num2Controller.clear();

    setState(() {
      _re = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حاسبة'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                'القائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text(' طباعة'),
              onTap: () {
                Navigator.pushNamed(context, printt.routeName);
              },
            ),
            ListTile(
              title: Text(' الحاسبة'),
              onTap: () {
                Navigator.pushNamed(context, Calculatorr.routeName);
              },
            ),
            ListTile(
              title: Text('الكويز'),
              onTap: () {
                Navigator.pushNamed(context, HamzaApp.routeName);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'الرقم الاةل',
                ),
              ),
              TextField(
                controller: _num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'الرقم الثاني ',
                ),
              ),
              SizedBox(height: 16.0),




              ElevatedButton(
                onPressed: () => _calculate('+'),
                child: Text('+'),
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _calculate('-'),
                child: Text('-'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _calculate('*'),
                child: Text('*'),
              ), SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _calculate('/'),
                child: Text('/'),
              ), SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _calculate('%'),
                child: Text('%'),
              ),


              SizedBox(height: 16.0),
              Text(
                _re,
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _clear,
                child: Text('مسح'),
              ),

            ]),
      ),
    );
  }
}
