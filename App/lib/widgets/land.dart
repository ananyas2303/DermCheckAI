import 'package:flutter/material.dart';
import 'package:melanoma/widgets/info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "DermCheck Ai",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
              fontFamily: "Lobster",
              letterSpacing: 3,
            ),
          ),
          Text("SPOT.DETCECT.DEFEAT"
            ,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
              fontFamily: "Roboto",
              letterSpacing: 3,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Melanoma()),
                  );
                },
                child:const Text("Proceed",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
