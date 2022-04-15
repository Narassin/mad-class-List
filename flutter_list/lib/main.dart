// Coded by Captain N (Ahmad Nuruddin)
// List app for MAD Class

import 'package:flutter/material.dart';
import './dragondb.dart';
import './descriptor.dart';

void main() {
  runApp(NApp());
}

class NApp extends StatefulWidget {
  @override
  _NState createState() => _NState();
}

// const NApp({Key? key}) : super(key: key);

class _NState extends State<NApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DragonDex',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NDragoDex'),
        ),
        body: ListView(children: [promptSection, DropDown(), NDesc()]),
      ),
    );
  }
}

//User Prompter
Widget promptSection = Container(
  padding: const EdgeInsets.all(16),
  child: Row(children: [
    Expanded(
        child: Column(
      children: [
        const Text(
          'Select an entry no:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'エントリー番号を選ぶ:',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        )
      ],
    ))
  ]),
);

//DropDown Button
class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  static int dropdownValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButton<int>(
          value: dropdownValue,
          hint: const Text('Drago Entry No', textAlign: TextAlign.end),
          isExpanded: true,
          elevation: 16,
          style: const TextStyle(
            color: Colors.blueAccent,
          ),
          underline: Container(height: 2, color: Colors.blueAccent),
          onChanged: (int? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8]
              .map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(
                "$value",
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
        ));
  }
}

//Content
class NDesc extends StatefulWidget {
  const NDesc({Key? key}) : super(key: key);

  @override
  State<NDesc> createState() => _NDesc();
}

class _NDesc extends State<NDesc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.amberAccent,
        child: Row(
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Descriptor(dragonData[_DropDown.dropdownValue]
                              ['entryName'] as String),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ]))
                  ]),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Descriptor(dragonData[_DropDown.dropdownValue]
                        ['descriptionD'] as String),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
