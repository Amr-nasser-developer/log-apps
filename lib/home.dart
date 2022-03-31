import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool mute = false;
  void showPassword() {
    mute = !mute;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var searchControl = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: height * 0.22,
                      decoration: BoxDecoration(
                          color: HexColor('#e12025'),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(35.0),
                            bottomLeft: Radius.circular(35.0),
                          )),
                    ),
                    Positioned(
                      top: -70,
                      right: -50,
                      left: -50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: HexColor('#c52a28'),
                                    borderRadius: BorderRadius.circular(200)),
                              ),
                              Spacer(),
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: HexColor('#ef9b9b'),
                                    borderRadius: BorderRadius.circular(200)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -130,
                      right: -10,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(250),
                            border: Border.all(
                                width: 2, color: HexColor('#ffb7ba'))),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 55,
                            height: 60,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/filter.png',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            width: width * 0.62,
                            height: 40,
                            child: TextFormField(
                              autofocus: false,
                              controller: searchControl,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: HexColor('#e12025'),
                                ),
                                hintText: 'Search',
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: HexColor('#e51e25'),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Icon(Icons.search,
                                color: Colors.white, size: 28),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  showPassword();
                                },
                                child: Icon(
                                  (mute == true)
                                      ? Icons.volume_off_sharp
                                      : Icons.volume_up_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                (mute == false) ? 'Mute' : 'Un Mute',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Visitors',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                '270000',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            defaultContainer(),
            SizedBox(
              height: 10,
            ),
            defaultContainer(news: false),
            SizedBox(
              height: 10,
            ),
            defaultContainer(),
            SizedBox(
              height: 10,
            ),
            defaultContainer(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.red,
        key: _bottomNavigationKey,
        height: 55,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 25),
          Image.asset(
            'assets/images/history.png',
            width: 25,
            height: 22,
            colorBlendMode: BlendMode.darken,
          ),
          Image.asset(
            'assets/images/warrning.png',
            width: 25,
            height: 22,
            colorBlendMode: BlendMode.darken,
          ),
          Image.asset(
            'assets/images/setting.png',
            width: 25,
            height: 22,
            colorBlendMode: BlendMode.darken,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

Widget defaultContainer({bool news = true}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5),
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    width: double.infinity,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/flag.png'),
                width: 30,
                height: 30,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmed',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text('Cairo Egypt', style: TextStyle(fontSize: 10)),
                ],
              ),
              Spacer(),
              Container(
                child: (news == true)
                    ? Image.asset('assets/images/new.png')
                    : Row(
                  children: [
                    Text(
                      'Last Visit',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text('10 Aug. 01:22:50',
                        style: TextStyle(
                            fontSize: 8, color: Colors.red)),
                  ],
                ),
                width: (news == true) ? 25 : null,
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Image.asset('assets/images/chat.png'),
                width: 25,
                height: 25,
              ),
            ],
          ),
        ),
        Divider(
          height: 3,
          color: Colors.grey[350],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/schedule.png'),
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text('15 Aug. 01:32:55',
                      style: TextStyle(fontSize: 10, color: Colors.red)),
                ],
              ),
              Spacer(),
              Icon(
                Icons.location_on,
                color: HexColor('#6289c5'),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IP',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text('192.168.168.15',
                      style: TextStyle(fontSize: 10, color: Colors.red)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 3,
          color: Colors.grey[350],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/redirct.png'),
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Redirected',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text('www.google.com',
                      style: TextStyle(fontSize: 10, color: Colors.red)),
                ],
              ),
              Spacer(),
              Container(
                child: Image(image: AssetImage('assets/images/homePage.png')),
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HomePage',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text('www.souq.com',
                      style: TextStyle(fontSize: 10, color: Colors.red)),
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  ),
);
