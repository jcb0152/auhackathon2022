import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/results.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key})
      : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() {
    return _CategoryList();
  }
}

class _CategoryList extends State<CategoryList> {
  var _foods;
  final List _categories = [
    "Calories",
    "Protein",
    "Carb.",
    "Fiber",
    "Fat",
    "Sat. fat"
  ];

  final Map<String, int> original = {
    "Calories": 0,
    "Protein": 1,
    "Carb.": 2,
    "Fiber": 3,
    "Fat": 4,
    "Sat. fat": 5,
  };

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/final_data.json');
    var data = await json.decode(response);
    setState(() {
      _foods = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nutrient Types"),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Column(children: [
          const Padding(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "High",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            padding: EdgeInsets.all(16.0),
          ),
          Expanded(
            child: ReorderableListView(
              children: _categories
                  .map(
                    (item) => Card(
                        key: Key("${item}"),
                        child: ListTile(
                          title: Text("${item}"),
                          trailing: Icon(Icons.menu),
                        )),
                  )
                  .toList(),
              onReorder: (int start, int current) {
                // dragging from top to bottom
                if (start < current) {
                  int end = current - 1;
                  String startItem = _categories[start];
                  int i = 0;
                  int local = start;
                  do {
                    _categories[local] = _categories[++local];
                    i++;
                  } while (i < end - start);
                  _categories[end] = startItem;
                }
                // dragging from bottom to top
                else if (start > current) {
                  String startItem = _categories[start];
                  for (int i = start; i > current; i--) {
                    _categories[i] = _categories[i - 1];
                  }
                  _categories[current] = startItem;
                }
                setState(() {});
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                readJson();

                var ranks = List.filled(_categories.length + 3, 0);

                for (var i = 0; i < _categories.length; i++) {
                  int index = original[_categories[i]]!;
                  ranks[index + 3] = _categories.length - i;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Result(categories: _foods, ranks_list: ranks),
                  ),
                );
              },
              child: const Text("Confirm")),
        ]));
  }
}
