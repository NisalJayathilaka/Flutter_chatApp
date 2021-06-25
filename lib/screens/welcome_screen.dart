import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        seconds: 3,
      ),
      vsync: this,
    );
    animation1 = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    // animation loop
    // animation.addStatusListener((status) {
    //   if(status==AnimationStatus.completed)
    //   {
    //     controller.reverse(from:1.0);
    //   }
    //   else if(status==AnimationStatus.dismissed)
    //   {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {
        controller.value;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.withOpacity(controller.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation1.value * 55,
                  ),
                ),
                // Text(
                //   '${controller.value.toInt()}%',
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                //////////////
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                          fontSize: 43.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ],
            ),
///////////////////////////////////  //
//animation text

            // AnimatedTextKit(
            //   animatedTexts: [
            //     TypewriterAnimatedText(
            //       'Hello world!',
            //       textStyle: const TextStyle(
            //         fontSize: 32.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       speed: const Duration(milliseconds: 200),
            //     ),
            //   ],
            // ),

///////////////////////////////////////
            SizedBox(
              height: 48.0,
            ),
            RoundedButtonWidget(
              'Log In',
              Colors.lightBlueAccent,
              () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButtonWidget(
              'Register',
              Colors.blueAccent,
              () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
