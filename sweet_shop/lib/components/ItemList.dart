import 'package:flutter/material.dart';
import 'package:sweet_shop/constants.dart';
import 'package:sweet_shop/http/http.dart';
import 'package:sweet_shop/screens/profile/profile.dart';

import '../utilities/getColors.dart';
import '../utilities/parseToken.dart';
import 'ItemCard.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  var items = null;

  var user = null;

  getUser() async {
    var data = await parseToken();
    print(data);
    setState(() {
      user = data;
    });
  }

  Future getItems(String category) async {
    var res = await HttpConnectUser().getProducts(category);
    print(res);
    setState(() {
      items = res['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getItems("sofa");
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 41, 209),
                ),
                Positioned(
                  bottom: 50.0,
                  right: 100.0,
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200.0),
                        color: Color(getColorHexFromStr('#FEE16D'))
                            .withOpacity(0.4)),
                  ),
                ),
                Positioned(
                  bottom: 100.0,
                  left: 150.0,
                  child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          color: Color(getColorHexFromStr('#FEE16D'))
                              .withOpacity(0.5))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 15.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          },
                          child: Container(
                            child: user != null
                                ? user['user']['image'] != ""
                                    ? CircleAvatar(
                                        radius: 28,
                                        backgroundImage: NetworkImage(
                                            "$host/${user['user']['image']}"),
                                      )
                                    : CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.person,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 255, 59, 239),
                                        ),
                                      )
                                : CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Color.fromARGB(255, 255, 59, 239),
                                    ),
                                  ),
                          ),
                        ),

                        // SizedBox(
                        //     width: MediaQuery.of(context).size.width - 120.0),
                        // Container(
                        //   alignment: Alignment.topRight,
                        //   child: IconButton(
                        //     icon: Icon(Icons.menu),
                        //     onPressed: () {},
                        //     color: Colors.white,
                        //     iconSize: 30.0,
                        //   ),
                        // ),
                        SizedBox(height: 15.0),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        user != null
                            ? 'Welcome, ${user['user']['username']}'
                            : "Welcome, ...",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Place your order right away!',
                        style: TextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                    color: Color.fromARGB(255, 255, 59, 239),
                                    size: 30.0),
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ))),
                      ),
                    ),
                    SizedBox(height: 10.0)
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                SizedBox(height: 10.0),
                Material(
                    elevation: 1.0,
                    child: Container(height: 75.0, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        getItems("cake");
                      },
                      child: Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/cake.png'))),
                              ),
                            ),
                            Text(
                              'Cakes',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getItems("bread");
                      },
                      child: Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/bread.png'))),
                            ),
                            Text(
                              'Breads',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getItems("cookie");
                      },
                      child: Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/cookie.png'))),
                            ),
                            Text(
                              'Cookies',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getItems("special");
                      },
                      child: Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/confetti.png'))),
                            ),
                            Text(
                              'Special',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.75,
              child: items != null
                  ? ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemCard(
                            context,
                            items[index]['_id'],
                            items[index]['name'],
                            items[index]['image'],
                            true,
                            items[index]['price'],
                            items[index]['description']);
                      })
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        )
      ],
    );
  }
}
