import 'package:assignment_five_flutter/utils/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/app_bar.dart';
import '../../../utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";

  String password = "";

  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarGuide(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Register",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                onChanged: (text) {
                  userName = text;
                },
                decoration: const InputDecoration(
                  label: Text("User name"),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                onChanged: (text) {
                  email = text;
                },
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (text) {
                  password = text;
                },
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          "Create account",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    try {
      showLoading(context);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      hideLoading(context);
    } on FirebaseAuthException catch (error) {
      hideLoading(context);
      showErrorDialog(context,
          error.message ?? "Something went wrong. please try again later!");
    }
  }
}
