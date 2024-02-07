import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sec_2/auth/presentation/pages/sign_in_page.dart';
import 'package:sec_2/auth/presentation/widgets/text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../repository/show_error.dart';
import '../../../repository/supabace.dart';

class Sign_up_Page extends StatefulWidget {
  const Sign_up_Page({super.key});

  @override
  State<Sign_up_Page> createState() => _Sign_up_PageState();
}


class _Sign_up_PageState extends State<Sign_up_Page> {

  TextEditingController name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  var enableButton = false;
  bool check = false;
  void isValid(){
    setState(() {
      enableButton = name_controller.text.isNotEmpty && phone_controller.text.isNotEmpty
          && email_controller.text.isNotEmpty && password_controller.text.isNotEmpty && confirm_password_controller.text.isNotEmpty
          && check && phone_controller.text.length == 16;
    });}


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
              SizedBox(height: 40,),
              Text('Create an account',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 58, 58, 58),
                  fontFamily: 'Roboto'
                ),),
              SizedBox(height: 8,),
              Text("Complete the sign up process to get started",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 167, 167, 167),
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal
                ),),
              SizedBox(height: 30,),
              CustomTextField(label: "Full name", hint: "Ivanov Ivan", controller: name_controller, onChange: (new_text){isValid();},),
              SizedBox(height: 24,),
              CustomTextField(label: "Phone number", hint: "+7(999)999-99-99", controller: phone_controller, formatter: MaskTextInputFormatter(mask: "+# (###) ###-##-##"), onChange: (new_text){isValid();}),
              SizedBox(height: 24,),
              CustomTextField(label: "Email Address", hint: "***********@mail.com", controller: email_controller, onChange: (new_text){isValid();}),
              SizedBox(height: 24,),
              CustomTextField(label: "Password", hint: "**********", controller: password_controller, onChange: (new_text){isValid();}),
              SizedBox(height: 24,),
              CustomTextField(label: "Confirm password", hint: "**********", controller: confirm_password_controller, onChange: (new_text){isValid();}),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: Checkbox(
                      value: check,
                      side: BorderSide(color: Color.fromARGB(255, 0, 108, 236)),
                      onChanged: (bool? val){
                        setState(() {
                          check = val!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 15,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'By ticking this box, you agree to our ',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 167, 167, 167)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms and \nconditions and private policy', style: TextStyle(color: Color.fromARGB(255, 235, 188, 46))),]
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
                        style: FilledButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 5, 96, 250),
                          disabledBackgroundColor: Color.fromARGB(255, 167, 167, 167),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          )
                        ),
                        onPressed: (enableButton) ? () async{
                          signUp(email: email_controller.text,
                              password: password_controller.text,
                              confirm_password: confirm_password_controller.text,
                              full_name: name_controller.text,
                              phone_number: phone_controller.text,
                              onResponse: (AuthResponse response){
                                if (check == true){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                                }},
                              onError: (String e) {showError(context, e);});}: null,
                        child: Text(
                            'Sign up',
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
                  Text('Already have an account?',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("or sign in using",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 167, 167, 167)
                        ),),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset("assets/google.png"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
