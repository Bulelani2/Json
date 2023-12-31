import 'package:flutter/material.dart';
import 'package:units_app/routes/route.dart';

class UnitsCard extends StatelessWidget {
  const UnitsCard({super.key, required this.map});
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Image.network('${map["image"]}'),
                const SizedBox(
                  height: 10,
                ),
                Text('${map["unit"]}'),
                const SizedBox(
                  height: 10,
                ),
                Text('${map["concepts"]}'),
                const SizedBox(
                  height: 10,
                ),
                Text('${map["definition"]}'),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
