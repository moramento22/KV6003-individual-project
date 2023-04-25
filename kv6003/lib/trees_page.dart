import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trees.dart';
import 'trees_species_page.dart';

class TreesPage extends StatefulWidget {
  const TreesPage({Key? key, required this.parkName}) : super(key: key);
  final String parkName;

  @override
  State<TreesPage> createState() => _TreesPageState();
}

class _TreesPageState extends State<TreesPage> {
  int _selectedIndex = -2;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              actions: [
                IconButton(onPressed: () {showModalBottomSheet(context: context, builder: (BuildContext context) {
                  return SizedBox(
                    height: 144,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          ListTile(
                              onTap: () {},
                              leading: const Icon(Icons.restart_alt_rounded),
                              title: const Text("Reset trip")
                          ),
                          ListTile(
                              onTap: () {Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);},
                              leading: const Icon(Icons.home_rounded),
                              title: const Text("Leave trip and come back to home screen")
                          )
                        ],
                      ),
                    ),
                  );
                });}, icon: Icon(Icons.more_horiz_rounded, color: Theme.of(context).colorScheme.onSurface))
              ],
              automaticallyImplyLeading: false,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(widget.parkName, textAlign: TextAlign.left, style: GoogleFonts.robotoSerif(
                  fontStyle: FontStyle.italic,
                  fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                  fontWeight: FontWeight.w900,
                )
                ),
              )
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                if(index == 0)
                {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Text("To take a picture of a tree, tap the tree on the list below to reveal more complementary hint photos and tap the \"Take a photo\" button."),
                        Divider()
                      ],
                    ),
                  );
                }
                return SizedBox(
                  height: 177,
                  child: Card(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index-1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TreeSpeciesPage(treeName: trees[_selectedIndex].name, photo1: trees[_selectedIndex].photo1, photo2: trees[_selectedIndex].photo2, photo3: trees[_selectedIndex].photo3))
                          );
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(trees[index-1].photo1, height: 95, fit: BoxFit.cover)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RichText(
                                      text: TextSpan(
                                          text: "${trees[index-1].name}\n",
                                          style: GoogleFonts.robotoSerif(
                                              fontWeight: FontWeight.w900,
                                              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                                              fontStyle: FontStyle.italic,
                                              color: Theme.of(context).colorScheme.onSurface
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(text: "(${trees[index-1].latinName})", style: GoogleFonts.robotoSerif(
                                                fontWeight: FontWeight.w300,
                                                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                                                fontStyle: FontStyle.italic,
                                                color: Theme.of(context).colorScheme.onSurface
                                            ))
                                          ]
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
                );
              },
            ),
          )
      ),
    );
  }
}