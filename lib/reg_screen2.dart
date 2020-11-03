import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/models/user_model.dart';
import 'package:sample_provider/reg_screen3.dart';

class RegScreen2 extends StatefulWidget {
  @override
  _RegScreen2State createState() => _RegScreen2State();
}

class _RegScreen2State extends State<RegScreen2> {
  TextEditingController _emailCtrl;

  @override
  void initState() {
    _emailCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: goToScreen3,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: _emailCtrl,
          decoration: InputDecoration(
            labelText: "Email",
          ),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }

  /// go to screen3
  void goToScreen3() {
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.email = _emailCtrl.text;

    if (userModel.separateNavigator) {
      // nested navigator will open this screen
      // as we have setup the onGenerateRoute
      Navigator.of(context).pushNamed("/screen3");
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ChangeNotifierProvider.value(
              value: userModel,
              child: RegScreen3(),
            );
          },
        ),
      );
    }
  }
}
