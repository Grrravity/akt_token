import 'package:akt_token/feature/akt_token/data/model/data_model.dart';
import 'package:akt_token/feature/akt_token/views/components/display/token_list_export.dart';
import 'package:flutter/material.dart';

class ItemListDisplay extends StatelessWidget {
  final List<Data> data;
  final String title;
  const ItemListDisplay({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(left: 20),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white)),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 220,
                child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: InvestItem(data: data[index]));
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
