import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timed_greetings/provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Theming"),
      ),
      body: StreamBuilder(
          stream:
              Stream.periodic(const Duration(seconds: 1), ((computationCount) {
            return TimeOfDay.now();
          })),
          builder: (context, snapshot) {
            return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text.rich(TextSpan(children: [
                      const TextSpan(text: "Current Time:    "),
                      TextSpan(
                          text:
                              "${snapshot.data?.hour ?? "_"} : ${snapshot.data?.minute ?? "_"}",
                          style: GoogleFonts.vt323(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ])),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      Provider.of<DynamicTheming>(context).getGreeting(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
          }),
    );
  }
}
