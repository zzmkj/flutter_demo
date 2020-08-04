import 'package:flutter/material.dart';

class StateFulGroup extends StatefulWidget {
  @override
  _StateFulGroupState createState() => _StateFulGroupState();
}

class _StateFulGroupState extends State<StateFulGroup> {
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
                    Text('hello ... hello ...'),
                    Text('hello ... hello ...'),
                    Image.network(
                      'https://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        hintText: '请输入',
                        hintStyle: TextStyle(fontSize: 15)
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: PageView(
                        children: <Widget>[
                          _item('Page1', Colors.orange),
                          _item('Page1', Colors.green),
                          _item('Page1', Colors.pink)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ) : Text('list page ...'),
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
}
