import * as React from "react";
import { StyleSheet, View, Text, ScrollView } from "react-native";
import { Image } from "expo-image";
import { FontSize, Color, FontFamily, Border } from "../GlobalStyles";

export default function EnSavoirPlus() {
  const data = [
    {
      id: '1',
      imageSource: require("../assets/healthiconscontraceptivevoucher.png"),
      title: 'Qu’est ce que la contraception thermique ?',
      author: 'par R.Mieusset, ARDECOM',
    },
    // Add more items as needed
  ];



  return (
    <ScrollView>
    <View style={styles.enSavoirPlus}>
      <View style={[styles.enSavoirPlusChild, styles.savoirPosition]} />
      <Text style={styles.recommandationsLquipeScienContainer}>
        <Text style={styles.recommandations}>
          <Text style={styles.recommandations1}>{`Recommandations
`}</Text>
          <Text style={styles.blankLine}> </Text>
        </Text>
        <Text style={styles.lquipeScientifiqueRpond}>
          L’équipe scientifique répond à vos questions !
        </Text>
      </Text>
      <Text style={styles.sujets}>Sujets</Text>
      <Text style={[styles.contraception, styles.fertilitTypo]}>
        Contraception
      </Text>
      <Text style={[styles.fertilit, styles.fertilitTypo]}>Fertilité</Text>
    <View style={[styles.sliderWrapper, styles.savoirPosition]}>
        <View style={styles.sliderPosition}>
          <View style={[styles.sliderChild, styles.sliderPosition]} />
            <View style={[styles.sliderInner, styles.sliderInnerLayout]}>
              <View style={[styles.rectangleParent, styles.groupPosition]}>
                <View style={[styles.groupChild, styles.groupLayout]} />
                <Image
                  style={[
                    styles.healthiconscontraceptiveVouc,
                    styles.notorainbowIconLayout,
                  ]}
                  contentFit="cover"
                  source={require("../assets/healthiconscontraceptivevoucher.png")}
                />
                <Text style={styles.questCeQue}>
                  Qu’est ce que la contraception thermique ?
                </Text>
                <Text style={styles.parRmieussetArdecom}>{`par R.Mieusset,
                ARDECOM`}</Text>
              </View>
            </View>
            <View style={[styles.frameView, styles.sliderInnerLayout]}>
              <View style={[styles.rectangleGroup, styles.groupPosition]}>
                <View style={[styles.groupItem, styles.groupLayout]} />
                <Image
                  style={styles.healthiconspregnant0812wOut}
                  contentFit="cover"
                  source={require("../assets/healthiconspregnant0812woutline.png")}
                />
                <Text style={[styles.parMBlanchard, styles.parTypo]}>
                  par M. Blanchard
                </Text>
                <Text
                  style={[
                    styles.laReproductionComment,
                    styles.chosesSavoirTypo,
                  ]}
                >{`La reproduction, comment ça marche ?`}</Text>
              </View>
            </View>
            <View style={[styles.rectangleContainer, styles.groupViewLayout]}>
              <View style={[styles.groupInner, styles.groupLayout]} />
              <Image
                style={styles.emojionepersonGesturingNoMIcon}
                contentFit="cover"
                source={require("../assets/emojionepersongesturingnomediumskintone.png")}
              />
              <Text style={[styles.chosesSavoir, styles.chosesSavoirTypo]}>
                10 choses à savoir sur le consentement
              </Text>
              <Text style={[styles.parKLopez, styles.parTypo]}>
                par K. Lopez
              </Text>
            </View>
            <View style={[styles.sliderInner1, styles.sliderInnerLayout]}>
              <View style={[styles.groupView, styles.groupViewLayout]}>
                <View style={[styles.rectangleView, styles.groupLayout]} />
                <Image
                  style={[styles.notorainbowIcon, styles.notorainbowIconLayout]}
                  contentFit="cover"
                  source={require("../assets/notorainbow.png")}
                />
                <Text
                  style={[styles.chosesSavoir, styles.chosesSavoirTypo]}
                >{`Genre et 
                  sexualité`}</Text>
                <Text style={[styles.parDrognard, styles.parTypo]}>
                  par D.Rognard
                </Text>
              </View>
            </View>
        </View>
      </View>
      <Image
        style={[styles.unsplashlyr44oxwma4Icon, styles.iconLayout1]}
        contentFit="cover"
        source={require("../assets/unsplashlyr44oxwma4.png")}
      />
      <Image
        style={[styles.unsplashB4ppn1ssgwIcon, styles.iconLayout1]}
        contentFit="cover"
        source={require("../assets/unsplash-b4ppn1ssgw.png")}
      />
      <Image
        style={[styles.unsplasheaggqoiddmgIcon, styles.iconLayout]}
        contentFit="cover"
        source={require("../assets/unsplasheaggqoiddmg.png")}
      />
      <Text style={[styles.educationSexuelle, styles.istTypo]}>
        Education sexuelle
      </Text>
      <Text style={[styles.ist, styles.istTypo]}>IST</Text>
      <Image
        style={[styles.unsplash1nvnqiytoicIcon, styles.iconLayout]}
        contentFit="cover"
        source={require("../assets/unsplash1nvnqiytoic.png")}
      />
      <View style={[styles.enSavoirPlusItem, styles.savoirPosition]} />
      <View style={[styles.enSavoirPlusInner, styles.savoirPosition]} />
      <Image
        style={styles.unionIcon}
        contentFit="cover"
        source={require("../assets/bandeau-colore.png")}
      />
      <View style={[styles.menu, styles.menuLayout]}>
        <Text style={[styles.enSavoirPlus1, styles.istTypo]}>
          En savoir plus
        </Text>
        <Image
          style={[styles.settings61, styles.menuLayout]}
          contentFit="cover"
          source={require("../assets/settings-6-1.png")}
        />
        <Image
          style={styles.menuBisIcon}
          contentFit="cover"
          source={require("../assets/menu-bis.png")}
        />
      </View>
    </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  savoirPosition: {
    width: 375,
    left: 0,
    position: "absolute",
  },
  fertilitTypo: {
    top: 540,
    height: 29,
    fontSize: FontSize.size_base,
    color: Color.colorBlack,
    fontFamily: FontFamily.robotoRegular,
    textAlign: "left",
    position: "absolute",
  },
  sliderPosition: {
    height: 109,
    width: 644,
    top: 0,
    left: 0,
    position: "absolute",
  },
  sliderInnerLayout: {
    height: 101,
    width: 145,
    top: 3,
    position: "absolute",
  },
  groupPosition: {
    left: 0,
    top: 0,
  },
  groupLayout: {
    borderRadius: Border.br_3xs,
    height: 101,
    width: 145,
    top: 0,
    left: 0,
    position: "absolute",
  },
  notorainbowIconLayout: {
    height: 75,
    overflow: "hidden",
    position: "absolute",
  },
  parTypo: {
    height: 14,
    width: 84,
    color: Color.colorWhite,
    fontFamily: FontFamily.robotoLight,
    fontWeight: "300",
    fontSize: FontSize.size_3xs,
    textAlign: "left",
    position: "absolute",
  },
  chosesSavoirTypo: {
    left: 9,
    height: 51,
    width: 116,
    color: Color.colorWhite,
    fontSize: FontSize.size_sm,
    fontFamily: FontFamily.robotoRegular,
    textAlign: "left",
    position: "absolute",
  },
  groupViewLayout: {
    height: 103,
    position: "absolute",
  },
  iconLayout1: {
    height: 120,
    width: 134,
    left: 37,
    borderRadius: Border.br_3xs,
    position: "absolute",
  },
  iconLayout: {
    left: 202,
    height: 120,
    width: 134,
    borderRadius: Border.br_3xs,
    position: "absolute",
  },
  istTypo: {
    textAlign: "center",
    fontSize: FontSize.size_base,
    position: "absolute",
  },
  scrollContainer: {
    flexDirection: "row",
    padding: 10,
  },
  item: {
    backgroundColor: "lightblue",
    borderRadius: 5,
    padding: 10,
    marginLeft: 5,
    marginRight: 5,
  },
  itemText: {
    fontSize: 16,
  },
  menuLayout: {
    height: 24,
    position: "absolute",
  },
  enSavoirPlusChild: {
    top: 152,
    height: 660,
    backgroundColor: Color.colorWhite,
  },
  recommandations1: {
    fontSize: FontSize.size_base,
  },
  blankLine: {
    fontSize: FontSize.size_3xs,
  },
  recommandations: {
    color: Color.colorBlack,
    fontFamily: FontFamily.robotoRegular,
  },
  lquipeScientifiqueRpond: {
    fontSize: 12,
    color: "#858585",
    fontFamily: FontFamily.robotoLight,
    fontWeight: "300",
  },
  scrollView: {
    backgroundColor: "pink",
    marginHorizontal: 20,
  },
  recommandationsLquipeScienContainer: {
    top: 167,
    width: 259,
    height: 59,
    textAlign: "left",
    left: 26,
    position: "absolute",
  },
  sujets: {
    top: 372,
    height: 29,
    width: 54,
    fontSize: FontSize.size_base,
    color: Color.colorBlack,
    fontFamily: FontFamily.robotoRegular,
    textAlign: "left",
    left: 26,
    position: "absolute",
  },
  contraception: {
    left: 50,
    width: 104,
  },
  fertilit: {
    left: 244,
    width: 54,
    top: 540,
  },
  sliderChild: {
    backgroundColor: Color.colorWhite,
  },
  groupChild: {
    backgroundColor: "#23bdbd",
  },
  healthiconscontraceptiveVouc: {
    top: 32,
    left: 70,
    width: 81,
    overflow: "hidden",
  },
  questCeQue: {
    top: 13,
    left: 10,
    height: 51,
    width: 116,
    color: Color.colorWhite,
    fontSize: FontSize.size_sm,
    fontFamily: FontFamily.robotoRegular,
    textAlign: "left",
    position: "absolute",
  },
  parRmieussetArdecom: {
    top: 67,
    height: 26,
    width: 84,
    left: 8,
    color: Color.colorWhite,
    fontFamily: FontFamily.robotoLight,
    fontWeight: "300",
    fontSize: FontSize.size_3xs,
    textAlign: "left",
    position: "absolute",
  },
  rectangleParent: {
    width: 151,
    height: 107,
    top: 0,
    position: "absolute",
  },
  sliderInner: {
    left: 15,
  },
  groupItem: {
    backgroundColor: "#68ccae",
  },
  healthiconspregnant0812wOut: {
    top: 10,
    left: 55,
    width: 119,
    height: 119,
    overflow: "hidden",
    position: "absolute",
  },
  parMBlanchard: {
    top: 69,
    left: 8,
    height: 14,
  },
  laReproductionComment: {
    top: 16,
  },
  rectangleGroup: {
    width: 174,
    height: 129,
    top: 0,
    position: "absolute",
  },
  frameView: {
    left: 171,
    overflow: "hidden",
  },
  groupInner: {
    backgroundColor: "#a88db8",
  },
  emojionepersonGesturingNoMIcon: {
    top: 39,
    left: 79,
    width: 64,
    height: 64,
    opacity: 0.5,
    overflow: "hidden",
    position: "absolute",
  },
  chosesSavoir: {
    top: 14,
  },
  parKLopez: {
    top: 70,
    left: 6,
  },
  rectangleContainer: {
    left: 327,
    width: 145,
    height: 103,
    top: 3,
  },
  rectangleView: {
    backgroundColor: "#d07fa1",
  },
  notorainbowIcon: {
    top: 28,
    left: 66,
    width: 86,
    overflow: "hidden",
  },
  parDrognard: {
    top: 71,
    left: 7,
  },
  groupView: {
    width: 152,
    top: 0,
    left: 0,
  },
  sliderInner1: {
    left: 486,
  },
  sliderWrapper: {
    top: 240,
    height: 132,
  },
  unsplashlyr44oxwma4Icon: {
    top: 415,
  },
  unsplashB4ppn1ssgwIcon: {
    top: 574,
  },
  unsplasheaggqoiddmgIcon: {
    top: 574,
  },
  educationSexuelle: {
    width: 143,
    left: 33,
    top: 702,
    textAlign: "center",
    height: 29,
    color: Color.colorBlack,
    fontFamily: FontFamily.robotoRegular,
  },
  ist: {
    left: 240,
    width: 69,
    top: 702,
    textAlign: "center",
    height: 29,
    color: Color.colorBlack,
    fontFamily: FontFamily.robotoRegular,
  },
  unsplash1nvnqiytoicIcon: {
    top: 415,
  },
  enSavoirPlusItem: {
    top: 731,
    height: 81,
    backgroundColor: Color.colorWhite,
  },
  icone: {
    top: 748,
    width: 310,
    height: 42,
    left: 33,
    position: "absolute",
  },
  enSavoirPlusInner: {
    height: 147,
    top: 0,
    backgroundColor: Color.colorWhite,
  },
  unionIcon: {
    top: -347,
    left: -141,
    width: 626,
    height: 544,
    position: "absolute",
  },
  enSavoirPlus1: {
    left: 86,
    fontWeight: "500",
    fontFamily: FontFamily.robotoMedium,
    color: "#595085",
    textAlign: "center",
    top: 3,
  },
  settings61: {
    left: 261,
    width: 24,
    overflow: "hidden",
    top: 0,
  },
  menuBisIcon: {
    height: "50%",
    width: "6.32%",
    top: "25%",
    right: "93.68%",
    bottom: "25%",
    left: "0%",
    maxWidth: "100%",
    maxHeight: "100%",
    overflow: "hidden",
    position: "absolute",
  },
  menu: {
    top: 64,
    left: 43,
    width: 285,
  },
  enSavoirPlus: {
    flex: 1,
    width: "100%",
    height: 812,
    backgroundColor: Color.colorWhite,
  },
});
