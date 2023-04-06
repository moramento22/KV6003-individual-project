import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const WelcomeCard(),
            const SizedBox(
              height: 16,
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
                      fontWeight: FontWeight.w400,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(child: ParksList())
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OpenContainer(
        closedBuilder: (context, open) { return FloatingActionButton.extended(
          elevation: 1,
          onPressed: open,
          label: const Text("See Overview"),
        );},
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        closedColor: Theme.of(context).colorScheme.primaryContainer,
        openColor: Theme.of(context).colorScheme.surface,
        openBuilder: (context, close) => Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("OVERVIEW PAGE")
            )
          )
        ),
      ),
    );
  }
}

class ParksList extends StatefulWidget {
  const ParksList({super.key});

  @override
  State<ParksList> createState() => _ParksListState();
}

class _ParksListState extends State<ParksList> {
  int _selectedIndex = -1;
  List<String> nationalParks = [
    "Brecon Beacons",
    "Cairngorns",
    "Dartmoor",
    "Exmoor",
    "Lake District",
    "Loch Lomond and the Trossachs",
    "New Forest",
    "North York Moors",
    "Northumberland",
    "Peak District",
    "Pembrokeshire Coast",
    "Snowdonia",
    "South Downs",
    "The Broads",
    "Yorkshire Dales"
  ];
  List<String> nationalParksPhotos = [
    "assets/images/Brecon_beacons_arp.jpg",
    "assets/images/The_Cairngorms_-_geograph.org.uk_-_1766434.jpg",
    "assets/images/View_to_Sharpitor_from_Meavy.jpeg",
    "assets/images/Malmsmead_Hill,_Exmoor_-_geograph.org.uk_-_80944.jpg",
    "assets/images/Keswick_Panorama_-_Oct_2009.jpg",
    "assets/images/Loch_Katrine.jpg",
    "assets/images/Beech_trees_in_Mallard_Wood,_New_Forest_-_geograph.org.uk_-_779513.jpg",
    "assets/images/Heather_moorland_on_the_North_York_Moors.jpg",
    "assets/images/Northumberland_National_Park.jpg",
    "assets/images/Mam_Tor.jpg",
    "assets/images/Barafundle_Bay_beach_(May_2009).jpg",
    "assets/images/Llyn_Llydaw_from_Crib_Goch_2.jpg",
    "assets/images/Devils_Dyke.jpg",
    "assets/images/Breydon-north.jpg",
    "assets/images/2015_Swaledale_from_Kisdon_Hill.jpg"
  ];

  List<Color> nationalParksSeeds = [
    const Color(0xFFE6E4FC),
    const Color(0xFF969BB4),
    const Color(0xFFC4F1FF),
    const Color(0xFFB8D1FF),
    const Color(0xFFABC0E2),
    const Color(0xFF7A7C93),
    const Color(0xFF322C05),
    const Color(0xFF6088BC),
    const Color(0xFFAFCEFD),
    const Color(0xFF385171),
    const Color(0xFF82B1E2),
    const Color(0xFF4285F4),
    const Color(0xFF4285F4),
    const Color(0xFF4285F4),
    const Color(0xFFA1C2D5)
  ];

  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Material(
      child: ListView.builder(
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            if (index == 15) {
              return const SizedBox(
                height: 64,
              );
            }
            if(isDarkMode)
            {
              return ListTile(
                tileColor: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: nationalParksSeeds[index]).surface,
                textColor: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: nationalParksSeeds[index]).onSurface,
                selectedTileColor: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: nationalParksSeeds[index]).onSurface.withOpacity(0.12),
                selectedColor: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: nationalParksSeeds[index]).onSurface,
                title: Text(nationalParks[index]),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      nationalParksPhotos[index],
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    )),
                selected: index == _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            }
            else {
              return ListTile(
                tileColor: ColorScheme.fromSeed(seedColor: nationalParksSeeds[index]).surface,
                textColor: ColorScheme.fromSeed(seedColor: nationalParksSeeds[index]).onSurface,
                selectedTileColor: ColorScheme.fromSeed(seedColor: nationalParksSeeds[index]).onSurface.withOpacity(0.12),
                selectedColor: ColorScheme.fromSeed(seedColor: nationalParksSeeds[index]).onSurface,
                title: Text(nationalParks[index]),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      nationalParksPhotos[index],
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    )),
                selected: index == _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            }
          }),
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Welcome!",
                            style: GoogleFonts.robotoSerif(
                                fontStyle: FontStyle.italic,
                                fontSize: 32,
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
                                color:
                                Theme.of(context).colorScheme.outline),
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
                      (const Text(
                          "Welcome to the treeTRIP app! Here you can enter or choose a location where you want the trip to take place. Like a national park, or a heritage site. "
                              "You can also find places based on your location, by clicking the icon on the right of the search bar. "
                              "After selecting a location tap \"See Overview\" to see overview of the trip available for this location and to start the trip."))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
