import 'package:flutter/material.dart';
import 'package:flutter_app_cobalt_v1/models/theme.dart';
import 'package:table_calendar/table_calendar.dart';


class Page_Calendrier extends StatefulWidget {
  @override
  _Page_CalendrierState createState() => _Page_CalendrierState();
}

class _Page_CalendrierState extends State<Page_Calendrier> {
      CalendarFormat format = CalendarFormat.month;
      DateTime selectedDay = DateTime.now();
      DateTime focusedDay = DateTime.now();
      DateTime contracepte = DateTime.utc(2022,11,1);
      DateTime fin_contracepte = DateTime.utc(2022,11,13);

      @override
      Widget build(BuildContext context){
        return Scaffold(
          //
          body: Container(
            padding : const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 15,),
                TableCalendar(
                  focusedDay: focusedDay,
                  
                  startingDayOfWeek: StartingDayOfWeek.monday, 
                  daysOfWeekVisible: true, 
                  onDaySelected: (DateTime selectDay, DateTime focusDay){
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    });
                  },
                  
                  calendarFormat: format, 
                  onFormatChanged: ((CalendarFormat _format){ 
                    setState(() {
                      format = _format;
                    }); 
                  } ),
                  
                  calendarStyle: CalendarStyle(    
                      //rowDecoration: ,  
                      
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueGrey[50],
                      ),
                      
                      defaultDecoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueGrey[50],
                      ),

                    isTodayHighlighted: true,

                    selectedDecoration: BoxDecoration(
                      color:  Color.fromARGB(255, 44, 58, 137),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      //borderRadius: BorderRadius.circular(5),
                    ),

                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color:Color.fromARGB(255, 153, 168, 214),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    

                    ),

                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    ),
                  
                  locale: 'fr_FR',
                  //calendarBuilders: CalendarBuilders(

                    /*markerBuilder: (BuildContext context, date, events){
                      if (date.weekday == fin_contracepte) {
                          BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        );
                      }
                    
                    }*/

                      /*dowBuilder: (context, day) {
                        if (day == DateTime.sunday) {
                          final text = "hey";

                          return Center(
                            child: Text(
                              text,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                      },
                    ),*/

                  selectedDayPredicate: (DateTime date){ return isSameDay(selectedDay,date);},
                  
                  lastDay: DateTime(2050), //ok
                  firstDay: DateTime(1990) //ok
                  ),
                  SizedBox(height: 10,),
                  IconButton(
                    alignment: Alignment.bottomLeft,
                    onPressed:() {
                        showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        clipBehavior: Clip.antiAlias,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                          ),
                              ),
                         builder: (context){
                                return StatefulBuilder(
                                  builder: (context, setModalState){
                                    return Container(
                                      padding : EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text(
                                                  'Informations',
                                                  style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: CustomColors.police_foncee,
                                                  fontSize: 20
                                                  ),),
                                            SizedBox(height: 30,),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 5,),
                                                  Image.asset('assets/microscope_prevu.png', height: 40),
                                                  //const SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(                                                    
                                                        'Spermogramme à prévoir',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                        color: CustomColors.gris_clair_bouton_fleche,
                                                        fontSize: 12,
                                                        ),),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Image.asset('assets/microscope_fait.png', height: 40),
                                                  //const SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Container(
                                                      //width: 120,
                                                      child: Text(
                                                        'Spermogramme réalisé',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                        color: CustomColors.gris_clair_bouton_fleche,
                                                        fontSize: 12,
                                                        ),),
                                                    ),
                                                  ),
                                                ],
                                            ),
                                            const SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration :BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Color.fromARGB(255, 161, 159, 150),
                                                  ),),
                                                  const SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(                                                    
                                                        'Vous n’avez pas porté le dispositif 15h, il faut effectuer un spermogramme',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                        color: CustomColors.gris_clair_bouton_fleche,
                                                        fontSize: 12,
                                                        ),),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration :BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Colors.amber,
                                                  ),),
                                                  const SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Container(
                                                      //width: 120,
                                                      child: Text(
                                                        'Vous n’avez pas effectué de spermogramme qui confirme votre infertilité',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                        color: CustomColors.gris_clair_bouton_fleche,
                                                        fontSize: 12,
                                                        ),),
                                                    ),
                                                  ),
                                                ],
                                            ),
                                            const SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration :BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Color.fromARGB(255, 184, 132, 214),
                                                  ),),
                                                  const SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(                                                    
                                                        'Le dernier spermogramme indique que vous êtes infertile',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                        color: CustomColors.gris_clair_bouton_fleche,
                                                        fontSize: 12,
                                                        ),),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration :BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Color.fromARGB(255, 72, 159, 152),
                                                  ),),
                                                  const SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Container(
                                                      //width: 120,
                                                      child: Text(
                                                        'Le dernier spermogramme indique que vous êtes fertile',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                        color: CustomColors.gris_clair_bouton_fleche,
                                                        fontSize: 12,
                                                        ),),
                                                    ),
                                                  ),
                                                ],
                                            )
                                        ],
                                      ),
                                    );
                                  }
                                );
                            }
                        );
                  },
                  icon: Icon(Icons.info_rounded, color: Color.fromARGB(255, 28, 102, 231),)),
                  //SizedBox(height: 100,),
                  
              ],
            ),
          ),

          // bouton prendre rendez-vous 
          floatingActionButton: FloatingActionButton.extended(
                  //foregroundColor: CustomColors.bouton_demarrer_chrono,
                  splashColor: Color.fromRGBO(18, 13, 35, 1),
                  focusColor: CustomColors.bouton_demarrer_chrono,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Prendre rendez-vous'),
                  backgroundColor: CustomColors.sable_demarrer,
                  onPressed:(){},
                  //icon: const Icon(Icons.plus_one),
                  ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                                
        );
      }
  
}