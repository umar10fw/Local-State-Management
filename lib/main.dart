import 'package:flutter/material.dart';
import 'package:state_managment/Custom_Widget/InheritedWidget_State/Authentication_State.dart';
import 'package:state_managment/Custom_Widget/Key_State_Preservation/UniqueKey.dart';
import 'Custom_Widget/InheritedWidget_State/Localization_State.dart';
import 'Custom_Widget/InheritedWidget_State/MediaQuery_State.dart';
import 'Custom_Widget/InheritedWidget_State/Navigation_State.dart';
import 'Custom_Widget/InheritedWidget_State/NewScreen.dart';
import 'Custom_Widget/Key_State_Preservation/ObjectKey.dart';
import 'Custom_Widget/Key_State_Preservation/Value_Key_Preservation.dart';
import 'Custom_Widget/Lifting_State/Favorite_Button.dart';
import 'Custom_Widget/Lifting_State/FormField.dart';
import 'Custom_Widget/Lifting_State/radioTileButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', ''),
        Locale('ur', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Local State Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int add = 0;
  void addMethod() {
    setState(() {
      add++;
    });
  }

  void minusMethod() {
    setState(() {
      if (add > 0) {
        add--; // not go value in Negative
      }
    });
  }

  bool obscure = true;
  void isTogglePassword() {
    setState(() {
      obscure = !obscure;
    });
  }

  bool isSwitchOn = false;
  void isToggle(bool value) {
    setState(() {
      isSwitchOn = value;
    });
  }

  bool isFavorite = false;
  void isToggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  String selectedValue = "";
  void updateValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  String name = "";
  String email = "";
  void updateEmail(String value){
    setState(() {
      name = value;
    });
  }
  void updateName(String value){
    setState(() {
      email = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Use Case No 1:  Counter Number",
                        style: TextStyle(color: Colors.pink),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              style: const TextStyle(fontSize: 25),
                              "Value = $add"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: ElevatedButton(
                                    onPressed: addMethod,
                                    style: ElevatedButton.styleFrom(
                                      shape:
                                          const CircleBorder(), // makes button circular
                                      padding: EdgeInsets
                                          .zero, // removes extra padding
                                      backgroundColor:
                                          Colors.green, // button color
                                      foregroundColor:
                                          Colors.white, // icon color
                                      elevation: 4, // shadow
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 28, // icon size
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: ElevatedButton(
                                    onPressed: minusMethod,
                                    style: ElevatedButton.styleFrom(
                                      shape:
                                          const CircleBorder(), // makes button circular
                                      padding: EdgeInsets
                                          .zero, // removes extra padding
                                      backgroundColor:
                                          Colors.red, // button color
                                      foregroundColor:
                                          Colors.white, // icon color
                                      elevation: 4, // shadow
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      size: 28, // icon size
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Use Case No 2:  Show and Hide Password",
                        style: TextStyle(color: Colors.pink),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextField(
                          obscureText: obscure,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                icon: obscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: isTogglePassword // 👈 update state
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Use Case No 3:  Toggle Button",
                        style: TextStyle(color: Colors.pink),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                            value: isSwitchOn,
                            onChanged: isToggle,
                          ),
                          Text(
                            isSwitchOn ? "Switch is ON 🔵" : "Switch is OFF ⚪",
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Use Case No 4:  Lifting State Management with Favorite Icon",
                        style: TextStyle(color: Colors.pink),
                      ),
                      FavoriteButton(
                        isToggleFavorite: isToggleFavorite,
                        isFavorite: isFavorite,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Use Case No 5:  Lifting State Management with Radio Tile List",
                        style: TextStyle(color: Colors.pink),
                      ),
                      Column(
                        children: [
                          RadioTileButton(
                            option: 'A',
                            groupValue: selectedValue,
                            onchange: updateValue,
                          ),
                          RadioTileButton(
                            option: 'B',
                            groupValue: selectedValue,
                            onchange: updateValue,
                          ),
                          RadioTileButton(
                            option: 'C',
                            groupValue: selectedValue,
                            onchange: updateValue,
                          ),
                          RadioTileButton(
                            option: 'D',
                            groupValue: selectedValue,
                            onchange: updateValue,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Use Case No 6:  Lifting State Management with FormField",
                          style: TextStyle(color: Colors.pink),
                        ),
                        EmailField(
                          onChanged: updateEmail,
                        ),
                        Text("Email: $email",style: TextStyle(color: Colors.blue),),
                        NameField(
                          onChanged: updateName,
                        ),
                        Text("Name: $name",style: TextStyle(color: Colors.blue),),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                "Use Case No 7:  Preserve TextField State with ValueKey",
                                style: TextStyle(color: Colors.pink),
                              ),
                              Container(
                                  height: 200,
                                  child: ValueKeyPreservation())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Use Case No 8:  Preserve TextField State with UniqueKey",
                          style: TextStyle(color: Colors.pink),
                        ),
                        Uniquekey_Preservation(),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Use Case No 9  Preserve TextField State with ObjectKey",
                          style: TextStyle(color: Colors.pink),
                        ),
                        Container(
                            height: 180,
                            child: ObjectkeyPreservation()),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Use Case No 10 Inherited Widget State Management For Theme Mode",
                          style: TextStyle(color: Colors.pink),
                        ),
                        Text("Current Theme Type",
                        style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Use Case No 11 Inherited Widget State Management For MediaQuery",
                          style: TextStyle(color: Colors.pink),
                        ),
                        MediaqueryState(),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Use Case No 12 Inherited Widget State Management For Navigation",
                          style: TextStyle(color: Colors.pink),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SecondScreen(),));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(), // makes button circular
                            padding: EdgeInsets.zero, // removes extra padding
                            backgroundColor: Colors.blue, // button color
                            foregroundColor: Colors.white, // icon color
                            elevation: 4, // shadow
                          ),
                          child: const Icon(
                            Icons.navigate_next_outlined,
                            size: 28, // icon size
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Use Case No 13 Inherited Widget State Management\n For Localization Languages",
                          style: TextStyle(color: Colors.pink),
                        ),
                        LanguageExample()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Use Case No 14: Use Case No 13 Inherited Widget State Management\n For Authentication",
                    style: TextStyle(color: Colors.pink),
                  ),
                  Container(
                      height: 200,
                      child: AuthExample())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthExample extends StatefulWidget {
  const AuthExample({super.key});

  @override
  State<AuthExample> createState() => _AuthExampleState();
}

class _AuthExampleState extends State<AuthExample> {

  String user = "Name";
  void logout(){
    setState(() {
      user = "guest";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthProvider(user: user, logout: logout, child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ));
  }
}
