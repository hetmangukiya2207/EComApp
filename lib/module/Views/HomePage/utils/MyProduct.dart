import 'package:flutter/material.dart';
import '../../../Utils/Helper/APIHelper.dart';
import '../model/ItemModel.dart';

Widget getProduct(
    {required String category,
      required String displayname,
      required List<Product> filteredData,
      double min = 0,
      double max = 2000}) {
  return FutureBuilder(
    future: APIHelper.apiHelper.callApi(),
    builder: (context, snapshot) {
      double h = MediaQuery
          .of(context)
          .size
          .height;
      double w = MediaQuery
          .of(context)
          .size
          .width;
      if (snapshot.hasError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.3,
              ),
              Image.asset(
                'assets/images/download.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                "No Internet Connection\n Please Connect a Network",
                style: TextStyle(
                    fontSize: h * 0.022,
                    color: Colors.red),
              ),
            ],
          ),
        );
      } else if (snapshot.hasData) {
        List<Product>? data = snapshot.data;
        filteredData =
            data!.where((item) => category == item.category).toList();
        return SizedBox(
          height: h * 0.5,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    displayname,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredData.length,
                  itemBuilder: (context, i) {
                    filteredData[i].price >= min;
                    filteredData[i].price <= max;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("DetailPage", arguments: filteredData[i]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        // height: h,
                        width: w * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              filteredData[i].thumbnail),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffb71c1c),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${filteredData[i].discountPercentage} %",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: w,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredData[i].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "\$ ${filteredData[i].price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                ),
              ),
            ],
          ),
        );
      }
      return Center(
        child: SizedBox(
          height: h,
          width: w,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    },
  );
}