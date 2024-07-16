import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/screens/homescreen.dart';
import 'package:tic_tac_toe/widgets/avatarglow.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Text('Tic Tac Toe',
                    style: GoogleFonts.pressStart2p(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 30),
                    )),
              ),
            ),
            const Expanded(flex: 2, child: GlowingAvatar()),
            const Spacer(),
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
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text('Play Game',
                          style: GoogleFonts.pressStart2p(
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          )),
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
}
