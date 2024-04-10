import 'package:flutter/material.dart';
import 'package:catbreeds/config.dart' as cg;

class ErrorCustomWidget extends StatelessWidget {
  final String msg;
  const ErrorCustomWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
              decoration: const BoxDecoration(
                  color: cg.cError,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.crisis_alert, color: Colors.white, size: 15,),
                    const SizedBox(width: 5,),
                    Text(msg, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12,), maxLines: 5, textAlign: TextAlign.center,),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
