import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuel/src/models/gas_stations.dart';
import 'package:flutter/services.dart' as rootBundle;

class GasStations extends StatelessWidget {
  const GasStations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text('${data.error}'),
            );
          } else if (data.hasData) {
            var items = data.data as List<GasStationsModel>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    items[index].name.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(items[index].address.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(items[index].phone.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Chip(
                                    backgroundColor:
                                        items[index].status.toString() == "open"
                                            ? Colors.green[100]
                                            : Colors.red[100],
                                    label: Text(
                                      items[index].status.toString(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<GasStationsModel>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('jsonfile/gas_stations.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => GasStationsModel.fromJson(e)).toList();
  }
}
