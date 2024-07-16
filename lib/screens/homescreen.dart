import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: Column(
          children: [
            Text(
              'Score',
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player X',
                          style: GoogleFonts.orbitron(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          )),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.grey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            game.exScore.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player O',
                          style: GoogleFonts.orbitron(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          )),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.grey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            game.ohScore.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    setState(() {
                      game.tapped(index, _showWinnerDialog, _showDrawDialog);
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            game.displayExOh[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRect(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        'Restart',
                        style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Draw',
              style: GoogleFonts.pressStart2p(
                textStyle: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game.clearBoard();
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'Play again',
                      style: GoogleFonts.pressStart2p(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )),
              )
            ],
          );
        });
  }

  void _showWinnerDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                'Winner : $winner',
                style: GoogleFonts.pressStart2p(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      game.clearBoard();
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'Play again',
                    style: GoogleFonts.pressStart2p(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
    setState(() {
      if (winner == 'O') {
        game.ohScore += 1;
      } else if (winner == 'X') {
        game.exScore += 1;
      }
    });
  }
}
