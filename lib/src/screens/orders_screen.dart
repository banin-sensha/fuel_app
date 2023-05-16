import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuel/src/models/gas_stations.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:fuel/src/models/orders.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

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
            var items = data.data as List<OrdersModel>;
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
                                  child: Text(
                                      'Address: ${items[index].address.toString()}'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                      'Phone: ${items[index].phone.toString()}'),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Text(
                                              'Gas type: ${items[index].type.toString()}'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Text(
                                              'Gas quantity: ${items[index].quantity.toString()} L'),
                                        )
                                      ],
                                    ))
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

  Future<List<OrdersModel>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('jsonfile/orders.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => OrdersModel.fromJson(e)).toList();
  }
}
