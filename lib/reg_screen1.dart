import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/models/user_model.dart';
import 'package:sample_provider/reg_screen2.dart';

class RegScreen1 extends StatefulWidget {
  @override
  _RegScreen1State createState() => _RegScreen1State();
}

class _RegScreen1State extends State<RegScreen1> {
  TextEditingController _nameCtrl;

  @override
  void initState() {
    _nameCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: goToScreen2,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: _nameCtrl,
          decoration: InputDecoration(
            labelText: "Name",
          ),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
        ),
      ),
    );
  }

  /// go to screen2
  void goToScreen2() {
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.name = _nameCtrl.text;

    if (userModel.separateNavigator) {
      // nested navigator will open this screen
      // as we have setup the onGenerateRoute
      Navigator.of(context).pushNamed("/screen2");
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ChangeNotifierProvider.value(
              value: userModel,
              child: RegScreen2(),
            );
          },
        ),
      );
    }
  }
}
