import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: [
          appBar(),
        ]),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xfff4b402e),
              Colors.black,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xfff111111),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Esplora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_music_outlined),
            label: 'Raccolta',
          ),
        ],
      ),
    );
  }

  Widget appBar() =>
      SliverAppBar(
        backgroundColor: Colors.transparent,
        expandedHeight: 60,
        actions: [
          Icon(Icons.cast),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.account_circle_outlined),
          ),
        ],
        elevation: 0,
        centerTitle: true,
        pinned: true,
        leadingWidth: 120,
        leading: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 45,
                    width: 45,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    "Music",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25.5),
                  )
                ])),
      );

  List<Widget> sliverList(int size, int sliverChildCount) {
    var widgetList = List<Widget>.empty();
    for (int index = 0; index < size; index++)
      widgetList..add(SliverAppBar(
        title: Text("Title $index"),
        pinned: true,
      ))..add(SliverFixedExtentList(
        itemExtent: 50.0,
        delegate:
        SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        }, childCount: sliverChildCount),
      ));

    return widgetList;
  }
}

