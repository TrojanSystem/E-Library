import 'package:flutter/material.dart';

class NewBookItem extends StatelessWidget {
  String title;
  String image;

  NewBookItem({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 350,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        //color: Colors.white.withOpacity(0.7),
        // elevation: 10,
        child: Column(
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
                        image: AssetImage(image), fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 200,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                            size: 25,
                          ),
                        ),
                        const Text('5.0'),
                      ],
                    ),
                    width: 70,
                    height: 35,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
