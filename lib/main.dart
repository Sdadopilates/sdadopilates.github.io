import 'package:flutter/material.dart';
import 'package:sdpilates/strings.dart';
import 'package:sdpilates/styles.dart';
import 'package:sdpilates/ui.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            header(),
            verticalSeparator(),
            titleAndBody(Strings.titlePrivate, Strings.bodyPrivate),
            titleAndBody(Strings.titleWhyPrivate, Strings.bodyWhyPrivate),
            titleAndBody(Strings.titleAttention, Strings.bodyAttention),
            numberedList(Strings.titleSixPrinciples, Strings.bodySixPrinciples),
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

  Widget numberedList(String title, List<String> list) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(children: [
        Text(title, style: Styles.title),
        ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${index + 1}. ${list[index]}',
                style: Styles.body,
              ),
            );
          },
        )
      ]),
    );
  }
}
