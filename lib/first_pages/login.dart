import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gummud/model/profile.dart';
import 'package:gummud/pages/welcome_pages.dart';
class LoginPage extends StatefulWidget {
  static const routeName = '/Login';
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(phone: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Text("Phone number",style: TextStyle(fontSize:20.0,color: Colors.black,fontWeight:FontWeight.bold),),
                TextFormField(
                  validator: RequiredValidator(errorText: "Please enter your number!"),
                  onSaved: (String? phone){
                    profile.phone = phone!;
                  },
                ),
                SizedBox(height: 15,),
                Text("Password",style: TextStyle(fontSize:20.0,color: Colors.black,fontWeight:FontWeight.bold),),
                TextFormField(
                  validator: RequiredValidator(errorText: "Please enter your password!"),
                  obscureText: true,
                  onSaved: (String? password) {
                    profile.password = password!;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Submit",style: TextStyle(fontSize:15.0,color: Colors.white,fontWeight:FontWeight.bold),),
                    onPressed: (){
                      if(formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        Navigator.pushNamed(context,
                          WelcomeGummud.routeName,);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}