import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kv6003/search_page.dart';
import 'color_schemes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'treeTRIP',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const LandingPage(title: 'treeTRIP'),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});

  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {

    route() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchPage()));
    }

    startTime() async {
      var duration = const Duration(seconds: 2);
      return Timer(duration, route);
    }

    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.background,
          systemNavigationBarColor: Theme.of(context).colorScheme.background,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.background,
          systemNavigationBarColor: Theme.of(context).colorScheme.background,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark));
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const SafeArea(child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: StartupCard()),
        )));
  }
}

class StartupCard extends StatelessWidget {
  const StartupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Center(
          child: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'tree',
                style: GoogleFonts.robotoSerif(
                    fontStyle: FontStyle.italic,
                    fontSize: 57,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurfaceVariant)),
            TextSpan(
                text: 'TRIP',
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.w600,
                    fontSize: 57,
                    color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ])),
        ));
  }
}

