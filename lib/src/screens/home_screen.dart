import 'package:flutter/material.dart';
import 'package:fuel/src/screens/gas_stations_screen.dart';
import 'package:fuel/src/screens/orders_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Demo'),
        ),
        body: const TabBarView(
          children: [
            GasStations(),
            Orders(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(
                text: 'Gas',
                icon: Icon(
                  Icons.local_gas_station,
                )),
            Tab(
                text: 'Orders',
                icon: Icon(
                  Icons.list_alt,
                )),
          ],
        ),
      ),
    );
  }
}
