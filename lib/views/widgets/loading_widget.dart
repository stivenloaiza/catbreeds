import 'package:flutter/material.dart';
import 'package:catbreeds/config.dart' as cg;

class LoadingCatWidget extends StatelessWidget {
  const LoadingCatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Loading...', textAlign: TextAlign.center,),
            Image.asset(cg.pathCatLoad)
          ],
        ),
      ),
    );
  }
}
