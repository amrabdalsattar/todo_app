import 'package:assignment_five_flutter/screens/auth/register/register.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../components/app_bar.dart';

class LoginScreen extends StatelessWidget {
  String email = "";
  String password = "";
  static const routeName = "login";

  LoginScreen({super.key});

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
                  "Welcome Back !",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
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
              const SizedBox(
                height: 26,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  )),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: const Text(
                  "Create account",
                  style: TextStyle(fontSize: 18, color: AppColor.liteBlack),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
