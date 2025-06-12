import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color oceanGreen = Color.fromARGB(255, 0, 108, 108);
const Color cream = Color.fromARGB(255, 255, 255, 201);

class FESTAprojectPage extends StatelessWidget{

  const FESTAprojectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.all(20),
        color: cream,
        child: Center(
          child: Column(
            children: [
              Text('FESTA Project Exhibition Page is in construction, Sorry for Inconvinience.',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: oceanGreen),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(onPressed: (){ context.go('/'); }, child: Text('Go back to main page'))
            ],
          ),
        ),
      ),
    );
  }
}