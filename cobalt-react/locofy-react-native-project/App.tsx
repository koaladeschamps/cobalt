import * as React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { useFonts } from "expo-font";
import PageInitiale from "./screens/PageInitiale";
import EnSavoirPlus from "./screens/EnSavoirPlus";
import Calendrier from "./screens/Calendrier";
import { Entypo } from '@expo/vector-icons';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { View, Text, Platform, Pressable, TouchableOpacity } from "react-native";
import { Ionicons } from '@expo/vector-icons';
import { MaterialIcons } from '@expo/vector-icons';
import { FontAwesome } from '@expo/vector-icons';

const Tab =createBottomTabNavigator();

const screenOptions = {
  tabBarShowLabel:false,
  headerShown:false,
}

const App = () => {
  const [hideSplashScreen, setHideSplashScreen] = React.useState(true);

  const [fontsLoaded, error] = useFonts({
    "Roboto-Regular": require("./assets/fonts/Roboto-Regular.ttf"),
    "Roboto-Medium": require("./assets/fonts/Roboto-Medium.ttf"),
    "Roboto-Bold": require("./assets/fonts/Roboto-Bold.ttf"),
    "Roboto-Light": require("./assets/fonts/Roboto-Light.ttf"),
  });

  if (!fontsLoaded && !error) {
    return null;
  }
  return (
    <>
      <NavigationContainer>
       <Tab.Navigator screenOptions={screenOptions}>
          <Tab.Screen 
          name="1" 
          component={PageInitiale} 
          options={{
            tabBarIcon: ({focused})=>{
              return (
                <View style={{alignItems: "center", justifyContent: "center"}}> 
                  <Entypo name="home" size={24} color={focused ? "#16247d": "#111"} />
                  <Text style={{fontSize: 12, color: "#16247d"}}>HOME</Text>
            </View>
              )
            }
          }}
          />
          <Tab.Screen 
          name="2" 
          component={EnSavoirPlus} 
          options={{
            tabBarIcon: ({focused})=>{
              return (
                <View style={{alignItems: "center", justifyContent: "center"}}> 
                 <Entypo name="wallet" size={24} color={focused ? "#16247d": "#111"} />
                  <Text style={{fontSize: 12, color: "#16247d"}}>EnSavoirPlus</Text>
            </View>
              )
            }
          }}
          />
          <Tab.Screen 
          name="3" 
          component={Calendrier} 
           options={{
            tabBarIcon: ({focused})=>{
              return (
                <View
                 style={{
                  alignItems: "center",
                  justifyContent: "center",
                  backgroundColor: "#16247d",
                  width: Platform.OS == "ios" ? 50 : 60,
                  height: Platform.OS == "ios" ? 50 : 60,
                  top: Platform.OS == "ios" ? -10 : -20,
                  borderRadius: Platform.OS == "ios" ? 25 : 30
                 }}
                >
                  <FontAwesome name="exchange" size={24} color="#fff" />
                </View>
              )
            }
           }}
          />
          <Tab.Screen
           name="4" 
           component={PageInitiale}
           options={{
            tabBarIcon: ({focused})=>{
              return (
                <View style={{alignItems: "center", justifyContent: "center"}}> 
                 <MaterialIcons name="stacked-line-chart" size={24} color={focused ? "#16247d": "#111"} />
                  <Text style={{fontSize: 12, color: "#16247d"}}>PageInitiale</Text>
            </View>
              )
            }
          }}
           />
          <Tab.Screen 
          name="5" 
          component={PageInitiale} 
          options={{
            tabBarIcon: ({focused})=>{
              return (
                <View style={{alignItems: "center", justifyContent: "center"}}> 
                 <Ionicons name="stop" size={24}  color={focused ? "#16247d": "#111"} />
                  <Text style={{fontSize: 12, color: "#16247d"}}>STOP</Text>
            </View>
              )
            }
          }}
          />
       </Tab.Navigator>
      </NavigationContainer>
    </>
  );
};
export default App;
