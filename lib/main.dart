import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konverter Suhu'),
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
  final _controllerC = TextEditingController();
  double _inputCelcius = 0;
  double _kelvin = 0;
  double _reamur = 0;

  konvertersuhu() {
    setState(() {
      if (_controllerC.text.isNotEmpty) {
        _inputCelcius = double.parse(_controllerC.text);
        _kelvin = _inputCelcius + 273.0;
        _reamur = _inputCelcius * 4 / 5;
      } else {
        _kelvin = 0;
        _reamur = 0;
      }
    });
  }

  @override
  void dispose() {
    _controllerC.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            inputWidget(controllerC: _controllerC),
            resultWidget(kelvin: _kelvin, reamur: _reamur),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      konvertersuhu();
                    },
                    child: Text("Konversi Suhu"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class resultWidget extends StatelessWidget {
  const resultWidget({
    Key? key,
    required double kelvin,
    required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "Suhu Dalam Kelvin",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              "$_kelvin",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Suhu Dalam Reamur",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              "$_reamur",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class inputWidget extends StatelessWidget {
  const inputWidget({
    Key? key,
    required TextEditingController controllerC,
  })  : _controllerC = controllerC,
        super(key: key);

  final TextEditingController _controllerC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerC,
      keyboardType: TextInputType.number,
    );
  }
}
