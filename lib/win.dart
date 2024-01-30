
import 'package:flutter/material.dart';
import 'package:math_puzzel/second.dart';

import 'first.dart';

class win extends StatefulWidget {
  int level_no;
  bool? is_skip = true;

  win(this.level_no, [this.is_skip]);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
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
                  image: AssetImage("myassets/image/background.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Expanded(
                  child: (widget.is_skip == true)
                      ? Text(
                    "LEVEL ${widget.level_no + 1}Complited",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'eight'),
                  )
                      : Text(
                    "LEVEL ${widget.level_no}Complited",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'eight'),
                  )),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("myassets/image/trophy.png"),
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                          child: InkWell(
                            child: InkWell(
                              onTap: () {
                                if (widget.is_skip == true) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          widget.level_no++;
                                          print("${widget.level_no}");
                                          return second(widget.level_no);
                                        },
                                      ));
                                } else {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return second();
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(colors: [
                                    Colors.black38,
                                    Colors.white,
                                    Colors.black38
                                  ]),
                                ),
                                child: Text(
                                  "𝑪𝑶𝑵𝑻𝑰𝑵𝑼𝑬",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return first();
                                },
                              ));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(colors: [
                                  Colors.black38,
                                  Colors.white,
                                  Colors.black38
                                ]),
                              ),
                              child: Text(
                                "𝑴𝑨𝑰𝑵 𝑴𝑬𝑵𝑼",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                        child: Container(
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(colors: [
                              Colors.black38,
                              Colors.white,
                              Colors.black38
                            ]),
                          ),
                          child: Text(
                            "𝑩𝑼𝒀 𝑷𝑹𝑶",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "SHARE THIS PUZZLE",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontFamily: 'eight',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Expanded(
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.grey, Colors.white, Colors.grey]),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image(
                      image: AssetImage("myassets/image/shareus.png"),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
