import 'package:flutter/material.dart';
import 'package:flutter_app_cobalt_v1/models/theme.dart';


class Page_Achat extends StatefulWidget {
  @override
  _Page_AchatState createState() => _Page_AchatState();
}

class _Page_AchatState extends State<Page_Achat> {
      Color color = CustomColors.barre_icone_clair;
      @override
      Widget build(BuildContext context){
        return Container(
          padding : EdgeInsets.symmetric(horizontal: 10, vertical: 20),
         child: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Trouver votre sous-vêtement",
                  style: TextStyle(
                    color: CustomColors.police_foncee_gros_titre,
                    fontSize: 20,
                    ),),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search_rounded, color: CustomColors.police_foncee_gros_titre,),
                      border: UnderlineInputBorder(),
                      hintText: 'Recherche',
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Bouton_achat(Color.fromARGB(255, 131, 190, 239),"Rouge et noir", "assets/calbutnoirrouge 1.png", "37.00"),
                          SizedBox(height: 10,),
                          Bouton_achat(Color.fromARGB(255, 239, 234, 131),"Violet et noir", "assets/calbutnoiretviolet.png", "37.50"),
                          SizedBox(height: 10,),
                          Bouton_achat(Color.fromARGB(255, 239, 176, 131),"Bleu et rose", "assets/calbutbleuetrose.png", "39.00"),
                          SizedBox(height: 10,),
                          Bouton_achat(Color.fromARGB(255, 176, 239, 131),"Blanc", "assets/calbutblanc.png", "40.00")
                        ],
                      ),
                      SizedBox(width: 10,),

                      Column(
                        children :[
                          Bouton_achat(Color.fromARGB(255, 136, 237, 235),"Bleu et rose", "assets/calbutbleuetrose.png", "39.00"),
                          SizedBox(height: 10,),
                          Bouton_achat(Color.fromARGB(255, 212, 135, 221),"Blanc", "assets/calbutblanc.png", "40.00"),
                          SizedBox(height: 10,),
                          Bouton_achat(Color.fromARGB(255, 170, 152, 226),"Violet et noir", "assets/calbutnoiretviolet.png", "37.50"),
                          SizedBox(height: 10,),
                          Bouton_achat(Color.fromARGB(255, 222, 106, 106),"Rouge et noir", "assets/calbutnoirrouge 1.png", "37.00")
                    ]),
                     
                    ],
                  )
                ],),
        ),); 
      }

      Widget Bouton_achat( Color color, String titre, String image, String prix) {
        return Container(
          //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric (vertical: 10),
                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(titre,
                                    style: TextStyle(color: Colors.black, fontSize: 14),),
                                    Row(children: [
                                      Text("Unique ou lot de cinq", style: TextStyle(color: Color.fromARGB(255, 109, 109, 109), fontSize: 10),),
                                      SizedBox(width: 10,),
                                      Image.asset("assets/check.png", height: 20,)]),
                                     SizedBox(width: 10,),
                                    Image.asset(image, height : 80),
                                    SizedBox(height: 10,),
                                    Text(prix + "€ à l'unité",
                                    style: TextStyle(color: Colors.black, fontSize: 14),),
                                  ],
                                ),
              ),
            ),
                          );
      }
}


