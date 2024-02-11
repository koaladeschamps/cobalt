import * as React from "react";
import {
  Text,
  StyleSheet,
  View,
  ScrollView,
  Button,
  AppState,
  TouchableOpacity,
} from "react-native";
import { Image } from "expo-image";
import { FontFamily, Color, Border, FontSize, Padding } from "../GlobalStyles";
import { useState, useEffect, useRef } from "react";

// import BackgroundTimer from 'react-native-background-timer';
// import PushNotification from 'react-native-push-notification';

// const formatTime = (milliseconds: number): string => {
//   const seconds = Math.floor(milliseconds / 1000);
//   const minutes = Math.floor(seconds / 60);
//   const hours = Math.floor(minutes / 60);

//   const formattedHours = String(hours).padStart(2, '0');
//   const formattedMinutes = String(minutes % 60).padStart(2, '0');
//   const formattedSeconds = String(seconds % 60).padStart(2, '0');

//   return `${formattedHours}:${formattedMinutes}:${formattedSeconds}`;
// };

// export default function PageInitiale() {
//   const initialTime = 15 * 60 * 60 * 1000; // 15 hours in milliseconds
//   const [elapsedTime, setElapsedTime] = useState<number>(initialTime);
//   const [isRunning, setIsRunning] = useState<boolean>(false);
//   const intervalIdRef = useRef<number | null>(null);

//   useEffect(() => {
//     const handleAppStateChange = (nextAppState: string) => {
//       if (nextAppState === 'active') {
//         startChronometer();
//       }
//     };

//     const appS = AppState.addEventListener('change', handleAppStateChange);

//     return () => {
//       appS.remove();
//     };
//   }, []);

//   const startChronometer = () => {
//     const startTime = Date.now() + elapsedTime;
//     setIsRunning(true);

//     // Update the chronometer display every second
//     intervalIdRef.current = BackgroundTimer.setInterval(() => {
//       const currentTime = Date.now();
//       const elapsed = startTime - currentTime;
//       setElapsedTime(elapsed);

//       if (elapsed <= 0) {
//         // Timer reached 0, send notification
//         sendNotification();
//         stopChronometer();
//       }
//     }, 1000);
//   };

//   const stopChronometer = () => {
//     setIsRunning(false);
//     if (intervalIdRef.current !== null) {
//       BackgroundTimer.clearInterval(intervalIdRef.current);
//     }
//   };

//   const resetChronometer = () => {
//     setElapsedTime(initialTime);
//   };

//   const sendNotification = () => {
//     PushNotification.localNotification({
//       title: 'Timer Expired',
//       message: 'Your timer has reached 0.',
//     });
//   };

const formatTime = (milliseconds: number): string => {
  const seconds = Math.floor(milliseconds / 1000);
  const minutes = Math.floor(seconds / 60);
  const hours = Math.floor(minutes / 60);

  const formattedHours = String(hours).padStart(2, "0");
  const formattedMinutes = String(minutes % 60).padStart(2, "0");
  const formattedSeconds = String(seconds % 60).padStart(2, "0");

  return `${formattedHours}:${formattedMinutes}:${formattedSeconds}`;
};

