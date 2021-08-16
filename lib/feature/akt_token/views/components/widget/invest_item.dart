import 'package:akt_token/feature/akt_token/data/model/data_model.dart';
import 'package:akt_token/feature/akt_token/views/bloc/akt_token_bloc/akt_token_export_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InvestItem extends StatefulWidget {
  final Data data;
  const InvestItem({Key? key, required this.data}) : super(key: key);

  @override
  _InvestItemState createState() => _InvestItemState();
}

class _InvestItemState extends State<InvestItem> {
  bool _isToastShown = false;
  @override
  Widget build(BuildContext context) {
    String amount =
        NumberFormat.simpleCurrency(locale: "eu").format(widget.data.amount);
    int _backgroundColor = int.parse("ff${widget.data.background}", radix: 16);

    return GestureDetector(
      onTap: () => _onItemPressed(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: Color(_backgroundColor)
                  .withOpacity(1 - widget.data.transparency),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Container(
            height: 75,
            width: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.data.name.toUpperCase()}",
                  style: TextStyle(fontFamily: "SSN-Bold", color: Colors.white),
                ),
                Text(
                  amount,
                  style:
                      TextStyle(fontFamily: "SSN-Medium", color: Colors.white),
                ),
                Text(
                  "${widget.data.percentage > 0 ? "+" : "-"} ${widget.data.percentage}%",
                  style: TextStyle(
                      fontFamily: "SSN-Medium",
                      color: widget.data.percentage > 0
                          ? Colors.green
                          : Colors.red),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _onItemPressed() async {
    if (_isToastShown) {
      return;
    }
    setState(() {
      _isToastShown = true;
    });
    BlocProvider.of<AktTokenBloc>(context).add(ItemPressed());
    _showSnackBar(context,
        "Information for ${widget.data.name.toUpperCase()} are not available at the moment");
    await Future.delayed(Duration(milliseconds: 2500));

    setState(() {
      _isToastShown = false;
    });
  }

  _showSnackBar(BuildContext context, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.orange[800],
      action: SnackBarAction(
        textColor: const Color(0xffF0F0F0),
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          setState(() {
            _isToastShown = false;
          });
        },
      ),
    ));
  }
}
