import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design1/styles/colors.dart';
import 'package:ui_design1/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double _height;
  late double _width;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  double _logoBgSize = 0.0;
  double _logoOpacity = 0.0;
  double _textFieldOpacity = 0.0;
  double _loginButtonOpacity = 0.0;
  double _loginWith = 300;
  bool _loginCirclarAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _logoBgSize = 100;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _logoOpacity = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2200), () {
      setState(() {
        _textFieldOpacity = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        _loginButtonOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/bg_blur.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          margin: EdgeInsets.only(left: _width * .23),
          height: double.infinity,
          width: _height / 40,
          decoration: BoxDecoration(
            color: colorPrimary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _width * .125, vertical: _height * .125),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              boxShadow: [
                BoxShadow(
                  color: colorMedium.withOpacity(.5),
                  blurRadius: 2,
                  offset: Offset(5, 10),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  width: _width * .75,
                  height: _height * .75,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: colorLightTint.withOpacity(.7)),
                    color: colorLightTint.withOpacity(.3),
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Center(
                                    child: AnimatedContainer(
                                      width: _logoBgSize,
                                      height: _logoBgSize,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.bounceOut,
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: colorPrimary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  duration: Duration(seconds: 2),
                                  opacity: _logoOpacity,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child:
                                          Image.asset('assets/images/logo.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 2200),
                            opacity: _textFieldOpacity,
                            child: customTextField(
                                icon: Icons.person_rounded,
                                controller: _usernameController,
                                hint: 'Username'),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 2200),
                            opacity: _textFieldOpacity,
                            child: customTextField(
                                icon: Icons.vpn_key_rounded,
                                controller: _passwordController,
                                hint: 'Password'),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 2500),
                            opacity: _loginButtonOpacity,
                            child: _animatedLoginButton(),
                          ),
                          AnimatedOpacity(
                              duration: Duration(milliseconds: 2700),
                              opacity: _loginButtonOpacity,
                              child: _signInMethods()),
                        ],
                      ),
                      AnimatedOpacity(
                          duration: Duration(milliseconds: 2500),
                          opacity: _loginButtonOpacity,
                          child: _registerButton()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _animatedLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _loginCirclarAnimated = true;
            _loginWith = 60;
          });
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              _loginCirclarAnimated = false;
              _loginWith = 300;
            });
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorSecondary,
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          width: _loginWith,
          height: 60,
          child: Center(
            child: _loginCirclarAnimated
                ? CircularProgressIndicator(
                    color: colorLightTint,
                  )
                : Text(
                    'Login',
                    style: TextStyle(
                        color: colorLightTint,
                        fontSize: 20,
                        fontFamily: 'Lexend-L'),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _signInMethods() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/google.png',
            height: 60,
          ),
          Container(
            height: 50,
            width: .5,
            color: colorMedium,
          ),
          Image.asset(
            'assets/images/face.png',
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Lexend-SB',
          color: colorMedium,
        ),
      ),
    );
  }
}
