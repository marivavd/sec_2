import 'package:flutter/material.dart';
import 'package:sec_2/auth/presentation/pages/sign_in_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../repository/show_error.dart';
import '../../../repository/supabace.dart';
import '../widgets/text_field.dart';

class Forgot_Page extends StatefulWidget {
  const Forgot_Page({super.key});

  @override
  State<Forgot_Page> createState() => _Forgot_PageState();
}

class _Forgot_PageState extends State<Forgot_Page> {
  TextEditingController email_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 130,),
              Text('Forgot Password',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 58, 58, 58),
                    fontFamily: 'Roboto'
                ),),
              SizedBox(height: 8,),
              Text("Enter your email address",
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 167, 167, 167),
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal
                ),),
              SizedBox(height: 30,),
              CustomTextField(label: "Email Address", hint: "***********@mail.com", controller: email_controller),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 342,
                  height: 46,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 5, 96, 250),),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              )
                          )
                      ),
                      onPressed: () {},
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Remember password? Back to',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Color.fromARGB(255, 167, 167, 167)
                    ),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                    },
                    child: Text('Sign in',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Color.fromARGB(255, 5, 96, 250)
                      ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
