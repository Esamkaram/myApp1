import 'package:flutter/material.dart';
import 'package:myapp2/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailController = TextEditingController();

var passwordController = TextEditingController();

var formKey = GlobalKey<FormState>();

bool isPassShow = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Login ',
                 style: TextStyle(
                 fontSize: 40.0,
                   fontWeight: FontWeight.bold,

                 ),
                 ),
                 SizedBox(
                   height: 40.0,
                 ),
                 defaultTextFilad(
                   controller: emailController,
                   label: 'Email Address',
                   validate: (value){
                     if (value.isEmpty){
                       return 'email address is empty !';
                     }return null ;
                   },
                   preFix: Icons.email,
                   type: TextInputType.emailAddress,
                 ),
                 SizedBox(
                   height: 10.0,
                 ),
                 defaultTextFilad(
                   controller: passwordController,
                   label: 'password',
                   type: TextInputType.visiblePassword,
                   isPassword: isPassShow,
                   preFix: Icons.lock,
                   iconSuffixPressed: (){
                     setState(() {
                       isPassShow = !isPassShow ;
                     });

                   },
                   suffix: isPassShow ? Icons.visibility : Icons.visibility_off ,
                   validate: (value){
                     if (value.isEmpty){
                       return 'password Is empty !!';
                     }return null;
                   },
                 ),
                 SizedBox(
                   height: 15.0,
                 ),
                 defaultButton(
                   text: 'login',
                   background: Colors.blue,
                   function: ()
                   {
                     if (formKey.currentState!.validate())
                       {
                         print(emailController);
                         print(passwordController);
                       }

                   },
                   isUpper: true ,

                 ),
                 SizedBox(
                   height: 10.0,
                 ),
                 Row(
                   children: [
                     Text('Don\'t have an account?',),
                     TextButton(onPressed: (){ },
                         child: Text(
                           'Register Now',
                         ),),
                   ],
                 )
               ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
