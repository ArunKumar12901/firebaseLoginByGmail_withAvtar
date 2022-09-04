import 'package:flutter/material.dart';
import 'package:logintry3/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: loginUI(),
    );
  }

  loginUI() {

    return Consumer<LoginController>(builder: (context, model, child){
      if(model.userDetails != null)
        {
          return Center(
            child: loggedInUI(model),
          );
        }
      else
        {
          return loginControllers(context);
        }
    });
  }
  loggedInUI(LoginController model)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        CircleAvatar(backgroundImage: Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),
        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false).logout();

          }
        )

      ],
    );
  }

  loginControllers(BuildContext context){

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('assets/google.png',width: 240,
            ),
            onTap: (){
              Provider.of<LoginController>(context, listen: false).googleLogin();
            },
          ),

          SizedBox(height: 10),

          Image.asset('assets/fb.png',width: 240),

        ],
      ),
    );

  }

}
