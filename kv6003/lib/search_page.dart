import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
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
              Expanded(child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          left: 16,
                          right: 16,
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets/images/Keswick_Panorama_-_Oct_2009.jpg",
                        width: 56,
                        height: 56,
                          fit: BoxFit.cover,
                        ),
                        ),
                      ),
                      Text("Lake District",
                        style: GoogleFonts.robotoFlex(
                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                          fontStyle: Theme.of(context).textTheme.bodyLarge?.fontStyle,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )
                    ]
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          left: 16,
                          right: 16,
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets/images/Mam_Tor.jpg",
                        width: 56,
                        height: 56,
                          fit: BoxFit.cover,
                        ),
                        ),
                      ),
                      Text("Peak District",
                        style: GoogleFonts.robotoFlex(
                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                          fontStyle: Theme.of(context).textTheme.bodyLarge?.fontStyle,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )
                    ]
                  )
                ],
              ))
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const FloatingActionButton.extended(
          elevation: 1,
          onPressed: AsyncSnapshot.nothing,
          label: Text("See Overview"),
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
                              backgroundColor: Colors.transparent,
                              focusColor: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant
                                  .withOpacity(0.12),
                              highlightColor: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.12),
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.outline)),
                        )
                      ],
                    ),
                    if (!_isCollapsed)
                      (const Text(
                          "Welcome to the treeTRIP app! Here you can enter or choose a location where you want the trip to take place. Like a national ark, or a heritage site."
                          "You can also find places based on your location, by clicking the icon on the right of the search bar."
                          "After selecting a location tap \"See overview\" to see overview of the trip available for this location and to start the trip. "))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
