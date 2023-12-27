import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String routeName = "/login-screen";

  final _form = GlobalKey<FormState>();

  final TextEditingController _enteredEmailController = TextEditingController();
  final TextEditingController _enteredPasswordController =
      TextEditingController();

  void _submit(BuildContext context) {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // makes the background not move
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/background.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: statusBarHeight),
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 40, left: 40),
                      child: Form(
                        key: _form,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(173, 125, 55, 0.3),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 173, 125, 55),
                                    width: 2),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  controller: _enteredEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email address",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 216, 223, 225),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains("a") ||
                                        value.trim().length < 6) {
                                      return "Invalid email address";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(173, 125, 55, 0.3),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 173, 125, 55),
                                    width: 2),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  controller: _enteredPasswordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 216, 223, 225),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        value.trim().length <= 5) {
                                      return "Invalid password, must be at least 5 characters long.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () => _submit(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 28, 32, 32),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 20,
                        ),
                      ),
                      child: const Text(
                        "L O G I N",
                        style: TextStyle(
                          color: Color.fromARGB(255, 216, 223, 225),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
