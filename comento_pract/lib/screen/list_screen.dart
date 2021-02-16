import 'package:comento_pract/const/common_size.dart';
import 'package:comento_pract/const/string.dart';
import 'package:comento_pract/network/network_helper.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            onTap: (value) {
              if (currentCategory != value + 1)
                setState(() {
                  currentCategory = value + 1;
                });
            },
            tabs: [
              Tab(text: NetworkHelper().filterCategoryList[0].name.toString()),
              Tab(text: NetworkHelper().filterCategoryList[1].name.toString()),
              Tab(text: NetworkHelper().filterCategoryList[2].name.toString()),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: common_gap,
            ),
            Text(
                loginTitleController.text == ''
                    ? 'Guest $loginHello'
                    : loginTitleController.text + loginHello),
            SizedBox(
              height: common_gap,
            ),
            CategoryPerPage(),

          ],
        ),
      ),
    );
  }

  int currentPage = 1;

  int currentCategory = 1;
  int category = 1;

  Expanded CategoryPerPage() {
    if (category != currentCategory) {
      category = currentCategory;
      currentPage = 1;
      NetworkHelper().pageList = [];
    }
    return Expanded(
      child: FutureBuilder(
        future: NetworkHelper().fetchGetList(currentPage, category),
        builder: (context, snapshot) {
          return RefreshIndicator(
            onRefresh: () async{
              setState(() {
                currentPage+=1;
              });
            },

            child: ListView.builder(
                shrinkWrap: true,
                itemCount: NetworkHelper().pageList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(common_xs_gap),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title :\n' + NetworkHelper().pageList[index].title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
