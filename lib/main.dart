import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdpilates/list_type.dart';
import 'package:sdpilates/strings.dart';
import 'package:sdpilates/styles.dart';
import 'package:sdpilates/ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            header(),
            verticalSeparator(),
            titleAndBody(Strings.titlePrivate, Strings.bodyPrivate),
            image("gym_1.jpg"),
            titleAndBody(Strings.titleWhyPrivate, Strings.bodyWhyPrivate),
            image("gym_2.jpg"),
            titleAndBody(Strings.titleAttention, Strings.bodyAttention),
            customList(Strings.titleSixPrinciples, Strings.bodySixPrinciples,
                ListType.numbered),
            customList(Strings.titleCost, Strings.bodyCost, ListType.bulleted),
            customList(
                Strings.titlePackages, Strings.bodyPackages, ListType.bulleted),
            aboutSection(),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget image(String name) {
    double screenWidth = MediaQuery.of(context).size.width;

    double aspectRatio = 4 / 3;

    double imageWidth = screenWidth;
    double imageHeight = screenWidth / aspectRatio;
    return Image.asset("assets/images/$name",
        width: imageWidth, height: imageHeight, fit: BoxFit.cover);
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
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            SizedBox(
              height: deviceHeight(context) * 0.6,
            ),
            const SelectableText(Strings.headerTitle, style: Styles.headerTitle),
            const SelectableText(Strings.headerSubtitle, style: Styles.headerSubtitle),
            verticalSeparator(),
            ElevatedButton(
              onPressed: () {
                _launchMailClient();
              },
              child: const SelectableText(Strings.bookButton, style: Styles.buttonStyle),
            ),
            verticalSeparator(),
          ]),
        ));
  }

  Widget aboutSection() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SelectableText(Strings.titleAbout, style: Styles.titleAbout),
        const SelectableText(Strings.bodyAboutAccolades, style: Styles.bodyBulleted),
        verticalSeparator(),
        const SelectableText(Strings.bodyAbout, style: Styles.body),
      ]),
    );
  }

  Widget titleAndBody(String title, String body) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SelectableText(title, style: Styles.title),
        SelectableText(body, style: Styles.body),
      ]),
    );
  }

  Widget customList(String title, List<String> list, ListType type) {
    List<Widget> generatedList = List.generate(
      list.length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: type == ListType.numbered
            ? SelectableText(
                '${index + 1}. ${list[index]}',
                style: Styles.body,
              )
            : SelectableText(
                '• ${list[index]}',
                style: Styles.body,
              ),
      ),
    );
    List<Widget> preList = [
      SelectableText(title, style: Styles.title),
      const SizedBox(height: 10),
    ];
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: preList + generatedList,
      ),
    );
  }

  Widget footer() {
    DateTime now = DateTime.now();
    return Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Copyright © Sue Dado ${now.year} - All Rights Reserved.',
              style: Styles.bodyFooter,
            ),
            horizontalSeparator(),
          ],
        ));
  }

  void _launchMailClient() async {
    const mailUrl = 'mailto:${Strings.email}';
    try {
      await Clipboard.setData(const ClipboardData(text: Strings.email));
      showSnackbar(context, "Email address copied to clipboard");
      await launchUrl(Uri.parse(mailUrl));
    } catch (e) {
      print(e);
    }
  }

  void showSnackbar(BuildContext context, String content,
      {SnackBarAction? action}) {
    final snackBar = SnackBar(content: Text(content), action: action);

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
