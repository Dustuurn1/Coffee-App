
import 'package:flutter/material.dart';
import '../views/main_menu_view.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _nameFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();
  Widget build(BuildContext context){
/*Logic*/


/*App*/
    return Scaffold(
        appBar: AppBar(
          title:Text("Coffee App",),),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(8),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Username',
                ),
                controller: _nameFieldController,
                validator: (val) { 
                  if (val == null || val.isEmpty) return 'Please enter your name';
                  return null;
                } ,

              ),
              
              
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordFieldController,
              ),
              Container(
                  padding: EdgeInsets.only(left: 40, top: 20, right: 40),
                  child: TextButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (correctUsername(_nameFieldController.text) && correctPassword(_passwordFieldController.text)){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MainMenuView(),
                        ));
                      }
                      else{
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          (SnackBar(content:
                            Text('Incorrect username or password')))
                    );
                      }
                    },
                    
                    ),
                  ),
            ]
          ),
          
        )
        
      );
  
  }
}

bool correctPassword(String password) => (password == "password");
bool correctUsername(String username) => (username == "admin");

