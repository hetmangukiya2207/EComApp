import 'package:flutter/material.dart';

import '../model/ItemModel.dart';
import '../utils/MyProduct.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int shoesint = 0;
    List<Product> filteredData = [];
    String? selectcategory;
    RangeValues rangeValues = const RangeValues(1, 2000);
    TextEditingController SearchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextField(
            controller: SearchController,
            onChanged: (value) {
              //Do something wi
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff4338CA),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF3DB9FF), Color(0xff15BE77)])),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: .5,
                      child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                          fit: BoxFit.cover),
                    ),
                    Image.network("https://parspng.com/wp-content/uploads/2023/02/shoespng.parspng.com-12.png"),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "60% Sale ToDay",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TweenAnimationBuilder(
                                tween: Tween(begin: 30.0, end: 0.0),
                                duration: const Duration(seconds: 30),
                                onEnd: () {
                                  shoesint = 1;
                                },
                                builder: (_, dynamic value, child) => Visibility(
                                  visible: shoesint == 0, // Show the widget only if shoesint is 1
                                  child: Column(
                                    children: [
                                      Text(
                                        "Sale End On 00:${value.toInt()}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            shoesint = 0;
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Shoe Successfully Added To Cart Page",
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Add To Cart",
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: selectcategory != null,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text("From \n\$ ${rangeValues.start.toInt()}"),
                        Expanded(
                          child: RangeSlider(
                            divisions: 2000,
                            min: 1,
                            max: 2000,
                            values: rangeValues,
                            onChanged: (val) {
                              setState(() {
                                rangeValues = val;
                              });
                            },
                          ),
                        ),
                        Text("From \n\$ ${rangeValues.end.toInt()}"),
                      ],
                    ),
                  ),
                ),
                (selectcategory != null)
                    ? getProduct(
                  category: selectcategory!,
                  displayname: selectcategory!,
                  min: rangeValues.start,
                  max: rangeValues.end,
                  filteredData: filteredData,
                )
                    : Column(
                  children: [
                    getProduct(
                        category: "mens-shoes",
                        displayname: "Mens Shoes",
                        min: rangeValues.start,
                        max: rangeValues.end,
                        filteredData: filteredData),
                    getProduct(
                        category: "mens-watches",
                        displayname: "Mens Watches",
                        min: rangeValues.start,
                        max: rangeValues.end,
                        filteredData: filteredData),
                    getProduct(
                        category: "womens-watches",
                        displayname: "Womens Watches",
                        min: rangeValues.start,
                        max: rangeValues.end,
                        filteredData: filteredData),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
