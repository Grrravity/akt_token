import 'package:akt_token/feature/akt_token/views/bloc/akt_token_bloc/akt_token_export_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesContent extends StatefulWidget {
  const SalesContent({Key? key}) : super(key: key);

  @override
  _SalesContentState createState() => _SalesContentState();
}

class _SalesContentState extends State<SalesContent> {
  bool _isToastShown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("AKT Token", style: TextStyle(fontFamily: "SSN-Bold")),
        Opacity(
          opacity: 0.75,
          child: Center(
            child: Text(
              "Purchase our exclusive token with 25% bonus\r\n& get your lifetime Elite membership now",
              style: TextStyle(
                fontSize: 9,
                fontFamily: "SSN-Medium",
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 110,
          height: 25,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: _isToastShown ? Colors.grey[350] : Colors.lightBlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Learn more",
                  style: TextStyle(fontSize: 9, fontFamily: "SSN-Medium"),
                ),
                Icon(Icons.arrow_right_alt_rounded),
              ],
            ),
            onPressed: () => _onMenuPressed(),
          ),
        ),
      ],
    );
  }

  _onMenuPressed() async {
    if (_isToastShown) {
      return;
    }
    setState(() {
      _isToastShown = true;
    });
    BlocProvider.of<AktTokenBloc>(context).add(SalesPressed());
    _showSnackBar(context, "Sales are not yet available");
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
