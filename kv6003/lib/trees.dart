class Tree{
  String name;
  String latinName;
  String photo1;
  String photo2;
  String photo3;
  bool done;
  String tidbit;

  Tree({required this.name, required this.latinName, required this.photo1, required this.photo2, required this.photo3, required this.done, required this.tidbit});
}

List<Tree> trees = [
  Tree(
      name: "Apple",
      latinName: "malus ×domestica",
      photo1: "assets/images/marek-studzinski-3D6yReT06p0-unsplash (2).jpg",
      photo2: "assets/images/pascal-debrunner-8PCdIXlz_Ko-unsplash.jpg",
      photo3: "assets/images/aaron-blanco-tejedor-F5xZDJI2n2g-unsplash.jpg",
      done: false,
      tidbit: "Did you know that Apple trees aren't normally cultivated from seeds? Apple growers use cuttings or grafts to grow Apple trees as trees grown from seeds wouldn't produce the same type of apples as the original tree."
  ),
  Tree(
      name: "Black Alder",
      latinName: "alnus glutinosa",
      photo1: "assets/images/20120904Alnus_glutinosa01.jpg",
      photo2: "assets/images/960px-20120904Alnus_glutinosa14.jpg",
      photo3: "assets/images/771px-Alkottar.jpg",
      done: false,
      tidbit: "Did you know that Black Alders are able to grow in wet areas that would kill most other trees? That's because Black Alder trees live in symbiosis with a type of bacteria that converts atmospheric nitrogen into a form that the tree can use to grow."
  ),
  Tree(
    name: "European Ash",
    latinName: "fraxinus excelsior",
    photo1: "assets/images/480px-Le_Roeulx_AR9JPG.jpg",
    photo2: "assets/images/480px-Fraxinus_excelsior_4560.jpg",
    photo3: "assets/images/960px-Fraxinus_excelsior.jpg",
    done: false,
    tidbit: "Did you know that Ash trees have significance in European mythology? In Norse mythology, Yggdrasil, the world tree supporting the universe was believed to be an ash tree. In Celtic mythology it was associated with the god Lugh and was believed to protect from witches and evil spirits."
  ),
  Tree(
      name: "English Oak",
      latinName: "quercus robur",
      photo1: "assets/images/910px-Quercus_robur_in_hedge.jpg",
      photo2: "assets/images/1008px-Quercus_robur_flowers_kz01.jpg",
      photo3: "assets/images/960px-Philbhu_P9020127_Knopper_Gall_-_Andricus_quercuscalicis.jpg",
      done: false,
      tidbit: "Did you know that English Oaks have been part of some of the most important ships in English history? Mary Rose, King Henry VIII's warship, which sank in 1545, was made out of English Oaks. Admiral Nelson's HMS Victory, known for its role in the Battle of Trafalgar was also made out of English Oaks."
  ),
  Tree(
      name: "Field Maple",
      latinName: "acer campestre",
      photo1: "assets/images/540px-Acer_campestre_006.jpg",
      photo2: "assets/images/1129px-Acer-campestre-flowers.jpg",
      photo3: "assets/images/960px-Acer_campestre_009.jpg",
      done: false,
      tidbit: "Do you know how maple syrup is prepared? To make it, sap is collected from Maple trees in early spring, it's then boiled down to remove water. This results in a concentrated syrup that we know as maple syrup. Making maple syrup has been known for centuries in North America, but any Maple tree can be tapped for maple syrup, even the ones growing in UK."
  )
];