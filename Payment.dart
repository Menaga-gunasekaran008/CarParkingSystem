flutter create search_bar
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Personal Journal'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Hi'),
          ),
        ],
      ),
    );
  }
}
appBar: AppBar(
title: const Text('My Personal Journal'),
automaticallyImplyLeading: false,
actions: [
IconButton(
onPressed: () {},
icon: const Icon(Icons.search),
)
],
centerTitle: true,
),
@override
_HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
        IconButton(
        onPressed: () {},
    icon: customIcon,
    )
    ],
    centerTitle: true,
    ),
    onPressed: () {
    setState(() {
    if (customIcon.icon == Icons.search) {
    // Perform set of instructions.
    } else {
    customIcon = const Icon(Icons.search);
    customSearchBar = const Text('My Personal Journal');
    }
    });
    },
        if (customIcon.icon == Icons.search) {
      customIcon = const Icon(Icons.cancel);
      customSearchBar = const ListTile(
        leading: Icon(
          Icons.search,
          color: Colors.white,
          size: 28,
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'type in journal name...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
