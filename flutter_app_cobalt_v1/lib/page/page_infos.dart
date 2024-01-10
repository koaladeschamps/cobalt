import 'package:flutter/material.dart';
import 'package:flutter_app_cobalt_v1/models/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Page_Infos extends StatefulWidget {
  @override
  _Page_InfosState createState() => _Page_InfosState();
}

class _Page_InfosState extends State<Page_Infos> {
      //Color color = CustomColors.barre_icone_clair;
      @override
      Widget build(BuildContext context){
        return Container(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding : const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommandations',
                  style: TextStyle(
                  color: CustomColors.police_foncee_gros_titre,
                  fontSize: 20,
                ),
                ),
                SizedBox(height: 10,),
                Text(
                  "L'équipe scientique répond à vos questions !",
                  style: TextStyle(
                  color: CustomColors.gris_clair_bouton_fleche,
                  fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    child: Row(
                        children: [
                        //const SizedBox(width: 5,),
                        Container(
                          height: 100,
                          width: 140,
                          child: MaterialButton(onPressed: (){
                            launchUrlString("https://www.allodocteurs.fr/sexo-contraception-contraception-masculine-quelles-sont-les-methodes-efficaces-et-reversibles-31403.html");},
                             child: Image.asset('assets/contraception_thermique.png',height: 100,),),
                        ),
                        
                        const SizedBox(width: 7,),
                        Image.asset('assets/reproduction.png',height: 100,),
                        const SizedBox(width: 7,),
                        Image.asset('assets/consentement.png',height: 100,),
                        const SizedBox(width: 7,),
                        Image.asset('assets/genre_sexualite.png',height: 100,),
                        ]
                  ),
                ),
                //ListView(),
                const SizedBox(height: 30,),
                Text("Sujets",
                    style: TextStyle(
                    color: CustomColors.police_foncee_gros_titre,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  //padding: const EdgeInsets.all(20),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Row(
                        children : [
                          SizedBox(width: 20,),
                          Image.asset('assets/Contraception.png',height: 125,),
                          SizedBox(width: 10,),
                          Image.asset('assets/Fertilite.png',height: 125,),
                      ]),
                      const SizedBox(height: 5,),
                      Row(
                        children : [
                          SizedBox(width: 45,),
                          Text("Contraception", style: TextStyle(
                            color: CustomColors.gris_clair_bouton_fleche,
                            fontSize: 14,
                            ),),
                          SizedBox(width: 85,),
                          Text("Fertilité",
                            style: TextStyle(
                              color: CustomColors.gris_clair_bouton_fleche,
                              fontSize: 14,
                              ),),
                        ]),
                      const SizedBox(height: 15,),
                      Row(
                        children : [
                          SizedBox(width: 20,),
                          Image.asset('assets/Education_sexuelle.png',height: 125,),
                          SizedBox(width: 10,),
                          Image.asset('assets/IST.png',height: 125,),
                      ]),
                      const SizedBox(height: 5,),
                      Row(
                        children : [
                          SizedBox(width: 32,),
                          Text("Education sexuelle", style: TextStyle(
                            color: CustomColors.gris_clair_bouton_fleche,
                            fontSize: 14,
                            ),),
                          SizedBox(width: 80,),
                          Text("IST",
                            style: TextStyle(
                              color: CustomColors.gris_clair_bouton_fleche,
                              fontSize: 14,
                              ),),
                        ]),

                      /*Container(
                        child : Image.asset('assets/Fertilite.png',height: 100,),
                      ),
                      Container(
                        child : Image.asset('assets/Education_sexuelle.png',height: 100,),
                      ),
                      Container(
                        child : Image.asset('assets/IST.png',height: 100,),
                      )*/
                    ],

                    ),
                  )
                  

              ],
            ),        
          ),
        );

}
}

/*
        return Scaffold(
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (_, i) {
          if (i < 2)
            return _buildBox();
          else if (i == 3)
            return _horizontalListView();
          else
            return _buildBox();
        },
      ),
    );
  }

  Widget _horizontalListView() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => _buildBox(),
      ),
    );
  }

  Widget _buildBox() => Container(margin: EdgeInsets.all(12), height: 100, width: 200, color: CustomColors.barre_icone_clair);
*/