import 'package:flutter/material.dart';
import 'package:flutter_provider/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("build called");
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(
            Provider.of<CountProvider>(context).count.toString(),
            style: const TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}
