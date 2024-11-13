import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedGender = 0, _height = 170, _age = 23, _weight = 60;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Caculator'),
      ),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [],
    );
  }
}
