import 'dart:math';

import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:lesson_7/showfruit.dart';

import 'data.dart';

class ClipperPage extends StatefulWidget {
  @override
  _ClipperPageState createState() => _ClipperPageState();
}

class _ClipperPageState extends State<ClipperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(left: 5, right: 5, top: 30, bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          appbar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
            child: Text(
              'What would you like to eat? ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          textFeild(),
          Expanded(
              child: Container(
            child: GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: .65),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShowFruit()));
                    },
                                      child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 310,
                      // color: Colors.orangeAccent,
                      child: Stack(
                        children: <Widget>[
                          customShape(
                              context: context,
                              bgcolor: data[index]['color'],
                              icon: Icon(
                                data[index]['icon'],
                                color: data[index]['Iconcolor'],
                              ),
                              imgUrl: data[index]['img']),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            left: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${data[index]['name']}',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '\$${data[index]['price']}',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(' kg'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    ));
  }

  Widget customShape(
      {@required BuildContext context,
      @required Color bgcolor,
      @required String imgUrl,
      @required Icon icon}) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width / 2 - 10,
      // color: Colors.red,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width / 2 - 10,
              // color: Colors.red,
              child: Transform.translate(
                offset: Offset(-18, -40),
                child: Transform.scale(
                  scale: 1.8,
                  child: ClipPath(
                    clipper:
                        BlobClipper(edgesCount: 4, minGrowth: 5, id: '4-4-62'),
                    child: Image.network(
                      "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/cooldownpink.jpg?itok=-SDuFsdT",
                      color: bgcolor != null ? bgcolor : Colors.greenAccent,
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 5,
              left: 5,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 15,
                decoration: BoxDecoration(
                    // color: Colors.purpleAccent,
                    image: DecorationImage(
                        image: NetworkImage(imgUrl != null
                            ? imgUrl
                            : 'https://www.jingold.it/wp-content/uploads/2020/02/verde-ok-1.png'))),
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 70,
              width: 70,
              // color: Colors.blue,
              child: Transform.rotate(
                angle: pi / 4,
                child: Transform.translate(
                  offset: Offset(-5, -10),
                  child: Transform.scale(
                    scale: 1.5,
                    child: ClipPath(
                      clipper: BlobClipper(
                          edgesCount: 4, minGrowth: 4, id: '3-9-86779'),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Image.network(
                              "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/cooldownpink.jpg?itok=-SDuFsdT",
                              color: bgcolor != null
                                  ? bgcolor
                                  : Colors.greenAccent,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                              child: Transform.rotate(
                                  angle: pi / -4,
                                  child: icon != null ? icon : Icon(Icons.add)))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textFeild() {
    return Container(
      padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: TextField(
        style: TextStyle(fontSize: 15.0, color: Colors.black),
        decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
          filled: true,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey[900],
            size: 30,
          ),
          fillColor: Colors.grey[200],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget appbar() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 2, right: 5),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/1036622/pexels-photo-1036622.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              )),
          SizedBox(width: 15),
          Text(
            'Hi,Jinea!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.sort,
                size: 35,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
