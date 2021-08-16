import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';
import 'package:flutter/material.dart';

class AktTokenList extends StatefulWidget {
  final CryptoEntity cryptoEntity;
  const AktTokenList({Key? key, required this.cryptoEntity}) : super(key: key);

  @override
  _AktTokenListState createState() => _AktTokenListState();
}

class _AktTokenListState extends State<AktTokenList> {
  late ScrollController _scrollController;
  double _promotionOpacity = 1;
  bool _promotionDisplayed = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _promotionOpacity = _flexibleSpaceBarRelativeSize;
          _promotionDisplayed = _isPromotionInvisible ? false : true;
        });
      });
  }

  bool get _isPromotionInvisible {
    return _scrollController.hasClients &&
        _scrollController.offset > (250 - kToolbarHeight);
  }

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
          snap: false,
          floating: false,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Visibility(
              visible: _promotionDisplayed,
              child: Opacity(
                opacity: _promotionOpacity,
                child: Column(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Learn more",
                              style: TextStyle(
                                  fontSize: 9, fontFamily: "SSN-Medium"),
                            ),
                            Icon(Icons.arrow_right_alt_rounded),
                          ],
                        ),
                        onPressed: () => print("ok"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            background: Image.asset(
              "assets/png/background.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
            stretchModes: [StretchMode.zoomBackground],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return ListTile(
                leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Placeholder()),
                title: Text(
                  'Place ${index + 1}',
                  textScaleFactor: 2,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

class PromotionalPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
