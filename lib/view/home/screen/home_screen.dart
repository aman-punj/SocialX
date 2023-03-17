import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_x/models/news_model.dart';
import 'package:social_x/res/colors/app_colors.dart';
import 'package:social_x/view/auth/controller/auth_controller.dart';
import 'package:social_x/view/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() {
              authController.logout();
            }),
            icon: Icon(Icons.logout),
            color: AppColor.blackColor,
          )
        ],
        backgroundColor: AppColor.wightColor,
        leading: const Icon(
          Icons.search,
          color: AppColor.blackColor,
        ),
        title: TextFormField(
          controller: homeController.searchController.value,
          onChanged: (value) {
            setState(() {});
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            // prefixIcon: Icon(Icons.search
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            hintText: "Search with country name",
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.01,
          ),
          Expanded(
            child: FutureBuilder<NewsModel>(
                future: homeController.getNewsApi(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Container(
                                    height: Get.height * 0.17,
                                    child: Column(
                                      children: [],
                                    ),
                                  ),
                                ),
                              );
                            })));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: ((context, index) {
                          String countryName = snapshot
                              .data!.articles![index].source!.name
                              .toString();
                          if (homeController
                              .searchController.value.text.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  height: Get.height * 0.17,
                                  width: Get.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.03,
                                                child: Text(
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .source!
                                                      .name
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .secondaryTextColor,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .title
                                                    .toString(),
                                                softWrap: false,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .description
                                                    .toString(),
                                                softWrap: false,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColor
                                                        .secondaryTextColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.07,
                                        ),
                                        Container(
                                          height: Get.height * 0.08,
                                          width: Get.width * 0.17,
                                          child: Image.network(
                                            snapshot.data!.articles![index]
                                                .urlToImage
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (countryName.toLowerCase().contains(
                              homeController.searchController.value.text
                                  .toLowerCase())) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  height: Get.height * 0.17,
                                  width: Get.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.03,
                                                child: Text(
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .source!
                                                      .name
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .secondaryTextColor,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .title
                                                    .toString(),
                                                softWrap: false,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .description
                                                    .toString(),
                                                softWrap: false,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColor
                                                        .secondaryTextColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.07,
                                        ),
                                        Container(
                                          height: Get.height * 0.08,
                                          width: Get.width * 0.17,
                                          child: Image.network(
                                            snapshot.data!.articles![index]
                                                .urlToImage
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }));
                  }
                })),
          )
        ],
      ),
    );
  }
}
