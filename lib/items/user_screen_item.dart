import 'package:flutter/material.dart';

class UserScreenItem extends StatelessWidget {
  const UserScreenItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.pink,
                    Colors.pink.withOpacity(0.7),
                  ]),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/112.jpg'),
                          fit: BoxFit.cover),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Suretion',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
