import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register/header.dart';
import 'package:login_register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  bool stayLoggedIn = false;
  void _toggle() {
    setState(() {
      showPassword = !showPassword;
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
                    background: Header(title: 'Login',)),
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
                  const Text('Email', style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w700)),
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
                    obscureText: showPassword,

                  ),
                  const SizedBox(height: 10),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SizedBox(width: 15,
                          child: Checkbox(value: stayLoggedIn,
                              activeColor: Colors.blueAccent,
                              checkColor: Colors.white,
                              onChanged: (val){
                                setState(() {
                                  stayLoggedIn = !stayLoggedIn;
                                });
                              }),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Stay logged in?', style: TextStyle(fontSize: 14, color: Colors.grey),),
                        )
                      ],),
                      const Text('Forgot Password?', style: TextStyle(color: Colors.grey))
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Container(decoration: BoxDecoration(
                      color: const Color(0xFFF9A826),
                      borderRadius: BorderRadius.circular(50)
                  ),width: MediaQuery.of(context).size.width,height: 40,
                    child: const Center(child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),)),),

                  const SizedBox(height: 15,),

                  InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegistrationPage())),
                    child: const Center(child: Text.rich(TextSpan(children: [
                      TextSpan(text: 'Don’t have an account yet? Register ', style: TextStyle(fontSize: 12)),
                      TextSpan(text: 'here ', style: TextStyle(fontSize: 12, color: Color(0xFFF9A826))),
                    ]))),
                  ),

                  Padding(padding: const EdgeInsets.symmetric(vertical:20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Container(color: Colors.grey,width: 75, height: 1,),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or login with', style: TextStyle(color: Colors.grey)),),
                      Container(color: Colors.grey,width: 75, height: 1,),
                    ],),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Container(padding: const EdgeInsets.all(10),decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.25), blurRadius: 1, spreadRadius: 1,offset: Offset(0,1))]
                    ),
                        width: 40,height: 40,
                        child: Image.asset('assets/image/google.png')),

                    const SizedBox(width: 20),


                    Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow:  [BoxShadow(color: Colors.grey.withOpacity(.25), blurRadius: 1, spreadRadius: 1,offset: Offset(0,1))]
                    ),
                        width: 40,height: 40,
                        child: Image.asset('assets/image/facebook.png')),
                  ],)

                ],),
              ),
            ),),
        )

    );
  }
}