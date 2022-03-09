import 'package:flutter/material.dart';
import 'package:sweet_shop/screens/profile/mycart/mycart.dart';
import 'package:sweet_shop/screens/profile/profile.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';

import '../../components/ItemList.dart';
import '../../utilities/parseToken.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          ItemList(),
          MyCart(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          labelColor: Color.fromARGB(255, 255, 59, 239),
          indicatorColor: Color.fromARGB(255, 255, 59, 239),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 5,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.food_bank_outlined, color: Colors.grey)),
            // Tab(icon: Icon(Icons.timer, color: Colors.grey)),
            Tab(icon: Icon(Icons.delivery_dining, color: Colors.grey)),
            // Tab(icon: Icon(Icons.person, color: Colors.grey))
          ],
        ),
      ),
    );
  }
}
