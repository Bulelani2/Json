import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_app/Widgets/unit_card.dart';
import 'package:units_app/models/units.dart';
import 'package:units_app/routes/route.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    context.read<UnitData>().fetchData;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 250, right: 250),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              RouteManager.secondpage,
            );
          },
          child: const Text("Select one Unit"),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<UnitData>().initialValue();
                context.read<UnitData>().fetchData;
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text("Unit Reflections"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<UnitData>().fetchData;
        },
        child: Consumer<UnitData>(
          builder: (context, value, child) {
            return value.map.isEmpty && !value.error
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : value.error
                    ? Text(
                        "Oops Something went wrong !!. ${value.errormessage}",
                        textAlign: TextAlign.center,
                      )
                    : value.unitnum > 4
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Center(
                                child: Text(
                                  "MY TPG316C Units",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "The unit number enterd does not exist",
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                              SizedBox(
                                height: 400,
                              ),
                            ],
                          )
                        : value.unitnum == 1
                            ? Column(
                                children: [
                                  const Text(
                                    "MY TPG316C Units",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          return UnitsCard(
                                              map: value.map["Specs"][0]);
                                        }),
                                  ),
                                ],
                              )
                            : value.unitnum == 2
                                ? Column(
                                    children: [
                                      const Text(
                                        "MY TPG316C Units",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return UnitsCard(
                                                  map: value.map["Specs"][1]);
                                            }),
                                      ),
                                    ],
                                  )
                                : value.unitnum == 3
                                    ? Column(
                                        children: [
                                          const Text(
                                            "MY TPG316C Units",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                                itemCount: 1,
                                                itemBuilder: (context, index) {
                                                  return UnitsCard(
                                                      map: value.map["Specs"]
                                                          [2]);
                                                }),
                                          ),
                                        ],
                                      )
                                    : value.unitnum == 4
                                        ? Column(
                                            children: [
                                              const Text(
                                                "MY TPG316C Units",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return UnitsCard(
                                                          map: value
                                                              .map["Specs"][3]);
                                                    }),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              const Text(
                                                "MY TPG316C Units",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    itemCount: value
                                                        .map["Specs"].length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return UnitsCard(
                                                          map:
                                                              value.map["Specs"]
                                                                  [index]);
                                                    }),
                                              ),
                                            ],
                                          );
          },
        ),
      ),
    );
  }
}