export default function PageInitiale() {
  const initialTime = 15 * 60 * 60 * 1000; // 1 hour in milliseconds
  const [elapsedTime, setElapsedTime] = useState<number>(initialTime);
  const [isRunning, setIsRunning] = useState<boolean>(false);
  const intervalIdRef = useRef<NodeJS.Timeout | null>(null);
  const startTimeRef = useRef<number>(Date.now());

  useEffect(() => {
    // Clean up the interval on component unmount
    return () => {
      if (intervalIdRef.current !== null) {
        clearInterval(intervalIdRef.current);
      }
    };
  }, []);

  const startChronometer = () => {
    if (!isRunning) {
      setIsRunning(true);
      startTimeRef.current = Date.now() + elapsedTime; // Reprendre le temps actuel
      intervalIdRef.current = setInterval(() => {
        const currentTime = Date.now();
        const elapsed = startTimeRef.current - currentTime;
        setElapsedTime(elapsed);
      }, 1000);
    }
  };

  const stopChronometer = () => {
    setIsRunning(false);
    if (intervalIdRef.current !== null) {
      clearInterval(intervalIdRef.current);
    }
  };

  const resetChronometer = () => {
    setElapsedTime(initialTime);
  };

  const percentageComplete = ((initialTime - elapsedTime) / initialTime) * 100;

  return (
    <View style={styles.pageInitiale}>
      <ScrollView style={styles.scrollView}>
        <View
          style={[
            styles.partieScrolablePageInitiale,
            styles.barreIconePosition,
          ]}
        >
          <Text style={[styles.bonjourJacquesContainer, styles.accueil1Typo]}>
            <Text style={styles.bonjourJacques}>{`Bonjour Jacques ! 
`}</Text>
            <Text style={styles.jespreQueVous}>
              J’espère que vous allez passer une belle journée
            </Text>
          </Text>
          <View style={[styles.temps, styles.tempsSpaceBlock]}>
            {isRunning ? (
              <Image
                style={styles.iconeSablier}
                contentFit="cover"
                source={require("../assets/sablier_bleu.png")}
              />
            ) : (
              <Image
                style={styles.iconeSablier}
                contentFit="cover"
                source={require("../assets/icone-sablier.png")}
              />
            )}

            <View
              style={[styles.boutonDemarrer, styles.boutonDemarrerSpaceBlock]}
            >
              <View style={styles.rectangleBoutonDemarrer} />
              {/* <Button title={isRunning ? "Arrêtez le chrono" : "Démarrer le chrono"} onPress={isRunning ? stopChronometer : startChronometer}/> */}
              <TouchableOpacity
                style={styles.boutonDemarrer}
                onPress={isRunning ? stopChronometer : startChronometer}
              >
                <Text style={styles.dmarrerLeChrono}>
                  {isRunning ? "Arrêtez le chrono" : "Démarrer le chrono"}
                </Text>
              </TouchableOpacity>
            </View>

            <Text
              style={[
                styles.portezLeDispositifContainer,
                styles.boutonDemarrerSpaceBlock,
              ]}
            >
              <Text style={styles.portezLeDispositif}>
                {isRunning
                  ? `Il ne reste plus que ${formatTime(elapsedTime)}\n`
                  : "Portez le dispositif 15h aujourd’hui\n"}
              </Text>
              <Text style={styles.appuyezPourDmarer}>
                {isRunning
                  ? "avant que vous atteignez les 15h du port du dispositif"
                  : "Appuyez pour démarrer la journée"}
              </Text>
              <Text style={styles.portezLeDispositif}>{` `}</Text>
            </Text>
          </View>
          <View style={[styles.modifierTimeline, styles.tempsSpaceBlock]}>
            <View
              style={[styles.titreIconeFlecheTimeline, styles.titreFlexBox]}
            >
              <Image
                style={styles.iconeTimeline}
                contentFit="cover"
                source={require("../assets/icone-timeline.png")}
              />
              <Text style={styles.modifierVotreTimeline}>
                Modifier votre Timeline
              </Text>
              <Image
                style={[styles.boutonFlecheIcon, styles.boutonIconLayout]}
                contentFit="cover"
                source={require("../assets/bouton-fleche.png")}
              />
            </View>
            <View style={styles.progressBarContainer}>
              <View
                style={[
                  styles.progressBar,
                  { width: `${percentageComplete}%` },
                ]}
              />
            </View>
            <Text style={styles.vousNavezPas}>
              Vous n’avez pas encore porté le dispositif
            </Text>
          </View>
          <View style={[styles.symptomes, styles.analyseLayout]}>
            <View style={[styles.titreIconeSymptome, styles.titreFlexBox]}>
              <Image
                style={styles.iconeSymptomes}
                contentFit="cover"
                source={require("../assets/icone-symptomes.png")}
              />
              <Text style={[styles.commentSestPass, styles.lesRsultatsDeTypo]}>
                Comment s’est passé votre journée ?
              </Text>
            </View>
            <View
              style={[styles.descriptionSymptomeFleche, styles.titreFlexBox]}
            >
              <Text
                style={[styles.indiquezVosVentuels, styles.lesRsultatsDe1Typo]}
              >{`Indiquez vos éventuels symptomes dû à l’utilisation de votre méthode`}</Text>
              <Image
                style={[styles.boutonFlecheIcon1, styles.boutonIconLayout]}
                contentFit="cover"
                source={require("../assets/bouton-fleche1.png")}
              />
            </View>
          </View>
          <View style={[styles.analyse, styles.analyseLayout]}>
            <View
              style={[styles.titreIconeResultatAnalyse, styles.titreFlexBox]}
            >
              <Image
                style={styles.iconeMicroscope}
                contentFit="cover"
                source={require("../assets/icone-microscope.png")}
              />
              <Text style={[styles.lesRsultatsDe, styles.lesRsultatsDeTypo]}>
                Les résultats de vos Analyses
              </Text>
            </View>
            <View style={styles.descriptionResultatsAnalyses}>
              <Text
                style={styles.lesRsultatsDe1Typo}
              >{`Les résultats de vos dernières analyses
sont disponibles !`}</Text>
              <Image
                style={[styles.boutonFlecheIcon2, styles.boutonIconLayout]}
                contentFit="cover"
                source={require("../assets/bouton-fleche2.png")}
              />
            </View>
          </View>
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
          {/* <Image
          style={styles.iconeBarre}
          contentFit="cover"
          source={require("../assets/icone-barre.png")}
        /> */}
          <View style={styles.accueil}>
            <Text style={[styles.accueil1, styles.accueil1Typo]}>Accueil</Text>
          </View>
          <Image
            style={styles.iconeParametre}
            contentFit="cover"
            source={require("../assets/icone-parametre.png")}
          />
        </View>
        {/* <Image
        style={[styles.barreIcone, styles.barreIconePosition]}
        contentFit="cover"
        source={require("../assets/barre-icone.png")}
      /> */}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  barreIconePosition: {
    left: 0,
    position: "absolute",
  },
  elapsedTimeText: {
    fontSize: 18,
    marginBottom: 10,
  },
  accueil1Typo: {
    fontFamily: FontFamily.robotoMedium,
    fontWeight: "500",
  },
  tempsSpaceBlock: {
    marginTop: 13,
    backgroundColor: Color.pagesDemarrerArretChronoFondRectangleClairDemarrer,
    alignItems: "center",
    borderRadius: Border.br_mini,
  },
  boutonDemarrerSpaceBlock: {
    marginTop: 19,
    height: 35,
  },
  titreFlexBox: {
    alignItems: "center",
    flexDirection: "row",
  },
  boutonIconLayout: {
    height: 20,
    width: 20,
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
  portezLeDispositifContainer: {
    width: 284,
    fontFamily: FontFamily.robotoRegular,
    textAlign: "center",
    color: Color.pagesDemarrerArretChronoPoliceFoncee,
  },
  temps: {
    justifyContent: "center",
    paddingHorizontal: 15,
    paddingVertical: Padding.p_base,
  },
  iconeTimeline: {
    width: 25,
    height: 24,
    borderRadius: Border.br_mini,
    overflow: "hidden",
  },
  modifierVotreTimeline: {
    width: 188,
    marginLeft: 17,
    fontSize: FontSize.size_sm,
    fontFamily: FontFamily.robotoRegular,
    color: Color.pagesDemarrerArretChronoPoliceFoncee,
    textAlign: "left",
  },
  boutonFlecheIcon: {
    marginLeft: 17,
  },
  titreIconeFlecheTimeline: {
    width: 279,
    flexDirection: "row",
  },
  tempsReferent: {
    backgroundColor: "#d9d9d9",
    width: 287,
    marginTop: 22,
    height: 19,
    borderRadius: Border.br_mini,
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
  iconeSymptomes: {
    height: 22,
    width: 20,
    borderRadius: Border.br_mini,
  },
  commentSestPass: {
    width: 250,
  },
  titreIconeSymptome: {
    flexDirection: "row",
  },
  indiquezVosVentuels: {
    width: 204,
  },
  boutonFlecheIcon1: {
    marginLeft: 33,
  },
  descriptionSymptomeFleche: {
    marginTop: 11,
    flexDirection: "row",
  },
  symptomes: {
    paddingHorizontal: 14,
    paddingVertical: 22,
  },
  iconeMicroscope: {
    width: 26,
    height: 26,
    borderRadius: Border.br_mini,
    overflow: "hidden",
  },
  lesRsultatsDe: {
    width: 229,
  },
  titreIconeResultatAnalyse: {
    width: 278,
    flexDirection: "row",
  },
  boutonFlecheIcon2: {
    marginLeft: 27,
  },
  descriptionResultatsAnalyses: {
    marginTop: 10,
    flexDirection: "row",
  },
  analyse: {
    paddingHorizontal: 10,
    paddingVertical: Padding.p_base,
  },
  partieScrolablePageInitiale: {
    paddingHorizontal: 30,
    paddingTop: 165,
    paddingBottom: 300,
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
  iconeBarre: {
    width: 18,
    height: 12,
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
    marginBottom: -100,
  },
  progressBar: {
    height: "100%",
    backgroundColor: "#007BFF",
  },
  progressBarContainer: {
    marginTop: 16,
    width: "80%",
    height: 12,
    backgroundColor: "lightgray",
    borderRadius: 10,
    overflow: "hidden",
  },
});
