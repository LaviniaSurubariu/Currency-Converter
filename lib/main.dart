import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? error;
  String text = "";
  String convert = "";
  bool isConverted = false;
  String currency = " RON";

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Currency converter"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA3dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMjAl/MkYxMiUyRjMxJTJGMTI3MDEwMl8xMjcw/MTAyX2JhbmktbGVpLWV1cm8uanBnJnc9/NzgwJmg9NDQwJmhhc2g9YjYwYjY0YzFlZjJhNjZiZGQ0MDA0MDdiYTFiYjc0Zjk=.thumb.jpg",
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 380,
            child: TextField(
              onChanged: (String value) {
                setState(
                  () {
                    text = value;
                  },
                );
              },
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "enter the amount in EUR",
                errorText: error,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                setState(
                  () {
                    text = text.replaceAll(",", ".");
                    final double? number = double.tryParse(text);

                    if (number == null) {
                      error = "Please enter a number";
                      isConverted = false;
                    } else {
                      error = null;
                      convert = ((number * 4.9)).toStringAsFixed(2) + currency;
                      // print(convert);
                      isConverted = true;
                    }
                  },
                );
              },
              child: const Text("Convert")),
          const SizedBox(height: 10),
          if (isConverted)
            Text(
              convert,
              style: TextStyle(fontSize: 30, color: Colors.grey[600]),
            )
          else
            const Text(''),
        ],
      ),
    );
  }
}
