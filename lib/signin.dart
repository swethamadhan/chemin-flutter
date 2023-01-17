import 'package:bems/Forgot.dart';
import 'package:bems/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/colors.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool isRememberMe = false;
  Widget buildEmail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Email',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 14),
      Container(
        alignment: Alignment.centerLeft,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
          (10),
        )),
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xff12734C), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xff12734C), width: 1)),
            hintText: 'Enter your Email',
            fillColor: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    ]);
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
              color: Color.fromARGB(255, 3, 3, 3),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 14),
        Container(
          alignment: Alignment.centerLeft,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(
                (10),
              )),
          height: 40,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xff12734C), width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xff12734C), width: 1)),
              hintText: 'Enter your Password',
              fillColor: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildForgetpass() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const forgot()),
            );
          },
          child: Text(
            'Forget Password?',
            style: TextStyle(
                fontSize: 14,
                color: Color(
                  0xfff12734C,
                )),
          )),
    );
  }

  Widget buildRememberme() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 20,
      child: Row(children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: Color(0xfff12734C)),
          child: Checkbox(
              value: isRememberMe,
              checkColor: Color.fromARGB(255, 255, 255, 255),
              activeColor: Color(0xfff12734C),
              onChanged: ((value) {
                setState(() {
                  isRememberMe = value!;
                });
              })),
        ),
        Text('Remember me',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))
      ]),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      width: 130, //width of button
      height: 95, //height of button
      padding: EdgeInsets.symmetric(vertical: 25),

      child: ElevatedButton(
        onPressed: () => print(''),
        style: ElevatedButton.styleFrom(
          primary: Color(0xfff12734C),
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          'SIGN IN',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildSignupBtn() {
    var textSpan = TextSpan(children: [
      TextSpan(
          text: 'Not a member?',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 15,
          )),
      TextSpan(
        text: 'Sign Up',
        style: TextStyle(
          fontSize: 15,
          color: Color(0xfff12734C),
        ),
      ),
    ]);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUp()),
        );
      },
      child: RichText(
        text: textSpan,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
          child: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/signin.png'),
                    buildEmail(),
                    SizedBox(height: 25),
                    buildPassword(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildRememberme(),
                        buildForgetpass(),
                      ],
                    ),
                    buildLoginBtn(),
                    SizedBox(height: 19),
                    buildSignupBtn(),
                  ],
                ),
              ))
        ],
      )),
    ));
  }
}
