import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var _sum = 0;

  bool RedCheck = false;
  bool BlueCheck = false;
  var BlueCount = 0;
  var RedCount = 0;
  bool player = false;
  bool playerTwo = true;

  List<Widget> addStar = [];
  List<Widget> NewStar = [];

  ButtonStyle styleRed = ElevatedButton.styleFrom(
    primary: Colors.red,
    textStyle: TextStyle(
      fontSize: 40.0,
    ),
  );

  ButtonStyle styleBlue = ElevatedButton.styleFrom(
    primary: Colors.blue,
    textStyle: TextStyle(
      fontSize: 40.0,
    ),
  );

  _CountOneRed() {
    setState(() {
      player = !player;
      playerTwo = !playerTwo;
      _sum++;
      RedCheck = true;
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
    });
  }

  _CountTwoRed() {
    setState(() {
      player = !player;
      playerTwo = !playerTwo;
      _sum += 2;
      RedCheck = true;
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
    });
  }

  _CountThreeRed() {
    setState(() {
      player = !player;
      playerTwo = !playerTwo;
      _sum += 3;
      RedCheck = true;
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
    });
  }


  _CountOneBlue() {
    setState(() {
      playerTwo = !playerTwo;
      player = !player;
      _sum++;
      BlueCheck = true;
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
    });
  }

  _CountTwoBlue() {
    setState(() {
      playerTwo = !playerTwo;
      player = !player;
      _sum += 2;
      BlueCheck = true;
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
    });
  }

  _CountThreeBlue() {
    setState(() {
      playerTwo = !playerTwo;
      player = !player;
      _sum += 3;
      BlueCheck = true;
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
      addStar.add(Icon(Icons.star,size: 28.0,color: Colors.white,));
    });
  }


  _Winner() {
    if (_sum < 20) {
      return true;
    } else {
      return false;
    }
  }

  _NewGame() {
    setState(() {
      addStar.clear();
      _sum = 0;
      BlueCount = 0;
      RedCount = 0;
    });
  }

  _NameWinner() {
    if (player == false) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> iconListStar = [];

    for (var i = 0; i < 20; i++) {
      iconListStar.add(Icon(
        Icons.star_border,
        size: 28.0,
        color: Colors.brown.shade800,
      ));
    }

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
              child: _Winner()
                  ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ส่วนฝั่งสีแดง
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: player
                            ? Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: styleRed,
                              onPressed: _CountThreeRed,
                              child: Text('    3    '),
                            ),
                            ElevatedButton(
                              style: styleRed,
                              onPressed: _CountTwoRed,
                              child: Text('    2    '),
                            ),
                            ElevatedButton(
                              style: styleRed,
                              onPressed: _CountOneRed,
                              child: Text('    1    '),
                            ),
                          ],
                        )
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: styleRed,
                              onPressed: null,
                              child: Text('    3    '),
                            ),
                            ElevatedButton(
                              style: styleRed,
                              onPressed: null,
                              child: Text('    2    '),
                            ),
                            ElevatedButton(
                              style: styleRed,
                              onPressed: null,
                              child: Text('    1    '),
                            ),
                          ],
                        )),
                    // ตรงกลาง
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ดาว
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: addStar,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                player? Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 100.0,
                                  color: Colors.brown.shade800,
                                )
                                    : Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 100.0,
                                  color: Colors.black12,
                                ),
                                Text(
                                  '$_sum',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 200.0,
                                    color: Colors.brown.shade800,
                                  ),
                                ),
                                playerTwo ? Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 100.0,
                                  color: Colors.brown.shade800,
                                )
                                    : Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 100.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ส่วนฝั่งสีน้ำเงิน
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: playerTwo
                            ? Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: _CountOneBlue,
                              child: Text('    1    '),
                            ),
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: _CountTwoBlue,
                              child: Text('    2    '),
                            ),
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: _CountThreeBlue,
                              child: Text('    3    '),
                            ),
                          ],
                        )
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: null,
                              child: Text('    1    '),
                            ),
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: null,
                              child: Text('    2    '),
                            ),
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: null,
                              child: Text('    3    '),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              )
                  :
              // new game
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ส่วนข้างบน
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: styleRed,
                              onPressed: null,
                              child: Text('    3    '),
                            ),
                            ElevatedButton(
                              style: styleRed,
                              onPressed: null,
                              child: Text('    2    '),
                            ),
                            ElevatedButton(
                              style: styleRed,
                              onPressed: null,
                              child: Text('    1    '),
                            ),
                          ],
                        )),
                    // ตรงกลาง
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: _NameWinner()
                                  ? Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'BLUE \n WIN!!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 100.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: _NewGame,
                                    child: Text(
                                      'NEW GAME',
                                      style:
                                      TextStyle(fontSize: 40.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'RED \n WIN!!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 100.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: _NewGame,
                                    child: Text(
                                      'NEW GAME',
                                      style:
                                      TextStyle(fontSize: 40.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    // ส่วนข้างล่าง
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: null,
                              child: Text('    1    '),
                            ),
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: null,
                              child: Text('    2    '),
                            ),
                            ElevatedButton(
                              style: styleBlue,
                              onPressed: null,
                              child: Text('    3    '),
                            ),
                          ],
                        )),
                  ],
                ),
              ))),
    );
  }
}