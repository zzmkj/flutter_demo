import 'package:flutter/material.dart';

class FlutterLayout extends StatefulWidget {
  @override
  _FlutterLayoutState createState() => _FlutterLayoutState();
}

class _FlutterLayoutState extends State<FlutterLayout> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello flutter'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(Icons.home, color: Colors.grey,),
              activeIcon: Icon(Icons.home, color: Colors.blue,)
            ),
            BottomNavigationBarItem(
                title: Text('列表'),
                icon: Icon(Icons.list, color: Colors.grey,),
                activeIcon: Icon(Icons.list, color: Colors.blue,)
            )
          ],
          currentIndex: _currentIndex,
          onTap: (index) => {
            setState(() {
              _currentIndex = index;
            })
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("floating clicked..."),
          child: Text('点我'),
        ),
        body: _currentIndex == 0 ? RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network('https://www.devio.org/img/avatar.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Opacity(
                              opacity: 0.6,
                              child: Image.network(
                                'https://www.devio.org/img/avatar.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: PhysicalModel(color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAlias,
                        child: PageView(
                          children: <Widget>[
                            _item('Page1', Colors.orange),
                            _item('Page1', Colors.green),
                            _item('Page1', Colors.pink)
                          ],
                        ),
                      )
                    ),
                    Column(
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.red),
                            child: Text('宽度撑满'),
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Image.network(
                    'https://www.devio.org/img/avatar.png',
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    'https://www.devio.org/img/avatar.png',
                    width: 100,
                    height: 100,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.network(
                      'https://www.devio.org/img/avatar.png',
                      width: 36,
                      height: 36,
                    ),
                  )
                ],
              ),
              Wrap(
                runSpacing: 5,
                spacing: 8,
                children: <Widget>[
                  _chip('Flutter'),
                  _chip('进阶'),
                  _chip('实战'),
                  _chip('携程'),
                  _chip('App'),
                ],
              )
            ],
          ),
        ) : Column(
          children: <Widget>[
            Text('列表'),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey),
                child: Text('拉伸填满高度'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }

  _chip(String label) {
    return Chip(label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );

  }
}
