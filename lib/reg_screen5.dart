import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/models/user_model.dart';

class RegScreen5 extends StatefulWidget {
  @override
  _RegScreen5State createState() => _RegScreen5State();
}

class _RegScreen5State extends State<RegScreen5> {
  TextEditingController _occupationCtrl;

  @override
  void initState() {
    _occupationCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Occupation"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: printData,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: _occupationCtrl,
          decoration: InputDecoration(
            labelText: "Occupation",
            alignLabelWithHint: true,
          ),
          minLines: 5,
          maxLines: 5,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.multiline,
        ),
      ),
    );
  }

  void printData() {
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.occupation = _occupationCtrl.text;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Data'),
          content: Text(userModel.getDisplayedData()),
          actions: <Widget>[
            TextButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
