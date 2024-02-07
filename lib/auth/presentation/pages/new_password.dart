import 'package:flutter/material.dart';
import 'package:sec_2/auth/presentation/pages/forgot_password.dart';
import 'package:sec_2/home/presentation/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../repository/show_error.dart';
import '../../../repository/supabace.dart';
import '../widgets/text_field.dart';

class New_pass_Page extends StatefulWidget {
  const New_pass_Page({super.key});

  @override
  State<New_pass_Page> createState() => _New_pass_PageState();
}

class _New_pass_PageState extends State<New_pass_Page> {
  TextEditingController confirm_password_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool? check = false;
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
              Text('Welcome Back',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 58, 58, 58),
                    fontFamily: 'Roboto'
                ),),
              SizedBox(height: 8,),
              Text("Fill in your email and password to continue",
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 167, 167, 167),
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal
                ),),
              SizedBox(height: 30,),
              CustomTextField(label: "Password", hint: "**********", controller: confirm_password_controller),
              SizedBox(height: 24,),
              CustomTextField(label: "Confirm password", hint: "**********", controller: password_controller),
              SizedBox(height: 35,),
              Row(
                children: [
                  Expanded(child:
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (bool? value){
                            setState(() {
                              check = value;
                            });
                          },
                          side: BorderSide(color: Color.fromARGB(255, 167, 167, 167)),
                        ),
                        Text('Remember password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              color: Color.fromARGB(255, 167, 167, 167)
                          ),),
                      ],
                    ),
                  )),
                  SizedBox(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_Page()));
                      },
                      child: Text('Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 5, 96, 250)
                        ),),
                    ),

                  ),
                ],
              ),
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
                      onPressed: () async{
                          if (confirm_password_controller.text == password_controller.text){
                            final UserResponse res = await Supabase.instance.client.auth.updateUser(
                              UserAttributes(
                                password: password_controller.text,
                              ),
                            );
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));

                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}