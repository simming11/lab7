import 'package:flutter/material.dart';

class Onepages extends StatefulWidget {
  const Onepages({super.key});

  @override
  State<Onepages> createState() => _OnepagesState();
}

class _OnepagesState extends State<Onepages> {
  List<String> gender = ["male", "female", "lGBT+"];
  String _selecteditem = "male";

  List<lisitem> prefix = [
    lisitem("boy", "เด็กชาย"),
    lisitem("girl", "เด็กหญิง"),
    lisitem("mr", "นาย"),
  ];
  List<DropdownMenuItem<lisitem>> _dropdownmenuItems = [];
  lisitem? _selectedPrefix;

  List<DropdownMenuItem<lisitem>> buildDropmenuItem(List<lisitem> prefix) {
    List<DropdownMenuItem<lisitem>> items = [];
    for (lisitem pf in prefix) {
      items.add(DropdownMenuItem(
        child: Text(pf.name),
        value: pf,
      ));
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownmenuItems = buildDropmenuItem(prefix);
    _selectedPrefix = _dropdownmenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lab7 dropdown"),
      ),
      body: Column(
        children: [
          Text("เลือกเพศ"),
          DropdownButton(
            value: _selecteditem,
            items: gender.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selecteditem = value!;
              });
            },
          ),
          Divider(),
          Text("คำนำหน้า"),
          DropdownButton(
            value: _selectedPrefix,
            items: _dropdownmenuItems,
            onChanged: (value) {
              setState(() {
                _selectedPrefix = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class lisitem {
  String value;
  String name;
  lisitem(this.name, this.value);
}
