import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/src/components/view_count_widget.dart';
import 'package:sample_provider/src/provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);

  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Count Provider'),
      ),
      body: ViewCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              _countProvider.add();
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _countProvider.remove();
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
