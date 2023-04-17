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

class Park{
  String name;
  String photo;
  Color color;
  String description;

  Park({required this.name, required this.photo, required this.color, required this.description});
}

List<Park> parks = [
  Park(
      name: "Bannau Brycheiniog",
      photo: "assets/images/Brecon_beacons_arp.jpg",
      color: const Color(0xFFE6E4FC),
      description: "Bannau Brycheiniog (previously known as Brecon Beacons) is one of the three national parks in Wales, designated as one in 1957, last out of the three. It covers a 1344 km sq (519 sq mi) area of mountains, hills and forests in south eastern Wales.\n\nThe photograph above shows the view from the highest mountain in the park Pen Y Fan onto another mountain, Cribyn.\n"
  ),
  Park(
      name: "Cairngorms",
      photo: "assets/images/The_Cairngorms_-_geograph.org.uk_-_1766434.jpg",
      color: const Color(0xFF969BB4),
      description: "Cairngorms National Park (Pàirc Nàiseanta a' Mhonaidh Ruaidh in Scottish Gaelic) is one of the two national parks in Scotland and was established in 2003. It covers the Cairngorms mountain range as well as hills around it. It is the largest national park in the UK.\n\nThe photo above shows the view onto the park from the Morrone hill, in Aberdeenshire.\n"
  ),
  Park(
      name: "Dartmoor",
      photo: "assets/images/View_to_Sharpitor_from_Meavy.jpeg",
      color: const Color(0xFFC4F1FF),
      description: "Dartmoor National Park is located in southern Devon in England. It was established in 1951. It covers 954 sq km (368 sq mi) of moorland. It is known for its exposed granite hilltops known as tors.\n\nThe photograph above shows the view of the river Meavy in the foreground, with two of the park's tors, Sharpitor and Leather Tor, in the background.\n"
  ),
  Park(
      name: "Eryri (Snowdonia)",
      photo: "assets/images/josh-kirk-T_3JkNB08tk-unsplash.jpg",
      color: const Color(0xFF8DA0AE),
      description: "Eryri (also known as Snowdonia in English) is a national park in northwest Wales. It was the first one established in Wales, in 1951. It is known for the mountain range from which the park takes its name as well as the range's highest mountain Yr Wyddfa (Snowdon) which is also the highest mountain in Wales.\n\nThe photo above shows the view onto Glaslyn and Llyn Llydaw lakes in the park.\n"
  ),
  Park(
      name: "Exmoor",
      photo: "assets/images/Malmsmead_Hill,_Exmoor_-_geograph.org.uk_-_80944.jpg",
      color: const Color(0xFFB8D1FF),
      description: "Exmoor National Park is located mainly in western Somerset with parts of it in north Devon, in England. It was established in 1954 and is mainly comprised of hilly moorland. Its largest settlements are Porlock, Dulverton, Lynton and Lynmouth.\n\nThe photo above shows the footpath onto one of the park's hills, Malmsmead.\n"
  ),
  Park(
    name: "Lake District",
    photo: "assets/images/jonny-gios-cwlMZzwHmCg-unsplash.jpg",
    color: const Color(0xFF012135),
    description: "Lake District is a national park in northwestern England. It is the second largest national park in the UK and was also second to be designated as one in 1951. As the name suggests, it is famous for its many lakes, but also for its mountains.\n\nThe photo shows the view onto Angle Tarn, which is a mountain lake within the park.\n"
  ),
  Park(
    name: "Loch Lomond and the Trossachs",
    photo: "assets/images/Loch_Katrine.jpg",
    color: const Color(0xFF7A7C93),
    description: "Loch Lomond and the Trossachs National Park (Pàirc Nàiseanta Loch Laomainn is nan Tròisichean in Scottish Gaelic) is located in central Scotland, lying north of Glasgow. It was established in 2002, a first national park in Scotland. It is centered around Loch Lomond and also comprises the hilly, wooded area of the Trossachs.\n\nThe photograph is showing the view onto the Loch Katrine, inside the park.\n"
  ),
  Park(
    name: "New Forest",
    photo: "assets/images/Beech_trees_in_Mallard_Wood,_New_Forest_-_geograph.org.uk_-_779513.jpg",
    color: const Color(0xFF322C05),
    description: "The New Forest national park covers a vast area of unenclosed pasture land, heathland and forest in southern England. It lies partly in Hampshire and partly in Wiltshire. It's a second newest national park in the UK, being established in 2005.\n\nThe photo shows Beech trees in Mallard Wood, which is a part of New Forest.\n"
  ),
  Park(
    name: "North York Moors",
    photo: "assets/images/Heather_moorland_on_the_North_York_Moors.jpg",
    color: const Color(0xFF6088BC),
    description: "North York Moors national park is located in the eastern part of the North Yorkshire county in northern England. It stretches from the North Sea coast in the east to the Vale of Mowbray in the west which separates it from Yorkshire Dales. It mainly covers upland area with one of the biggest expanses of heather moorland within it.\n\nThe photograph shows an example of a heather moorland located within the park.\n"
  ),
  Park(
    name: "Northumberland",
    photo: "assets/images/Northumberland_National_Park.jpg",
    color: const Color(0xFFAFCEFD),
    description: "Northumberland is a national park entirely located within the Northumberland county, in north east England, from which it takes its name. It's the most northern of English national parks. It covers a varied terrain with hills and moorland featuring in it.\n\nThe photo shows the view onto the Hadrian's Wall, of which central part lies within the park.\n"
  ),
  Park(
    name: "Peak District",
    photo: "assets/images/Mam_Tor.jpg",
    color: const Color(0xFF385171),
    description: "Peak District is a national park covering an upland area in the central part of northern England. It forms the southern end of the Pennines hill range and is mostly located within Derbyshire. Despite its name it mostly consists of soft hills, rather than sharp peaks.\n\nThe photo above is of the Mam Tor hill, within the park, near Castleton in Derbsyhire.\n"
  ),
  Park(
    name: "Pembrokeshire Coast",
    photo: "assets/images/Barafundle_Bay_beach_(May_2009).jpg",
    color: const Color(0xFF82B1E2),
    description: "Pembrokeshire Coast (Arfordir Penfro in Welsh) is located in southwestern Wales, along its namesake coast. It is the only national park in the UK largely composed of coastal landscape. The landscape includes cliffs, beaches and hills.\n\nThe photo shows Barafundle Bay (Bae Barafundle) which is a sandy beach within the park.\n"
  ),
  Park(
    name: "South Downs",
    photo: "assets/images/Devils_Dyke.jpg",
    color: const Color(0xFF4285F4),
    description: "South Downs is a national park located in southern England. It lies within the counties of Hampshire, West Sussex and East Sussex. It is the newest national park in UK, established in 2010. It includes a range of chalk hills from which the park takes its name as well as an area of undulating countryside called the Western Weald.\n\nThe photo shows a view of the South Downs from the Devil's Dyke, which is a valley within the park.\n"
  ),
  Park(
    name: "The Broads",
    photo: "assets/images/Breydon-north.jpg",
    color: const Color(0xFF4285F4),
    description: "The Broads is a network of mostly navigable lakes and rivers in eastern England, in the counties of Suffolk and Norfolk. Although not a national park by law, the authority managing the area has similar rights and responsibilities and was established in 1989. Lakes in the area, known as broads, were formed by flooding peat (turf) workings in the area.\n\nThe photo is of two rivers Yare and Waveney merging into Breydon Water in the area.\n"
  ),
  Park(
    name: "Yorkshire Dales",
    photo: "assets/images/1080px-Aysgarth_Falls_9190.jpg",
    color: const Color(0xFF979870),
    description: "Yorkshire Dales National Park lies mostly in North Yorkshire, in northern England. It mostly consists of upland landscape with valleys or dales mixed in. It covers central part of the Pennines. It is seperated from the North York Moors national park by the Vale of Mowbray, to the east of the park. The park was established in 1954. Over 95% of the park is privately owned.\n\nThe photo is of a section of Aysgarth Falls in the park.\n"
  )
];

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = -1;

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

    var selectParkSnackbar = SnackBar(
        content: const Text(
            'Please select a location first, before clicking "See Overview".'),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ));

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
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: Material(
              child: ListView.builder(
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 15) {
                      return const SizedBox(
                        height: 64,
                      );
                    }
                      return ListTile(
                        tileColor: ColorScheme.fromSeed(
                                brightness: isDarkMode ? Brightness.dark : Brightness.light,
                                seedColor: parks[index].color)
                            .surface,
                        textColor: ColorScheme.fromSeed(
                                brightness: isDarkMode ? Brightness.dark : Brightness.light,
                                seedColor: parks[index].color)
                            .onSurface,
                        selectedTileColor: ColorScheme.fromSeed(
                                brightness: isDarkMode ? Brightness.dark : Brightness.light,
                                seedColor: parks[index].color)
                            .onSurface
                            .withOpacity(0.12),
                        selectedColor: ColorScheme.fromSeed(
                                brightness: isDarkMode ? Brightness.dark : Brightness.light,
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
                        selected: index == _selectedIndex,
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      );
                  }),
            ))
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OpenContainer(
          closedBuilder: (context, open) {
            return FloatingActionButton.extended(
              elevation: 1,
              onPressed: () {
                if (_selectedIndex == -1) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(selectParkSnackbar);
                } else if (_selectedIndex != -1) {
                  open();
                }
              },
              label: const Text("See Overview"),
            );
          },
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          closedColor: Theme.of(context).colorScheme.primaryContainer,
          openColor: Theme.of(context).colorScheme.surface,
          openBuilder: (context, close) => Theme(
            data: ThemeData.from(
              colorScheme: isDarkMode ? ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color, brightness: Brightness.dark) : ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color)
            ),
            child: Scaffold(
              extendBodyBehindAppBar: true,
              body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 285,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: isDarkMode ? ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color, brightness: Brightness.dark).surfaceVariant : ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color).surfaceVariant,
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(parks[_selectedIndex].photo, height: 229, fit: BoxFit.cover)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(parks[_selectedIndex].name, textAlign: TextAlign.left, style: GoogleFonts.robotoSerif(
                                          color: isDarkMode ? ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color, brightness: Brightness.dark).onSurfaceVariant : ColorScheme.fromSeed(seedColor: parks[_selectedIndex].color).onSurfaceVariant,
                                            fontStyle: FontStyle.italic,
                                            fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                                            fontWeight: FontWeight.w900,
                                        )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      parks[_selectedIndex].description,
                                      style: GoogleFonts.robotoFlex(
                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                                      )),
                                  Text(
                                      "The trip for this park covers 10 different tree species\n",
                                      style: GoogleFonts.robotoFlex(
                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                                      )
                                  ),
                                  Text(
                                      'To start tap the "Start Trip" button at the bottom. To return to the list of locations tap the "Back" button.',
                                      style: GoogleFonts.robotoFlex(
                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                                      )
                                  )
                                ],
                              ),
                            ),
                          )
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton.tonal(onPressed: close, child: const Text("Back")),
                            const SizedBox(width: 8),
                            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.play_arrow_rounded), label: const Text("Start Trip"))
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          )),
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
                      "After selecting a location tap \"See Overview\" to see overview of the trip available for this location and to start the trip.", style: GoogleFonts.robotoFlex(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  )))
              ],
            ),
          )),
    );
  }
}
