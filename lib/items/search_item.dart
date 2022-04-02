import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final formKey = GlobalKey<FormState>();
  String searchBook = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          key: formKey,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Find Your Book',
            prefixIcon: IconButton(
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();

                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 28,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onSaved: (value) {
            searchBook = value;
          },
        ),
      ),
    );
  }
}
