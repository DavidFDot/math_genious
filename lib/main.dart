import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent[700],
        body: MathG(),
      ),
    ),
  );
}

class MathG extends StatefulWidget {
  @override
  _MathG createState() => _MathG();
}

class _MathG extends State<MathG> {
  Random num = new Random();
  int x = 0, y = 0, puntuacionP1 = 0, puntuacionP2 = 0, score = 10;
  String mensaje = "Presione aqui para cambiar el score limite: 10";

  void playerGuess(int player, bool guess) async {
    bool result = (y % x == 0);

    if (result == guess) {
      switch (player) {
        case 1:
          {
            puntuacionP1++;
          }
          break;
        case 2:
          {
            puntuacionP2++;
          }
          break;
      }
      setState(() {
        mensaje = "Punto para el P$player";
      });
      await new Future.delayed(const Duration(seconds: 2));
    } else if (result != guess) {
      switch (player) {
        case 1:
          {
            puntuacionP1--;
          }
          break;
        case 2:
          {
            puntuacionP2--;
          }
          break;
      }
      setState(() {
        mensaje = "-Punto para el P$player";
      });
      await new Future.delayed(const Duration(seconds: 2));
    }
    if (puntuacionP1 == score || puntuacionP2 == score) {
      setState(() {
        mensaje = "Gano el P$player!";
        x = 0;
        y = 0;
        puntuacionP1 = 0;
        puntuacionP2 = 0;
      });
      await new Future.delayed(const Duration(seconds: 3));
      setState(() {
        mensaje = "Presiona aqui para cambiar el score limite: $score";
      });
    } else {
      setState(() {
        x = num.nextInt(10) + 1;
        y = num.nextInt(1000) + 1;
        mensaje = "Es $y multiplo de $x?";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Expanded(
                          child: FlatButton(
                            color: Colors.green,
                            child: Text(
                              "Verdadero",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            onPressed: () {
                              playerGuess(2, true);
                            },
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: FlatButton(
                            color: Colors.red,
                            child: Text(
                              "Falso",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            onPressed: () {
                              playerGuess(2, false);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: Colors.black45,
                              child: Center(
                                child: FlatButton(
                                  onPressed: () async {
                                    for (int i = 5; i > 0; i--) {
                                      setState(() {
                                        mensaje = "Empezando en $i...";
                                      });
                                      await new Future.delayed(
                                          const Duration(seconds: 1));
                                    }
                                    setState(() {
                                      if (x == 0 || y == 0) {
                                        x = num.nextInt(10) + 1;
                                        y = num.nextInt(1000) + 1;
                                        mensaje = "$y es multiplo de $x?";
                                      }
                                    });
                                  },
                                  child: Text(
                                    "Start",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.black45,
                              child: Center(
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      x = 0;
                                      y = 0;
                                      puntuacionP1 = 0;
                                      puntuacionP2 = 0;
                                      mensaje =
                                          "Presione aqui para cambiar el score limite: $score";
                                    });
                                  },
                                  child: Text(
                                    "Reiniciar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          setState(() {
                            if (score < 50) {
                              score += 10;
                            } else {
                              score = 10;
                            }
                            mensaje =
                                "Presione aqui para cambiar el score limite: $score";
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Container(
                                  color: Colors.black45,
                                  child: Center(
                                    child: Text(
                                      "$mensaje",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        //color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black45,
                                child: Center(
                                  child: Text(
                                    "$mensaje",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                color: Colors.black45,
                                child: Center(
                                  child: Text(
                                    "Score:\nP1: $puntuacionP1\nP2: $puntuacionP2",
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.black45,
                              child: Center(
                                child: Text(
                                  "Score:\nP1: $puntuacionP1\nP2: $puntuacionP2",
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: FlatButton(
                          color: Colors.green,
                          child: Text(
                            "Verdadero",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          onPressed: () {
                            playerGuess(1, true);
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: FlatButton(
                          color: Colors.red,
                          child: Text(
                            "Falso",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          onPressed: () {
                            playerGuess(1, false);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
