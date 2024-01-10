import 'package:flutter/material.dart';
import 'package:flutter_app_cobalt_v1/page/page_achat.dart';
import 'package:flutter_app_cobalt_v1/page/page_calendrier.dart';
import 'package:flutter_app_cobalt_v1/page/page_calendrier_bis.dart';
import 'package:flutter_app_cobalt_v1/page/page_infos.dart';
import 'package:flutter_app_cobalt_v1/page/page_profil.dart';
import '../models/theme.dart';

//import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import '../models/sablier_gris.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of your application.
  int _selectedIndex = 0;
  int test = 0;
  bool click = true;
  Timer? countdownTimer;
  Duration myDuration = Duration(hours: 0);
  Duration quinze_moins_Myduration = Duration(hours: 15);
  Duration quinze_heure = Duration(hours: 15);
  
  
  @override
  void initState() {
    super.initState();
  }
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(hours: 0));
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds + reduceSecondsBy;
      final secondsbis = quinze_moins_Myduration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
        quinze_moins_Myduration = Duration(seconds: secondsbis);
      }
    });
  }
  
  

  final List<Widget> _widgetOptions = <Widget>[
    Container(),
    Page_Infos(),
    Page_Calendrierbis(),
    Page_Achat(),
    Page_Profil(),
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
  final days_duration = strDigits(myDuration.inDays);
    // Step 7
    final hours_duration = strDigits(myDuration.inHours.remainder(24));
    final minutes_duration = strDigits(myDuration.inMinutes.remainder(60));
    final seconds_duration = strDigits(myDuration.inSeconds.remainder(60));

    final days_quinze_moins_duration = strDigits(quinze_moins_Myduration.inDays);
  
    final hours_quinze_moins_duration = strDigits(quinze_moins_Myduration.inHours.remainder(24));
    final minutes_quinze_moins_duration = strDigits(quinze_moins_Myduration.inMinutes.remainder(60));
    final seconds_quinze_moins_duration = strDigits(quinze_moins_Myduration.inSeconds.remainder(60));

    final List<Widget> _TitleOptions = <Widget>[
    Text(
      'Accueil',
      style: TextStyle(
        color: ((click ==false)? Colors.white : CustomColors.barre_icone_fonce),
      ),
    ),
    Text(
      'En savoir plus',
      style: TextStyle(
        color: ((click ==false)? Colors.white : CustomColors.barre_icone_fonce),
      ),
    ),
    Text(
      'Calendrier',
      style: TextStyle(
        color:  ((click ==false)? Colors.white : CustomColors.barre_icone_fonce ),
      ),
    ),
    Text(
      'Achat',
      style: TextStyle(
        color:  ((click ==false)? Colors.white : CustomColors.barre_icone_fonce ),
      ),
    ),
    Text(
      'Profil',
      style: TextStyle(
        color:  ((click ==false)? Colors.white : CustomColors.barre_icone_fonce ),
      ),
    ),
  ];
    
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: ((click ==false)? CustomColors.background_foncee :  Colors.white ),
        title: _TitleOptions.elementAt(_selectedIndex),
        leading: Icon(Icons.menu_rounded,
        color: CustomColors.gris_clair_bouton_fleche, ),
        actions: [
        Icon(Icons.settings_rounded,
        color: CustomColors.gris_clair_bouton_fleche,),
        Icon(Icons.settings_rounded,
        color:((click ==false)? CustomColors.background_foncee :  Colors.white ))],
        elevation: 0.5,
        shadowColor: Colors.white,

      ),


      backgroundColor: ((click ==false)? CustomColors.background_foncee :  Colors.white ),

      /*body: Center(
        child: ((_selectedIndex==test)? Page_accueil1(hours_quinze_moins_duration, minutes_quinze_moins_duration, seconds_quinze_moins_duration, hours_duration, minutes_duration, seconds_duration) :_widgetOptions.elementAt(_selectedIndex)),
      ),*/
      body: Center(
        child: ((_selectedIndex==test)? 
        //Page_accueil1(hours_quinze_moins_duration, minutes_quinze_moins_duration, seconds_quinze_moins_duration, hours_duration, minutes_duration, seconds_duration) 
        page_acceuil(hours_quinze_moins_duration, minutes_quinze_moins_duration, seconds_quinze_moins_duration, hours_duration, minutes_duration, seconds_duration):_widgetOptions.elementAt(_selectedIndex)),
      ),

      bottomNavigationBar: BottomNavigationBar(
        

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, shadows: []),
            label: '' ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.loupe_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ((click ==false)? Color.fromARGB(255, 157, 195, 239) :  CustomColors.barre_icone_clair ),
        onTap: _onItemTapped,
        unselectedItemColor: CustomColors.barre_icone_clair,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        //showUnselectedLabels: false,
        /*selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),*/
        backgroundColor: ((click ==false)? CustomColors.background_foncee :  Colors.white ),
      ),
      
      );
    }

  Container page_acceuil(String hours_quinze_moins_duration, String minutes_quinze_moins_duration, String seconds_quinze_moins_duration, String hours_duration, String minutes_duration, String seconds_duration) {
    return Container(
  padding : EdgeInsets.symmetric(horizontal: 32),
  child: SingleChildScrollView(
    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    child: Column( //colonne de la page scrolable
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40,),

        // Texte de Bienvenue

        Text(
          'Bonjour !',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: ((click ==false)? Colors.white :CustomColors.police_foncee_gros_titre ),
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          ),

        Text(
          "J'espère que vous allez passer un très belle journée",
          style: TextStyle(
            color: CustomColors.gris_clair_bouton_fleche,
            fontSize: 14,
          ),),
        SizedBox(height: 35),

        //premier encadrer du temps

        box_temps(hours_quinze_moins_duration, minutes_quinze_moins_duration, seconds_quinze_moins_duration),

        SizedBox(height: 25),

          //Deuxième encadré Timeline

        timeline(hours_duration, minutes_duration, seconds_duration,click, myDuration,quinze_heure),
        SizedBox(height: 25),

        //Troisième encadré Prendre Rendez-vous
        
        box_page_accueil('assets/akar-icons_schedule.png',
        'assets/akar-icons_schedule_clair.png',"Prendre rendez-vous",
        "Trouvez un médecin prescripteur et un laboratoire d’analyse près de chez vous",
        15,
        click, 
        CustomColors.fond_rectangleorangle,
        CustomColors.policetitreorange,
        CustomColors.policesstitreorange,),
        SizedBox(height: 25),

        // Quatrième encadré Résultats d'analyses
        
        box_page_accueil('assets/icone_microscope.png',
        'assets/icone_microscope_clair.png',
        "Les résultats de vos Analyses",
        "Retrouvez ou ajoutez tous les résultats d’analyse de vos spermogrammes",
         15, 
         click, 
         CustomColors.fond_rectanglevert,
         CustomColors.policetitrevert,
        CustomColors.policesstitrevert,),
        SizedBox(height: 25),

        // Cinquième encadré Symptomes

        box_page_accueil('assets/icone_symptome.png',
        'assets/icone_symptome_clair.png',
        "Comment s'est passé votre journée ?",
        "Indiquez vos éventuels symptomes dû à l’utilisation de votre méthode",
        14,
        click,
        CustomColors.fond_rectanglerouge,
        CustomColors.policetitrerouge,
        CustomColors.policesstitrerouge,),
        SizedBox(height: 30),


      ]),
  ),
);
  }

  Container box_temps(String hours_quinze_moins_duration, String minutes_quinze_moins_duration, String seconds_quinze_moins_duration) {
    return Container(
        width: double.infinity,
        //height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ((click ==false)? CustomColors.fond_rectangle_fonce : CustomColors.fond_rectangle_clair ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            //GeneratedIcone_sablierWidget(CustomColors.police_foncee_gros_titre),
            ((click ==false) ? Image.asset('assets/sablier_bleu.png', height: 130,) : Image.asset('assets/sablier_gris.png', height: 130,)),
            
            SizedBox(height: 15,),
            ElevatedButton(                  
              onPressed: () {setState(() {
                            click = !click;
                            if (click == false) {
                          startTimer();
                          }
                          else {stopTimer();}
                        },
                          );},                  
              style: ElevatedButton.styleFrom(
                  backgroundColor: ((click ==false) ? CustomColors.sable_arret : CustomColors.bouton_demarrer_chrono),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),)
                  //padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: ((click ==false) ? const Text('Arrêter le chrono',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),) : Text(
                  'Démarrer le chrono',
                  style: TextStyle(
                  color: CustomColors.police_foncee,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            const SizedBox(height: 16),
            Text(
              'Il ne vous reste plus que ' + '$hours_quinze_moins_duration:$minutes_quinze_moins_duration:$seconds_quinze_moins_duration',
              style: TextStyle(
                color: ((click ==false) ? Colors.white :CustomColors.police_foncee),
               fontSize: 14,
              ),),
            SizedBox(height: 6),
            Text(
              "avant que vous atteignez les 15h du port du dispositif",
              style: TextStyle(
                color:((click ==false) ? Colors.white :CustomColors.police_foncee),
               fontSize: 10,
              ),),
            SizedBox(height: 13),
          ]),
        );
  }
    }

  Container box_page_accueil(String icon_clair,String icon_fonce, String titre, String sous_titre,  double police, bool click, Color fond_rectangle_clair, Color color_police_titre,Color color_police_ss_titre){
    

    return Container(
              padding : EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              
              //height: 100,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),  
              color: ((click ==false)? CustomColors.fond_rectangle_fonce : fond_rectangle_clair ),
            ),
            child: Column(
              children: [
                Row(
                  children:[
                  ((click ==false)? Image.asset(icon_fonce, height: 23,):Image.asset(icon_clair, height: 23,)),
                  SizedBox(width: 10),
                  Text(titre,
                      style: TextStyle(
                      color: ((click ==false)? Colors.white : color_police_titre ),
                      fontSize: police,
                      ),),                    
                  ]
                ),
                SizedBox(height: 15),
                Row(
                    children: [
                          Container(
                            width: 210,
                            child: Text(
                              sous_titre,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ((click ==false)? Color.fromARGB(255, 186, 207, 219) : color_police_ss_titre ),
                                fontSize: 12,
                                ),),
                          ),
                          SizedBox(width: 20,),
                          Container(
                          height: 20,
                          width: 20,
                          //padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                          child: ElevatedButton(
                            onPressed: (() => {}), 
                            style: ElevatedButton.styleFrom(
                            backgroundColor: ((click ==false)? CustomColors.sable_arret : CustomColors.gris_clair_bouton_fleche ),
                            shape: CircleBorder(),
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 1),
                            //maximumSize: Size.fromHeight(20)
                            //padding: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white, size: 13,)
                          ),
                        )
                        ],
                      ),
                
                
              ]),
          );
  }

  Container timeline(String hours_duration, String minutes_duration, String seconds_duration, bool click, Duration myDuration, Duration quinze_heure ) {
    return Container(
            padding : EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            //height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ((click ==false)? CustomColors.fond_rectangle_fonce : CustomColors.fond_rectangle_clair ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ((click ==false)? Image.asset('assets/icone_timeline_clair.png', height: 25,) : Image.asset('assets/icone_timeline.png', height: 25,)),
                    
                    SizedBox(width: 18),
                    Text("Modifier votre Timeline",
                      style: TextStyle(
                      color: ((click ==false)? Colors.white : CustomColors.police_foncee ),
                      fontSize: 16,
                      ),),
                    SizedBox(width: 25),
                    Container(
                      height: 20,
                      width: 20,
                      //padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                      child: ElevatedButton(
                        onPressed: (() => {}), 
                        style: ElevatedButton.styleFrom(
                        backgroundColor: ((click ==false)? CustomColors.sable_arret : CustomColors.gris_clair_bouton_fleche ),
                        shape: CircleBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 1),
                        //maximumSize: Size.fromHeight(20)
                        //padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white, size: 13,)
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: LinearPercentIndicator(
                    progressColor: ((click ==false) ? CustomColors.sable_arret : CustomColors.sable_demarrer),
                    backgroundColor: ((click ==false) ? Color.fromARGB(255, 8, 8, 60) : Color.fromARGB(255, 201, 201, 201)),
                    //animation: true,
                    //animationDuration: 1000,
                    lineHeight: 17.0,
                    //linearStrokeCap: LinearStrokeCap.roundAll,
                    barRadius: const Radius.circular(16),
                    percent:  
                    myDuration.inSeconds < quinze_heure.inSeconds ? 
                    myDuration.inSeconds/quinze_heure.inSeconds : 1
                  ),
                ),
                SizedBox(height: 20,),
                Text("Durée portée : "+ '$hours_duration:$minutes_duration:$seconds_duration',
                
                textAlign: TextAlign.center,
                
                style: TextStyle(
                      color: ((click ==false)? Color.fromARGB(255, 186, 207, 219) : CustomColors.gris_clair_bouton_fleche ),
                      fontSize: 12,
                      ),),
                //SizedBox(height: 10,),
              ],
            ),
            );
  }



