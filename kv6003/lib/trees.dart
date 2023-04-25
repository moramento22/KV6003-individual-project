class Tree{
  String name;
  String latinName;
  String photo1;
  String photo2;
  String photo3;

  Tree({required this.name, required this.latinName, required this.photo1, required this.photo2, required this.photo3});
}

List<Tree> trees = [
  Tree(
      name: "Apple",
      latinName: "malus x domestica",
      photo1: "assets/images/marek-studzinski-3D6yReT06p0-unsplash (2).jpg",
      photo2: "assets/images/pascal-debrunner-8PCdIXlz_Ko-unsplash.jpg",
      photo3: "assets/images/aaron-blanco-tejedor-F5xZDJI2n2g-unsplash.jpg"
  ),
  Tree(
      name: "Black Alder",
      latinName: "alnus glutinosa",
      photo1: "assets/images/20120904Alnus_glutinosa01.jpg",
      photo2: "assets/images/960px-20120904Alnus_glutinosa14.jpg",
      photo3: "assets/images/771px-Alkottar.jpg"
  ),
  Tree(
    name: "European Ash",
    latinName: "fraxinus excelsior",
    photo1: "assets/images/480px-Le_Roeulx_AR9JPG.jpg",
    photo2: "assets/images/480px-Fraxinus_excelsior_4560.jpg",
    photo3: "assets/images/960px-Fraxinus_excelsior.jpg",
  ),
  Tree(
      name: "English Oak",
      latinName: "quercus robur",
      photo1: "assets/images/910px-Quercus_robur_in_hedge.jpg",
      photo2: "assets/images/1008px-Quercus_robur_flowers_kz01.jpg",
      photo3: "assets/images/960px-Philbhu_P9020127_Knopper_Gall_-_Andricus_quercuscalicis.jpg"
  ),
  Tree(
      name: "Maple",
      latinName: "acer campestre",
      photo1: "assets/images/540px-Acer_campestre_006.jpg",
      photo2: "assets/images/1129px-Acer-campestre-flowers.jpg",
      photo3: "assets/images/960px-Acer_campestre_009.jpg"
  )
];