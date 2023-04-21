import 'package:flutter/material.dart';
import 'package:polaris/constants/common_constants.dart';
import 'package:polaris/pages/Guide_page.dart';
import 'package:polaris/pages/map_page.dart';
import 'package:polaris/pages/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polaris',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: CommonConstants.cWhite,
            child: const TabBar(
              labelColor: CommonConstants.cPrimary,
              unselectedLabelColor: CommonConstants.cGrey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: CommonConstants.cPrimary,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "Map",
                  icon: Icon(Icons.map_outlined),
                ),
                Tab(
                  text: "Guide",
                  icon: Icon(Icons.menu_book_outlined),
                ),
                Tab(
                  text: "Profile",
                  icon: Icon(Icons.person_outline),
                ),
              ],
            ),
          ),
          body: const TabBarView(
              children: [MapPage(), GuidePage(), ProfilePage()]),
        ),
      ),
    );
  }
}

Widget menu = Container(
  color: const Color(0xFF3F5AA6),
  child: const TabBar(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
    tabs: [
      Tab(
        text: "Transactions",
        icon: Icon(Icons.euro_symbol),
      ),
      Tab(
        text: "Bills",
        icon: Icon(Icons.assignment),
      ),
      Tab(
        text: "Balance",
        icon: Icon(Icons.account_balance_wallet),
      ),
      Tab(
        text: "Options",
        icon: Icon(Icons.settings),
      ),
    ],
  ),
);
