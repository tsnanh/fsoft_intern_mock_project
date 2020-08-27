import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsoft_intern_mock_project/blocs/login_bloc/login_bloc.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';
import 'package:fsoft_intern_mock_project/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Garden App",
              style: Styles.headline2.copyWith(color: Styles.primaryColor),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Your Username',
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              child: Container(),
              listener: (context, state) {
                if (state is LoginStateUserCreated) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Login Complete")));
                  SharedPreferences.getInstance().then((instance) {
                    instance.setString("username", state.name);
                  }).then((_) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(state.name),
                        ),
                        (route) => false);
                  });
                }
              },
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) => RaisedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(AddNewUserEvent(_controller.text));
                },
                textColor: Colors.white,
                color: Styles.primaryColor,
                child: Text("CONTINUE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
