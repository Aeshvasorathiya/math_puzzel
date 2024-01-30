
import 'package:flutter/material.dart';
import 'package:math_puzzel/data.dart';
import 'package:math_puzzel/first.dart';
import 'package:math_puzzel/win.dart';

class second extends StatefulWidget {
  int ?ind;
  second([this.ind]);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  int level_no=0;
  String str="";
  int t=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.ind!=null)
    {
      level_no=widget.ind!;
    }else
    {
      level_no=first.prefs!.getInt("levelno")??0;
    }
    print("levelno:$level_no");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(onWillPop: () async {
        showDialog(barrierColor: Colors.transparent,barrierDismissible: true,context: context, builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            title: Text("Game Exit",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),),
            content: Text("Are you Sure For Exit Game??",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),),
            actions: [
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return first();
                },));
              }, child: Text("Yes",style: TextStyle(color: Colors.red),)),
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("No",style: TextStyle(color: Colors.red),)),
            ],
            scrollable: true,
          );
        },);
        return true;
      },
        child: SafeArea(
          minimum: EdgeInsets.only(top: 30),
          child: Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("myassets/image/gameplaybackground.jpg"),),
              ),
              child: Column(

                children: [
                  Expanded(child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: InkWell(onTap: () {
                        String str=first.prefs!.getString("skip_time") ?? "";
                        if(str==""){
                          DateTime dt=DateTime.now();
                          first.prefs!.setString("skip_time",dt.toString());
                          first.prefs!.setString("level_status$level_no", "no");
                          level_no++;
                          first.prefs!.setInt("levelno",level_no);
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return second();
                          },));
                        }
                        else
                        {
                          DateTime cur_time=DateTime.now();
                          DateTime skip_time=DateTime.parse(str);
                          Duration dur=cur_time.difference(skip_time);
                          int sec=dur.inSeconds;
                          if(sec>=10)
                          {
                            first.prefs!.setInt("levelno",level_no);
                            level_no++;
                            first.prefs!.setInt("levelno", level_no);
                            first.prefs!.setString("skip_time",cur_time.toString());
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return second();
                            },));
                          }
                          else
                          {
                            showDialog(context: context, builder:(context) {
                              return AlertDialog(title: Text("You can skip after 10 sec..."),actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK")),
                              ],
                              );
                            },);
                          }
                        }
                        // first.prefs!.setString("level_status$level_no","no");
                        // level_no++;
                        // first.prefs!.setInt("levelno",level_no);

                      },
                        child: Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("myassets/image/skip.png"),
                          )),
                        ),
                      )
                      ),
                      Expanded(flex: 3,child: Container(height:80,width: 100,alignment: Alignment.center,child: Text("LEVEL ${level_no+1}",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 40,fontFamily: 'eight'),),
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("myassets/image/level_board.png"),
                            fit:BoxFit.fill
                        )),
                      )
                      ),
                      Expanded(child: Container(
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("myassets/image/hint.png"),
                        )),
                      )
                      ),

                    ],
                  ),),
                  Expanded(flex: 2,child: Container(
                    // margin: EdgeInsets.only(top: 5,bottom: 300),
                    child: Image(height:350,width:350,image: AssetImage("${data.que[level_no]}"),),
                  ),),
                  Expanded(child: Text("")),
                  Expanded(child: Container(
                    height: double.infinity,
                    width: double.infinity,

                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(flex: 4,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                margin: EdgeInsets.all(12),
                                decoration: BoxDecoration(color:Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("${str}"),
                              ),),
                            Expanded(flex: 1,
                              child: InkWell(onTap: () {
                                str=str.substring(0,str.length-1);
                                setState(() {});
                              },
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  margin: EdgeInsets.fromLTRB(2, 10, 2, 10),
                                  decoration: BoxDecoration(
                                    // color:Colors.grey,
                                      image: DecorationImage(fit: BoxFit.fill,image: AssetImage("myassets/image/delete.png")),
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                ),
                              ),
                            ),
                            Expanded(child: InkWell(
                              onTap: () {
                                if(data.ans[level_no]==int.parse(str))
                                {
                                  first.prefs!.setString("level_status$level_no","yes");
                                  // level_no++;
                                  // t=first.prefs!.getInt("levelno") ?? 0;
                                  // if(t<level_no)
                                  //   {
                                  //     first.prefs?.setInt("levelno",level_no);
                                  //   }
                                  // first.prefs!.setInt("levelno",level_no);
                                  if(widget.ind!=null)
                                  {
                                    level_no++;
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                      return win(widget.ind!,true);
                                    },));
                                  }
                                  else{
                                    level_no++;
                                    first.prefs!.setInt("levelno",level_no);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return win(level_no);
                                    },));
                                  }
                                  str="";

                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar( content: Text("wrong")));
                                  str="";
                                  setState(() {});
                                }
                                setState(() {

                                });

                              },
                              child: Container(
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "𝑺𝑼𝑩𝑴𝑰𝑻",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            )
                          ],
                        ),
                        ),
                        Expanded(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Expanded(child: InkWell(onTap: () {
                              str=str+"1";
                              setState(() {

                              });
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(width: 1,color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("1",style: TextStyle(color: Colors.black,fontSize: 15),),
                              ),
                            ),),
                            Expanded(child: InkWell(
                              onTap: () {
                                str=str+"2";
                                setState(() {

                                });
                              },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("2"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap: () {
                              str=str+"3";
                              setState(() {

                              });
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("3"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap: () {
                              str=str+"4";
                              setState(() {

                              });
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("4"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap: () {
                              str=str+"5";
                              setState(() {

                              });
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("5"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap: () {
                              str=str+"6";
                              setState(() {});
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("6"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap: () {
                              str=str+"7";
                              setState(() {});
                            },

                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("7"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap: () {
                              str=str+"8";
                              setState(() {});
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("8"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap:() {
                              str=str+"9";
                              setState(() {});
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("9"),
                              ),
                            ),),
                            Expanded(child: InkWell(onTap:() {
                              str=str+"0";
                              setState(() {});
                            },
                              child: Container(
                                height:50,
                                width: 50,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(color:Colors.grey,border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Text("0"),
                              ),
                            ),),
                          ],
                          ),

                        ),
                      ],
                    ),
                  ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
