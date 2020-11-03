import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/models/counter_model.dart';

class Counter extends StatelessWidget {
  final bool listen;

  Counter({this.listen = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
              "Listen is $listen\nCounter Value: ${Provider.of<CounterModel>(context, listen: listen).counter}"),
          SizedBox(height: 5),
          Text(listen
              ? "If you increase or decrease the value of counter using the below buttons then you will see the updated value here because we are listening for the updates."
              : "If you increase or decrease the value of counter using the below buttons then you will not see the updated value here because we are not listening for the updates."),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.plus_one),
                onPressed: () {
                  Provider.of<CounterModel>(context, listen: false).counter++;
                },
              ),
              IconButton(
                icon: Icon(Icons.exposure_minus_1),
                onPressed: () {
                  Provider.of<CounterModel>(context, listen: false).counter--;
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
