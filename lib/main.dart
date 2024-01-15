import 'package:flutter/material.dart';
import 'package:suesite/strings.dart';
import 'package:suesite/styles.dart';
import 'package:suesite/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDPilates',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SDPilates'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            header(),
            verticalSeparator(),
            verticalSeparator(),
            titleAndBody(Strings.titlePrivate, Strings.bodyPrivate)
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/yoga.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: deviceHeight(context) * 0.6,
          ),
          const Text(Strings.headerTitle, style: Styles.headerTitle),
          const Text(Strings.headerSubtitle, style: Styles.headerSubtitle),
          verticalSeparator(),
          ElevatedButton(
            onPressed: () {},
            child: const Text(Strings.bookButton, style: Styles.buttonStyle),
          ),
          verticalSeparator(),
        ]));
  }

  Widget titleAndBody(String title, String body) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(children: [
        Text(title, style: Styles.title),
        Text(body, style: Styles.body),
      ]),
    );
  }
}
