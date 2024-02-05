import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/search/search_appbar.dart';
import 'package:team_7_sfacpolio/widgets/search/search_textfield.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 46),
        child: Column(
          children: [
            Search_Appbar(),
            SizedBox(
              height: 12,
            ),
            Search_Textfield()
          ],
        ),
      ),
    );
  }
}
