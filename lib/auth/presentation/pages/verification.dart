import 'package:flutter/material.dart';
import 'package:sec_2/auth/presentation/pages/new_password.dart';

class VerPage extends StatefulWidget {
  const VerPage({super.key});

  @override
  State<VerPage> createState() => _VerPageState();
}

class _VerPageState extends State<VerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Align(
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => New_pass_Page()));
                },
                child: Text(
                  'Set New Password',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                )),
          ),
        ),
      ),
    );
  }
}