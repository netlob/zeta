import 'package:flutter/material.dart';

class FadingPage extends StatefulWidget {
  FadingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FadingPageState createState() => new _FadingPageState();
}

const kExpandedHeight = 300.0;

class _FadingPageState extends State<FadingPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  bool get _showTitle {
    print(kToolbarHeight * 2);

    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - (kToolbarHeight * 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            expandedHeight: kExpandedHeight,
            title: Text("Fading out top"),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: AnimatedOpacity(
                opacity: _showTitle ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 36.0,
                      child: Text(
                        'N',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Text('My Name ;)')),
                  ],
                ),
              ),
              background: Container(
                color: Colors.purple,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List<Text>.generate(100, (int i) {
                return Text("List item $i");
              }),
            ),
          ),
        ],
      ),
    );
  }
}
