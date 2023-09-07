import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates:const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fr','FR'),
      ],
      home: const MyHomePage(title: 'Date Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var _date=null;
  var _time=null;

  Future<void> showDate ()async{
    DateTime ? datepicker=await showDatePicker(context: context,
         initialDate: _date ?? DateTime.now(),
         firstDate: DateTime(1900),
         lastDate: DateTime(2030));
      if(datepicker!=null){
        setState(() {
          _date=datepicker;
        });
      }
  }

  Future<void> showTime() async{
    TimeOfDay ? timepicked=await showTimePicker(context: context,
     initialTime: _time ?? TimeOfDay.now()
     );
     if(timepicked!=null){
      setState(() {
        _time=timepicked;
      });
     }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title,style:const  TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){showDate();}, child: Text("Date ",style: TextStyle(fontSize: 25),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue),elevation: MaterialStatePropertyAll(15)),),
            const SizedBox(height: 40,),
            ElevatedButton(onPressed: (){showTime();}, child: Text("Time ",style: TextStyle(fontSize: 25),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.yellow),elevation: MaterialStatePropertyAll(15)),),
           const Divider(color: Colors.black,)
            ,Text("Date :${_date!=null ? (_date.day.toString()+'/'+_date.month.toString()+'/'+_date.year.toString()) : 'Not Date Yet'} ",style: TextStyle(fontSize: 20),),
             Text("Time : ${_time.format(context)}",style:const TextStyle(fontSize: 20),),
        ]),)
      );
  }
}
