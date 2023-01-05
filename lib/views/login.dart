import 'package:flutter/material.dart';
import 'package:flutterapi/views/home_new.dart';
import 'package:flutterapi/views/scratch_card.dart';
import 'package:form_field_validator/form_field_validator.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState!.validate()){
     print("Validated");
    }else{
      print("Not Validated");
    }
  }

  String? validatepass(value){

    if (value.isEmpty){
      return("Required");
    }
    else if(value.length<6){
      return "Should Be at least 6 Charaters";
    }
    else if(value.length>15){
      return "Should Not Be More Than  15 Charaters";
    }
    else{
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(

            key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
           //       validator: EmailValidator(errorText: "Not A Valid Email"),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText:"Required *" ),
                      EmailValidator(errorText: "Not A Valid Email"),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                    validator:validatepass ,
                   //validator: MinLengthValidator(6,errorText:"Should Be at least 6 Characters"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomeNew(),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/* image: const DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),*/