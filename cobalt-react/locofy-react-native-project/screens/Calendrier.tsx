import * as React from "react";
import {
  Text,
  StyleSheet,
  View,
  ScrollView,
  Button,
  AppState,
  TouchableOpacity,
  SafeAreaView,
} from "react-native";
import { Image } from "expo-image";
import { FontFamily, Color, Border, FontSize, Padding } from "../GlobalStyles";
import { useState, useEffect, useRef } from "react";
import { Calendar, LocaleConfig ,DateData } from "react-native-calendars";

type DayPressEvent = {
  date: { year: number; month: number; day: number };
  day: number;
  month: number;
  timestamp: number;
};

LocaleConfig.locales['fr'] = {
  monthNames: [
    'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
    'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
  ],
  monthNamesShort: [
    'Janv.', 'Févr.', 'Mars', 'Avr.', 'Mai', 'Juin',
    'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'
  ],
  dayNames: [ 'Dimanche','Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
  dayNamesShort: ['Dim','Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],
  today: 'Aujourd\'hui'
};

// Configuration de la langue française par défaut
LocaleConfig.defaultLocale = 'fr';

export default function Calendrier() {
  const [selectedDate, setSelectedDate] = useState<{
    year: number;
    month: number;
    day: number;
  } | null>(null);
  const [appointments, setAppointments] = useState<{ [date: string]: string }>(
    {}
  );

  const onDayPress = (day: DateData) => {
    const { year, month, day: selectedDay } = day;
    setSelectedDate({ year, month, day: selectedDay });
  };

  const handleTakeAppointment = () => {
    if (selectedDate) {
      const formattedDate = `${selectedDate.year}-${selectedDate.month + 1}-${
        selectedDate.day
      }`;
      // Add logic to take an appointment for the selected date
      // For example, here, we use a simple object to store appointments
      setAppointments({
        ...appointments,
        [formattedDate]: "New appointment", // You can customize this value
      });
    }
  };

  return (
    <View style={styles.pageInitiale}>
      <ScrollView style={styles.scrollView}>
        <View
          style={[
            styles.partieScrolablePageInitiale,
            styles.barreIconePosition,
          ]}
        >
          <View style={{marginHorizontal:10, left:-30}}>
          <Calendar
                onDayPress={onDayPress}
                style={{width:'130%',}}
                firstDay={1}
                theme={{calendarBackground: '#FCDB86'}}
                markedDates={{
                  [selectedDate
                    ? `${selectedDate.year}-${selectedDate.month + 1}-${
                        selectedDate.day
                      }`
                    : ""]: {
                    selected: true,
                  },
                }}

              />
              </View>
              {selectedDate && (
                <View>
                  <Text>
                    Appointments for{" "}
                    {`${selectedDate.year}-${selectedDate.month + 1}-${
                      selectedDate.day
                    }`}{" "}
                    :
                  </Text>
                  <Text>
                    {
                      appointments[
                        `${selectedDate.year}-${selectedDate.month + 1}-${
                          selectedDate.day
                        }`
                      ]
                    }
                  </Text>
                  <TouchableOpacity onPress={handleTakeAppointment}>
                    <Text>Take an appointment</Text>
                  </TouchableOpacity>
                </View>
              )}
        </View>
        <Image
          style={styles.bandeauNeutreIcon}
          contentFit="cover"
          source={require("../assets/bandeau-neutre.png")}
        />
        <Image
          style={styles.bandeauColoreIcon}
          contentFit="cover"
          source={require("../assets/bandeau-colore.png")}
        />
        <View style={[styles.menu, styles.titreFlexBox]}>
          <View style={styles.accueil}>
            <Text style={[styles.accueil1, styles.accueil1Typo]}>Accueil</Text>
          </View>
          <Image
            style={styles.iconeParametre}
            contentFit="cover"
            source={require("../assets/icone-parametre.png")}
          />
        </View>
        <SafeAreaView
          style={{ flex: 1, justifyContent: "center", alignItems: "center" }}
        >
          <View>
          </View>
        </SafeAreaView>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  barreIconePosition: {
    left: 0,
    position: "absolute",
  },
  accueil1Typo: {
    fontFamily: FontFamily.robotoMedium,
    fontWeight: "500",
  },
  titreFlexBox: {
    alignItems: "center",
    flexDirection: "row",
  },
  scrollView: {
    backgroundColor: "pink",
    marginHorizontal: 20,
  },
  analyseLayout: {
    width: 314,
    marginTop: 13,
    alignItems: "center",
    backgroundColor: Color.pagesDemarrerArretChronoFondRectangleClairDemarrer,
    borderRadius: Border.br_mini,
  },
  lesRsultatsDeTypo: {
    marginLeft: 8,
    fontSize: FontSize.size_sm,
    fontFamily: FontFamily.robotoRegular,
    color: Color.pagesDemarrerArretChronoPoliceFoncee,
    textAlign: "left",
  },
  lesRsultatsDe1Typo: {
    fontSize: FontSize.size_xs,
    fontFamily: FontFamily.robotoRegular,
    color: Color.pagesDemarrerArretChronoGrisClairBoutonFleche,
    textAlign: "left",
  },
  bonjourJacques: {
    fontSize: 35,
    color: "#355172",
  },
  jespreQueVous: {
    fontSize: 17,
    color: Color.pagesDemarrerArretChronoGrisClairBoutonFleche,
  },
  bonjourJacquesContainer: {
    width: 282,
    height: 103,
    textAlign: "left",
  },
  iconeSablier: {
    width: 136,
    height: 133,
    overflow: "hidden",
  },
  rectangleBoutonDemarrer: {
    borderRadius: 10,
    backgroundColor: Color.pagesDemarrerArretChronoBoutonDemarrerChrono,
    shadowColor: "rgba(122, 122, 122, 0.25)",
    shadowOffset: {
      width: 0,
      height: 4,
    },
    shadowRadius: 4,
    elevation: 4,
    shadowOpacity: 1,
    height: 35,
    width: 158,
    left: 0,
    top: 0,
    position: "absolute",
  },
  dmarrerLeChrono: {
    top: -11,
    left: 13,
    fontSize: 15,
    fontWeight: "600",
    fontFamily: FontFamily.robotoBold,
    width: 132,
    height: 17,
    textAlign: "center",
    color: Color.pagesDemarrerArretChronoPoliceFoncee,
    position: "absolute",
  },
  boutonDemarrer: {
    width: 158,
    marginTop: 19,
  },
  portezLeDispositif: {
    fontSize: FontSize.size_sm,
  },
  appuyezPourDmarer: {
    fontSize: 11,
  },
  temps: {
    justifyContent: "center",
    paddingHorizontal: 15,
    paddingVertical: Padding.p_base,
  },
  vousNavezPas: {
    fontSize: 13,
    marginTop: 22,
    fontFamily: FontFamily.robotoRegular,
    textAlign: "center",
    color: Color.pagesDemarrerArretChronoGrisClairBoutonFleche,
  },
  modifierTimeline: {
    paddingHorizontal: 13,
    paddingVertical: 21,
  },
  lesRsultatsDe: {
    width: 229,
  },
  analyse: {
    paddingHorizontal: 10,
    paddingVertical: Padding.p_base,
  },
  partieScrolablePageInitiale: {
    paddingHorizontal: 50,
    paddingTop: 165,
    paddingBottom: 113,
    overflow: "hidden",
    top: 0,
    left: 0,
    backgroundColor: Color.colorWhite,
  },
  bandeauNeutreIcon: {
    width: 617,
    height: 479,
    top: -300,
  },
  bandeauColoreIcon: {
    width: 656,
    height: 575,
    top: -850,
    left: -150,
  },
  accueil1: {
    width: "123.26%",
    top: "0%",
    left: "-11.63%",
    fontSize: FontSize.size_base,
    color: Color.colorDarkslategray,
    textAlign: "center",
    position: "absolute",
  },
  accueil: {
    width: 53,
    marginLeft: 96,
    height: 19,
  },
  iconeParametre: {
    width: 22,
    marginLeft: 96,
    height: 22,
  },
  menu: {
    top: 65,
    left: 45,
    flexDirection: "row",
    position: "absolute",
  },
  barreIcone: {
    top: 732,
    width: 375,
    height: 80,
  },
  pageInitiale: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    width: "110%",
    height: "100%",
    backgroundColor: Color.colorWhite,
    marginLeft: "-7%",
  },
});
