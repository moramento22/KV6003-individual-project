import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';
import 'parks.dart';
import 'overview_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'treeTRIP',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;

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
      body: SafeArea(
        child: Column(children: [
          const WelcomeCard(),
          const SizedBox(
            height: 6,
          ),
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(200)),
            shadowColor: Colors.transparent,
            elevation: 6,
            color: Theme.of(context).colorScheme.surface,
            surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.location_searching_rounded),
                  suffixIconColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  prefixIcon: const Icon(Icons.search_rounded),
                  prefixIconColor: Theme.of(context).colorScheme.onSurface,
                  hintText: "Enter Location",
                  border: InputBorder.none,
                  constraints:
                      const BoxConstraints(minHeight: 56, maxHeight: 56),
                  hintStyle: GoogleFonts.robotoFlex(
                    fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  )),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: Material(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return OpenContainer(
                    transitionDuration: const Duration(milliseconds: 500),
                      openBuilder: (context, close) {
                        return OverviewPage(selectedIndex: _selectedIndex, isDarkMode: isDarkMode);
                      },
                      openColor: isDarkMode ? ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color, brightness: Brightness.dark).background : ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color).background,
                      closedColor: ColorScheme.fromSeed(brightness: isDarkMode ? Brightness.dark : Brightness.light, seedColor: parks[index].color).surface,
                      closedBuilder: (context, open) {
                        return ListTile(
                          tileColor: ColorScheme
                              .fromSeed(
                              brightness: isDarkMode
                                  ? Brightness.dark
                                  : Brightness.light,
                              seedColor: parks[index].color)
                              .surface,
                          textColor: ColorScheme
                              .fromSeed(
                              brightness: isDarkMode
                                  ? Brightness.dark
                                  : Brightness.light,
                              seedColor: parks[index].color)
                              .onSurface,
                          title: Text(parks[index].name),
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                parks[index].photo,
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                              )),
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            open();
                          },
                        );
                      });
                }))
          )]),
      ),
    );
  }
}

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({super.key});

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  bool _isCollapsed = true;
  var _icon = const Icon(Icons.expand_more_rounded);

  void onPressed() {
    if (_isCollapsed == true) {
      setState(() {
        _isCollapsed = !_isCollapsed;
        _icon = const Icon(Icons.expand_less_rounded);
      });
    } else {
      setState(() {
        _isCollapsed = !_isCollapsed;
        _icon = const Icon(Icons.expand_more_rounded);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: const Alignment(0.0, -1.0),
      duration: const Duration(milliseconds: 500),
      child: Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome!",
                        style: GoogleFonts.robotoSerif(
                            fontStyle: FontStyle.italic,
                            fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant)),
                    IconButton(
                      onPressed: onPressed,
                      icon: _icon,
                      style: IconButton.styleFrom(
                        focusColor: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withOpacity(0.12),
                        highlightColor: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.12),
                        side: onPressed == null
                            ? BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.12))
                            : BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                      ).copyWith(foregroundColor:
                          MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).colorScheme.onSurface;
                        }
                        return null;
                      })),
                    )
                  ],
                ),
                if (!_isCollapsed)
                  (Text(
                      "Welcome to the treeTRIP app! Here you can enter or choose a location where you want the trip to take place. Like a national park, or a heritage site.\n"
                      "You can also find places based on your location, by clicking the icon on the right of the search bar.\n"
                      "After selecting a location an overview of the trip available for this location will appear and you'll be able to start the trip there.", style: GoogleFonts.robotoFlex(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  )))
              ],
            ),
          )),
    );
  }
}