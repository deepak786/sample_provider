import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/models/user_model.dart';
import 'package:sample_provider/reg_screen4.dart';

class RegScreen3 extends StatefulWidget {
  @override
  _RegScreen3State createState() => _RegScreen3State();
}

class _RegScreen3State extends State<RegScreen3> {
  String _gender;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gender"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: goToScreen4,
      ),
      body: Container(
        child: ListView(
          children: [
            RadioListTile(
              value: "m",
              title: Text("Male"),
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            RadioListTile(
              value: "f",
              title: Text("Female"),
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            RadioListTile(
              value: "o",
              title: Text("Other"),
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// go to screen4
  void goToScreen4() {
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.gender = _gender;

    if (userModel.separateNavigator) {
      // nested navigator will open this screen
      // as we have setup the onGenerateRoute
      Navigator.of(context).pushNamed("/screen4");
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ChangeNotifierProvider.value(
              value: userModel,
              child: RegScreen4(),
            );
          },
        ),
      );
    }
  }
}
