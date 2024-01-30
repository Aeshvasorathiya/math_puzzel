
import 'package:flutter/material.dart';
import 'package:math_puzzel/data.dart';
import 'package:math_puzzel/first.dart';
import 'package:math_puzzel/second.dart';

class third extends StatefulWidget {
  List? l;

  third([this.l]);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  int levelno = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
  }

  get_pref() {
    levelno = first.prefs!.getInt("levelno") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 30),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("myassets/image/background.jpg"),
            ),
          ),
          child: Column(children: [
            Container(
              child: Text(
                "𝑺𝒆𝒍𝒆𝒄𝒕 𝑷𝒖𝒛𝒛𝒍𝒆",
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
            ),
            Text("1/2",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: data.ans.length-16,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return second(index);
                        },
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: (index < levelno)
                          ? Text(
                        "${index + 1}",
                        style: TextStyle(fontFamily: "eight", fontSize: 40),
                      )
                          : null,
                      decoration: BoxDecoration(
                          image: (index < levelno)
                              ? (widget.l![index] == "yes")
                              ? DecorationImage(
                              image: AssetImage(
                                  "myassets/image/tick.png"))
                              : null
                              : DecorationImage(
                              image: AssetImage(
                                  "myassets/image/lock.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                          border:
                          (index < levelno) ? Border.all(width: 3) : null),
                    ),
                  );
                },
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return grid2(widget.l);
              },));
            },
              child: Container(
                margin: EdgeInsets.fromLTRB(300,0, 20, 50),
                height: 70,
                width: 70,
                child: Image(image: AssetImage("myassets/image/next.png"),),
              ),
            )


          ]
          ),
        ),

      ),
    );
  }
}
class grid2 extends StatefulWidget {
  List ?l;
  grid2([this.l]);

  @override
  State<grid2> createState() => _grid2State();
}

class _grid2State extends State<grid2> {
  int levelno=24;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
  }
  get_pref()
  {
    levelno=first.prefs!.getInt("levelno") ?? 0;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("myassets/image/background.jpg"),
                fit: BoxFit.fill),
          ),
          child: Column(children: [
            SizedBox(
                height: 30),
            Text( "𝑺𝒆𝒍𝒆𝒄𝒕 𝑷𝒖𝒛𝒛𝒍𝒆",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w900),
            ),
            Text("2/2",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(child: GridView.builder(
              itemCount:data.ans.length-24,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 1,mainAxisSpacing: 1) ,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return second(index+24);
                    },));
                  },
                  child: Container(alignment: Alignment.center,
                    child: (index+24 < levelno)
                        ? Text("${index+25}",style: TextStyle(fontFamily: "eight",fontSize: 40),
                    ): null,
                    decoration: BoxDecoration(image: (index+24 < levelno)
                        ?(widget.l?[index+24]=="yes")?DecorationImage(image: AssetImage("myassets/image/tick.png"))
                        :null:DecorationImage(image: AssetImage("myassets/image/lock.png")),
                        borderRadius: BorderRadius.circular(10),
                        border: (index+24 < levelno)?Border.all(width: 3):null),
                  ),
                ) ;
              },),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return third(widget.l);
                    },

                    ));
                  },
                  child: Container(margin: EdgeInsets.fromLTRB(20, 0, 0, 50),
                    height: 50,
                    width: 50,
                    child: Image(image: AssetImage("myassets/image/back.png"),),
                  ),
                )
              ],
            )

          ],),
        ),
      ),
    );
  }
}

