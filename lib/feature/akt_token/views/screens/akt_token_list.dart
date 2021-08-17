import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';
import 'package:akt_token/feature/akt_token/views/components/display/item_list_display.dart';
import 'package:flutter/material.dart';

import '../components/display/token_list_export.dart';

class AktTokenList extends StatefulWidget {
  final CryptoEntity cryptoEntity;
  const AktTokenList({Key? key, required this.cryptoEntity}) : super(key: key);

  @override
  _AktTokenListState createState() => _AktTokenListState();
}

class _AktTokenListState extends State<AktTokenList> {
  late ScrollController _scrollController;
  double _salesOpacity = 1;
  bool _salesDisplayed = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _salesOpacity = _flexibleSpaceBarRelativeSize;
          _salesDisplayed = _isSalesInvisible ? false : true;
        });
      });
  }

  bool get _isSalesInvisible {
    return _scrollController.hasClients &&
        _scrollController.offset > (250 - kToolbarHeight);
  }

  /// Returns the [_relativeSize] size of FlexibleSpaceBar
  ///
  /// returns [_relativeSize] == 1 if FlexibleSpaceBar is fully shown and 0 if fully hidden
  double get _flexibleSpaceBarRelativeSize {
    double _relativeSize = _scrollController.hasClients
        ? (350 - _scrollController.offset) / 350
        : 0;
    return _relativeSize < 0 ? 0 : _relativeSize;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          title: Center(
              child: Text(
            "Investments",
            style: TextStyle(fontSize: 14),
          )),
          expandedHeight: 350,
          pinned: true,
          stretch: true,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            //remove the widgets when not displayed to avoid overflow
            title: Visibility(
              visible: _salesDisplayed,
              //Custom fade-ou / fade-in transition according to flexibleSpaceBar height
              child: Opacity(
                opacity: _salesOpacity,
                child: SalesContent(),
              ),
            ),
            background: Image.asset(
              "assets/png/background.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return Column(
              children: [
                ItemListDisplay(
                  data: index == 0
                      ? widget.cryptoEntity.cryptosTop
                      : widget.cryptoEntity.cryptos,
                  title: "Cryptos",
                ),
                ItemListDisplay(
                    data: index == 0
                        ? widget.cryptoEntity.tokensTop
                        : widget.cryptoEntity.tokens,
                    title: "Tokens"),
              ],
            );
          },
          childCount: 2,
        )),
      ],
    );
  }
}
