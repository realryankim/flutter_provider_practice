import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/src/provider/count_provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Center(
      // Consumer는 Getx의 Obx와 비슷
      child: Consumer<CountProvider>(builder: (context, provider, child) {
        return Text(
          provider.count.toString(),
          style: TextStyle(fontSize: 80),
        );
      }),
    );
  }
}
