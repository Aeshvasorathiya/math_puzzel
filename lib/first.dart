
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzel/data.dart';
import 'package:math_puzzel/second.dart';
import 'package:math_puzzel/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: first(),
  )
  );
}class first extends StatefulWidget {
  static SharedPreferences? prefs;

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List l=[];
  bool temp=false;
  bool temp1=false;
  bool temp2=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
  }
  get_pref()
  async {
    first.prefs=await SharedPreferences.getInstance();
    int levelno=first.prefs!.getInt("levelno")??0;
    l=List.filled(data.ans.length,"no");
    for(int i=0;i<levelno;i++)
    {
      l[i]=first.prefs!.getString("level_status$i");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("myassets/image/background.jpg"),),
        ),
        child: Column(children: [
          Expanded(child:
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("𝑴𝒂𝒕𝒉 𝑷𝒖𝒛𝒛𝒍𝒆𝒔",style: TextStyle(fontSize: 30,color: Colors.blueAccent),
            ),
          )),
          Expanded(flex: 3,
            child: Container(width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("myassets/image/blackboard_main_menu.png"),
              ),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTapUp:(details) {
                      temp = false;
                      print("hello");
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return second();
                      },));
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp=true;
                      print("good");


                      setState(() {});
                    },
                    onTapCancel: () {
                      temp =false;
                      print("morning");
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: (temp)?Border.all(color: Colors.white, width: 1)
                              :Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(30))),
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'eight'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapUp:(details) {
                      temp1 = false;
                      print("hello");
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return third(l);
                      },));
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp1=true;
                      print("good");
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp1 =false;
                      print("morning");
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: (temp1)?Border.all(color: Colors.white, width: 1)
                              :Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(30))),
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: Text(
                        "Puzzle",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'eight'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapUp:(details) {
                      temp2 = false;
                      print("hello");
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp2=true;
                      print("good");
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp2 =false;
                      print("morning");
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: (temp2)?Border.all(color: Colors.white, width: 1)
                              :Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(30))),
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: Text(
                        "Buy Pro",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'eight'),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,width: 40,
                margin: EdgeInsets.fromLTRB(0,0,5,20),
                // margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [Colors.grey,Color.fromRGBO(100, 29, 100, 90)]),
                  image: DecorationImage(image: AssetImage("myassets/image/shareus.png"),),
                ),
              ),
              Container(
                height: 40,width: 40,

                margin: EdgeInsets.fromLTRB(0,0,20,20),
                // margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [Colors.grey,Color.fromRGBO(100, 29, 100, 90)]),
                  image: DecorationImage(image: AssetImage("myassets/image/emailus.png"),),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                height: 25,width: 95,
                decoration: BoxDecoration(border: Border.all(
                  color: Colors.black,),),
                margin: EdgeInsets.fromLTRB(0,0,20,20),
                child: Text("Privacy Policy"),
              ),
            ],
          ),

        ],
        ),
      ),

    );
  }
}

