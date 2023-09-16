import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register/header.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {


  bool showPassword = false;
  bool confirmPassword = false;
  bool stayLoggedIn = false;
  void _toggle() {
    setState(() {
      showPassword = !showPassword;

    });
  }

  void _toggleConfirmPassword() {
    setState(() {
      confirmPassword = !confirmPassword;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9A826),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                toolbarHeight: 70,
                expandedHeight: 200.0,
                backgroundColor: Color(0xFFF9A826),
                floating: false,

                flexibleSpace: FlexibleSpaceBar(
                    background: Header(title: 'Register',)),
              ),
            ];
          },
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child:  Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Name', style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w700)),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12)
                    ),
                  ),
                  const SizedBox(height: 20),


                  const Text('Email', style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w700)),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12)
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text('Phone Number', style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w700)),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12)
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text('Password', style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w700)),
                  TextField(decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                    suffixIcon: InkWell(onTap: _toggle,
                        child: Icon(showPassword? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill, size: 20,)),


                  ),
                    obscureText: showPassword),
                  const SizedBox(height: 10),

                  const Text('Confirm Password', style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w700)),
                  TextField(decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                    suffixIcon: InkWell(onTap: _toggleConfirmPassword,
                        child: Icon(confirmPassword? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill, size: 20,)),


                  ),
                      obscureText: confirmPassword),
                  const SizedBox(height: 30),


                  Container(decoration: BoxDecoration(
                      color: const Color(0xFFF9A826),
                      borderRadius: BorderRadius.circular(50)
                  ),width: MediaQuery.of(context).size.width,height: 40,
                    child: const Center(child: Text('Register', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),)),),

                  const SizedBox(height: 15,),




                ],),
              ),
            ),),
        )

    );
  }
}