import 'package:flutter/material.dart';
import 'parks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trees_page.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key, required this.selectedIndex, required this.isDarkMode});

  final int selectedIndex;
  final bool isDarkMode;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
          colorScheme: widget.isDarkMode ? ColorScheme.fromSeed(seedColor: parks[widget.selectedIndex].color, brightness: Brightness.dark) : ColorScheme.fromSeed(seedColor: parks[widget.selectedIndex].color)
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 285,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: widget.isDarkMode ? ColorScheme.fromSeed(seedColor: parks[widget.selectedIndex].color, brightness: Brightness.dark).surfaceVariant : ColorScheme.fromSeed(seedColor: parks[widget.selectedIndex].color).surfaceVariant,
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(parks[widget.selectedIndex].photo, height: 229, fit: BoxFit.cover)),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(parks[widget.selectedIndex].name, textAlign: TextAlign.left, style: GoogleFonts.robotoSerif(
                                  color: widget.isDarkMode ? ColorScheme.fromSeed(seedColor: parks[widget.selectedIndex].color, brightness: Brightness.dark).onSurfaceVariant : ColorScheme.fromSeed(seedColor: parks[widget.selectedIndex].color).onSurfaceVariant,
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              parks[widget.selectedIndex].description,
                              style: GoogleFonts.robotoFlex(
                                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                              )),
                          Text(
                              "The trip for this park covers 5 different tree species\n",
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
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton.tonal(onPressed: () {Navigator.pop(context);}, child: const Text("Back")),
                      const SizedBox(width: 8),
                      FilledButton.icon(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TreesPage(parkName: parks[widget.selectedIndex].name))
                        );
                      }, icon: const Icon(Icons.play_arrow_rounded), label: const Text("Start Trip"))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}