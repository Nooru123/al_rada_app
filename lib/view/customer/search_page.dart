import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:search_bar_animated/search_bar_animated.dart';

import '../../controller/ctm_Controller.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final customer = Provider.of<CtmPro>(
      context,
    );
    return  Scaffold(
      body:  AnimatedSearchBar(searchBoxInputDecoration: InputDecoration(

      ),
        duration: const Duration(milliseconds: 1000),
        animationAlignment: AnimationAlignment.left,

        width: width / 20,
        buttonColor: Colors.black,
        backgroundColor: Colors.black26,
        searchList: customer.searchList,
        overlaySearchListItemBuilder: (dynamic item) {
          return Container(

            // padding: EdgeInsets.all(width / 40),
            child: Text(
              item,
              style: GoogleFonts.poppins(fontSize: height / 50),
            ),
          );
        },
        searchQueryBuilder: (String query, List<dynamic> list) =>
            customer.searchList.where((item) {
              return item
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList(),
        textController: customer.searchController,
        buttonIcon: Icon(CupertinoIcons.search),
        submitIcon: Icon(Icons.send),
        onSubmit: () {
          customer.searchBar();
        },
      ),
    );
  }
}
