import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: CustomAppBar(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Regular',
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                    ),
                    items: [
                      'Icons/slide1.jpg',
                      'Icons/slide2.jpg',
                      'Icons/slide3.jpg',
                    ].map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 0.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    height: 150.0,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'Icons/image5.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: 'Search Country',
                        suffixIcon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ListTileButton(title: 'AFG           Afghanistan'),
                  ListTileButton(title: 'DEN           Denmark'),
                  ListTileButton(title: 'BAN           Bangladesh'),
                  ListTileButton(title: 'BEL            Belarus'),
                  ListTileButton(title: 'RUS            Russia'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('Icons/man.png'),
          Text(
            'HOME',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins-Regular',
            ),
          ),
          Image.asset('Icons/star.png'),
        ],
      ),
    );
  }
}

class ListTileButton extends StatelessWidget {
  final String title;

  ListTileButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: 'Poppins-Regular',
              ),
            ),
            Bookmark(),
          ]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page2()),
        );
      },
    );
  }
}

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isBookmarked ? Icons.star : Icons.star_border,
          color: Color.fromARGB(255, 226, 208, 7)),
      onPressed: _toggleBookmark,
    );
  }

  void _toggleBookmark() {
    setState(() {
      if (_isBookmarked) {
        _isBookmarked = false;
      } else {
        _isBookmarked = true;
      }
    });
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details'),
        centerTitle: true,
        backgroundColor: Color(0xFF1E2831),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 10,
            color: Color(0xFF1E2831),
          ),
          Stack(
            children: <Widget>[
              Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E2831),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  )),
              Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('Icons/indflag.png'),
                  height: 200,
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Code',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('IN',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Capital',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('New Delhi',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'ISD',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('+91',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: TextButton(onPressed: () {}, child: Text('Wikipedia')),
          ),
          Column(
            children: [
              Text('CITIES',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Search Country',
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: ListTileButton2(title: 'Mumbai', subtitle: 'Maharashtra')),
          Expanded(
              child: ListTileButton2(title: 'Mumbai', subtitle: 'Maharashtra')),
          Expanded(
              child: ListTileButton2(title: 'Mumbai', subtitle: 'Maharashtra')),
          Expanded(
              child: ListTileButton2(title: 'Mumbai', subtitle: 'Maharashtra')),
          Expanded(
              child: ListTileButton2(title: 'Mumbai', subtitle: 'Maharashtra')),
        ],
      ),
    );
  }
}

class ListTileButton2 extends StatelessWidget {
  final String title;
  final String subtitle;

  ListTileButton2({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            Bookmark(),
          ]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page3()),
        );
      },
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Details'),
        centerTitle: true,
        backgroundColor: Color(0xFF1E2831),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF1E2831),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Text(
                    'New York',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            SingleChildScrollView(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 580,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: true,
                ),
                items: [
                  'Icons/map.jpg',
                ].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF1E2831),
                        ),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              item,
                              height: 275,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image(
                                      image: AssetImage('Icons/latitude.jpg')),
                                  Text('Latitude',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Text('20',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularPercentIndicator(
                                  radius: 55.0,
                                  lineWidth: 10.0,
                                  percent: 0.70,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Population',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '4141414',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  circularStrokeCap: CircularStrokeCap.butt,
                                  progressColor: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              Column(
                                children: [
                                  Image(
                                      image: AssetImage('Icons/longitude.jpg')),
                                  Text('Longitude',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Text('40',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: Text('Elevation(m): 100',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF1E2831)),
                            child: Text('Wikipedia',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ]),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ]),
    );
  }
}
