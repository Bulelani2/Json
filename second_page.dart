import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_app/models/units.dart';
import 'package:units_app/routes/route.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController unitnumController = TextEditingController();

  @override
  void dispose() {
    unitnumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Unit No"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: const TextStyle(color: Colors.blueGrey),
                controller: unitnumController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter a unit number for your notes",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text("Go to the selected unit"),
                onPressed: () {
                  context.read<UnitData>().unitnum =
                      int.parse(unitnumController.text);
                  Navigator.of(context).pushNamed(RouteManager.homepage);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
