import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/models/user_model.dart';
import 'package:sample_provider/reg_screen5.dart';

class RegScreen4 extends StatefulWidget {
  @override
  _RegScreen4State createState() => _RegScreen4State();
}

class _RegScreen4State extends State<RegScreen4> {
  TextEditingController _phoneCtrl;

  @override
  void initState() {
    _phoneCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: goToScreen5,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: _phoneCtrl,
          decoration: InputDecoration(
            labelText: "Phone",
          ),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
        ),
      ),
    );
  }

  /// go to screen5
  void goToScreen5() {
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.phone = _phoneCtrl.text;

    if (userModel.separateNavigator) {
      // nested navigator will open this screen
      // as we have setup the onGenerateRoute
      Navigator.of(context).pushNamed("/screen5");
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ChangeNotifierProvider.value(
              value: userModel,
              child: RegScreen5(),
            );
          },
        ),
      );
    }
  }
}
