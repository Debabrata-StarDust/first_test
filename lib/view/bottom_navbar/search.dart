import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/api_model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List filteredUniversities = [];
  List<GetJson> listData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
    setState(() {
      filteredUniversities = listData;
      log("data coming:====${listData.toString()}");
      //log("data coming:====$fetchResponse");
    });

    //searchController.addListener(filteredUniversities);
  }

  // void _searchListener() {
  //   String query = searchController.text.toLowerCase();
  //   setState(() {
  //     filteredUniversities = listdata.where((university) {
  //       return university.name.toLowerCase().contains(query);
  //     }).toList();
  //   });
  // }
  void _filterUniversities(String query) {
    query = query.toLowerCase();
    setState(() {
      filteredUniversities = listData.where((university) {
        return university.name.toLowerCase().contains(query);
      }).toList();
      // print(filteredUniversities.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: ListTile(
      //     leading: Image.asset("assets/images/woman.png"),
      //     // Container(
      //     //   width: 50,
      //     //   height: 50,
      //     //   decoration: BoxDecoration(
      //     //     borderRadius: BorderRadius.circular(50),
      //     //     color: Colors.grey,
      //     //   ),
      //     // ),
      //     title: const Text(
      //       "Emma R.",
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 16,
      //       ),
      //     ),
      //     subtitle: const Text(
      //       "Quality Assurance",
      //       style: TextStyle(
      //         fontSize: 17,
      //         color: Colors.grey,
      //       ),
      //     ),
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.all(8.0),
      //       child: Icon(Icons.notifications),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset("assets/images/woman.png"),
            // Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     color: Colors.grey,
            //   ),
            // ),
            title: const Text(
              "Emma R.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              "Quality Assurance",
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
            trailing: const Icon(Icons.notifications),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Find a Institution",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: searchController,
                onChanged: _filterUniversities,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(CupertinoIcons.search),
                    hintText: "Institution title or keyword",
                    suffixIcon: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/images/paper-plane.png",
                        height: 30,
                      ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: Get.height,
                color: Colors.white,
              ),
              const Positioned(
                top: 20,
                left: 10,
                child: Text(
                  "Popular Institution",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
                  child: SizedBox(
                    height: Get.height,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filteredUniversities.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            width: 350,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.purple,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: Get.width * 0.9,
                                      child: ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          child: Image.network(
                                            'https://img.freepik.com/premium-vector/black-lightning-yellow-background-vector-illustration_581871-510.jpg',
                                            height: 50,
                                          ),
                                        ),
                                        title: Text(
                                          listData[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "Webpage:${filteredUniversities[index].webPages}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            //color: Colors.white,
                                          ),
                                        ),
                                        trailing: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Image.asset(
                                            "assets/images/bookmark.png",
                                            // height: 50,
                                            // color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.purple.shade300,
                                        ),
                                        child: const Text(
                                          "Full Time",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.purple.shade300,
                                        ),
                                        child: const Text(
                                          "Part Time",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 30,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        filteredUniversities[index]
                                            .country
                                            .toString(),
                                        style: const TextStyle(
                                            // color: Colors.white,
                                            ),
                                      ),
                                      const Text(
                                        "20 hour ago",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          //color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Future<List<GetJson>> fetchData() async {
    final response = await http.get(
        Uri.parse("http://universities.hipolabs.com/search?country=India"));
    var data = jsonDecode(response.body.toString());
    try {
      if (response.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          listData.add(GetJson.fromJson(i));
          //print(listData);
          // print('this is json data coming ${i}');
          // if (queary != null) {
          //   listdata = listdata
          //       .where((element) =>
          //           element.name.toLowerCase().contains(queary.toLowerCase()))
          //       .toList();
          // }
        }
        return listData;
      } else {
        print("Api error");
      }
    } on Exception catch (e) {
      print("Error : $e");
    }
    return listData;
  }
}
