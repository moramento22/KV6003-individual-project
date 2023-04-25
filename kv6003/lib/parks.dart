import 'dart:ui';

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