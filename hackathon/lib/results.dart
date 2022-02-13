import 'package:flutter/material.dart';
import 'package:hackathon/category_list.dart';

class Result extends StatelessWidget {
  var categories;
  var ranks_list;

  Result({Key? key, required this.categories, required this.ranks_list})
      : super(key: key);

  List<dynamic> sort(data, ranks) {
    List scores = [];

    for (var i = 0; i < data.length; i++) {
      var score = 0.0;
      for (var j = 3; j < data[i].length; j++) {
        try {
          if (data[i][j].toString().contains(",")) {
            data[i][j] = data[i][j].toString();
            data[i][j] = data[i][j].replaceAll(",", "");
            data[i][j] = double.parse(data[i][j]);
          }
          if (j == 3) {
            if (data[i][j] is double || data[i][j] is int) {
              data[i][j] = data[i][j] / 10;
            } else {
              data[i][j] = double.parse(data[i][j]) / 10;
            }
          }
          if (data[i][j] is double || data[i][j] is int) {
            score += data[i][j] * ranks[j];
          } else {
            score += double.parse(data[i][j]) * ranks[j];
          }
        } on Exception catch (_) {
          continue;
        }
      }
      scores.add([data[i][0], score]);
    }
    scores.sort((a, b) => a[1].compareTo(b[1]));
    return scores.reversed.toList();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var list_items = [];
    for (var k in categories.keys) {
      list_items.add(k);
    }

    var num_ranks = ranks_list.length - 3;
    List scores = [];
    for (int x = num_ranks; x >= 0; x--) {
      scores.add(num_ranks - x);
    }

    List ranks = [];
    for (var x in ranks_list) {
      ranks.add(scores[x]);
    }

    var sorted_data = {};

    for (var cat in categories.keys) {
      sorted_data[cat] = sort(categories[cat], ranks).take(5);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = list_items[index];
            return Card(
              child: ExpansionTile(
                title: Text(item),
                children: [
                  ListView.separated(
                    itemCount: sorted_data[item].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext contextSub, int indexSub) {
                      final itemSub = (indexSub + 1).toString() +
                          ":  " +
                          sorted_data[item].toList()[indexSub][0].toString();
                      return Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: ListTile(
                          title: Text(itemSub),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 3,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
