import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

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
        onPressed: () {
          setState(() {
            _bmi = _weight / pow(_height / 100, 2);
          });
        },
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _genderSelector(),
        _heightInput(),
        _weighAndAgeInputRow(),
        _bmiResult(),
      ],
    );
  }

  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 0;
                  });
                },
                icon: Icon(
                  Icons.male,
                  color: _selectedGender == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 1;
                  });
                },
                icon: Icon(
                  Icons.female,
                  color: _selectedGender == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _heightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _height++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                "$_height cm",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _height--;
                  });
                },
                icon: Icon(
                  Icons.remove,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weighAndAgeInputRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _weightInput(),
        _ageInput(),
      ],
    );
  }

  Widget _weightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          const Text(
            "Weight",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ItemCount(
            buttonSizeHeight: 30,
            buttonSizeWidth: 53,
            initialValue: _weight,
            minValue: 1,
            maxValue: 100,
            onChanged: (value) {
              setState(() {
                _weight = value.toInt();
              });
            },
            decimalPlaces: 0,
          ),
        ],
      ),
    );
  }

  Widget _ageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          const Text(
            "Age",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ItemCount(
            buttonSizeHeight: 30,
            buttonSizeWidth: 53,
            initialValue: _age,
            minValue: 20,
            maxValue: 350,
            onChanged: (value) {
              setState(() {
                _age = value.toInt();
              });
            },
            decimalPlaces: 0,
          ),
        ],
      ),
    );
  }

  Widget _bmiResult() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Text(
        "BMI: ${_bmi.toStringAsFixed(1)}",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
