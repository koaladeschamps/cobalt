import 'package:flutter/material.dart';
import 'package:flutter_app_cobalt_v1/models/theme.dart';

class Page_Profil extends StatefulWidget {
  @override
  _Page_ProfilState createState() => _Page_ProfilState();
}

class _Page_ProfilState extends State<Page_Profil> {
  @override
      Widget build(BuildContext context){
        return Container(
          
          padding : const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Row(
                  children : 
                  [
                    Image.asset("assets/Photo.png", height: 100,),
                    const SizedBox(width: 30,),
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                          Text("Enzo  Tarrin",  style: TextStyle(fontSize: 20, color : Color.fromARGB(255, 75, 75, 75), fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Contracepté depuis le 8 septembre 2021", style: TextStyle(fontSize: 12, color : Color.fromARGB(255, 87, 87, 87)),),
                          TextButton(child: Text("Changer le profil", style: TextStyle(fontSize: 12, color : Color.fromARGB(255, 58, 58, 58),decoration: TextDecoration.underline, ),), onPressed: () {} ,),
                        ]
                      ),
                    )
                    ]
                ),
                const SizedBox(height: 15,),
                const Text("Chiffres clés",  style: TextStyle(fontSize: 14, color : Color.fromARGB(255, 69, 79, 103), fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  child: Row(
                    children: [
                      chiffres_cle("5 mois sous contraception", Color.fromARGB(48, 92, 191, 92), Colors.green.shade800),
                      const SizedBox(width: 8,),
                      chiffres_cle("Dernier spermogramme il y a 10 jours", Color.fromARGB(48, 92, 191, 92), Colors.green.shade800),
                      const SizedBox(width: 8,),
                      chiffres_cle("Prochain spermogramme dans 4 mois", Color.fromARGB(48, 92, 191, 92), Colors.green.shade800),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("Les analyses de ma partenaire",  style: TextStyle(fontSize: 14, color :Color.fromARGB(255, 69, 79, 103), fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                chiffres_cle("Ajoutez votre partenaire", Color.fromARGB(255, 245, 221, 209), Color.fromARGB(255, 207, 102, 42)),
                const SizedBox(height: 15,),
                const Text("Mes informations",  style: TextStyle(fontSize: 24, color : Color.fromARGB(255, 69, 79, 103),),),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          mes_infos(Icons.co_present_outlined,
                           "Tous mes résultats et analyses",
                           "Retrouvez les résultats des laboratoires et votre analyse mensuelle",
                           CustomColors.fond_rectangleviolet,
                           CustomColors.policetitreviolet,
                           CustomColors.policesstitreviolet),
                          const SizedBox(height: 8,),
                          mes_infos(Icons.check_box_outlined, "Est-ce que j’utilise bien ma contraception ?",
                          "Retrouvez ici les protocoles et conseils associés à votre contraception",
                          CustomColors.fond_rectangleorangle,
                          CustomColors.policetitreorange,
                           CustomColors.policesstitreorange),
                        ],
                      ),
                      const SizedBox(width: 8,),
                      Column(
                        children: [

                          mes_infos(Icons.calendar_today_outlined,
                           "Quand faire mon spermogramme ?",
                            "Retrouvez ici la date conseillée pour vos prochaines analyses",
                            CustomColors.fond_rectanglevert,
                            CustomColors.policetitrevert,
                            CustomColors.policesstitrevert),
                           
                          const SizedBox(height: 8,),

                          mes_infos(Icons.favorite_border_sharp,
                           "Ajouter ma ou mon  partenaire ",
                            "En ajoutant ma partenaire, nous pouvons suivre ensemble la contraception de notre couple",
                            CustomColors.fond_rectanglerouge,
                            CustomColors.policetitrerouge,
                           CustomColors.policesstitrerouge),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
              ],
            )
            ),
        );
      }

  Container mes_infos(IconData icon, String titre, String sous_titre, Color background, Color color_title, Color color_subtitle ) {
    return Container(
                          //padding : const EdgeInsets.symmetric(horizontal: 1, vertical: 7),
                          width: 155,
                          height: 140,
                          decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5,),
                                Icon(icon, color: color_title,),
                                const SizedBox(height: 5,),
                                Text(titre,style: TextStyle(fontSize: 12, color : color_title),),
                                const SizedBox(height: 5,),
                                Text(sous_titre, style: TextStyle(fontSize: 10, color : color_subtitle,),),
                                const SizedBox(height: 5,),
                              ]),
                          ),
                        );
  }

  Container chiffres_cle(String texte, Color color_fond, Color color_lettre) {
    return Container(
                      padding : const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color_fond
                      ),
                      child: Text(texte, style: TextStyle(color: color_lettre),),
                    );
  }}
  