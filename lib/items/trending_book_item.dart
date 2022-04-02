import 'package:flutter/material.dart';

class TrendingBookItem extends StatelessWidget {
  final String name;
  final String title;
  final String image;
  final String rate;


  TrendingBookItem({this.image, this.title,this.rate,this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 150,
      //padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        //color: Colors.white.withOpacity(0.7),
        // elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3.0,
                        blurRadius: 5.0,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ],
                    image: DecorationImage(
                        image: NetworkImage('http://192.168.1.11:8080/$image'),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 120,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Expanded(
                          child: Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                            size: 15,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            rate.toString(),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    width: 40,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(15)),
                      color: Colors.blue[800],
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                name,
                style: const TextStyle(fontSize: 12.0),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
