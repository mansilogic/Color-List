import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color List Generator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ColorListPage(),
    );
  }
}

class ColorListPage extends StatefulWidget {
  const ColorListPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ColorListPageState createState() => _ColorListPageState();
}

class _ColorListPageState extends State<ColorListPage> {
  final TextEditingController _textController = TextEditingController();
  List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
  List<Color> selectedColors = [];
  int number = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors List Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _textController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid positive number';
                  }
                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed <= 0) {
                    return 'Please enter a valid positive number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "How many colors do you want",
                  labelText: "Insert a number",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  number = int.tryParse(_textController.text) ?? 0;
                  setState(() {});
                  FocusScope.of(context).unfocus();
                }
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: number,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: colors[index % colors.length],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
