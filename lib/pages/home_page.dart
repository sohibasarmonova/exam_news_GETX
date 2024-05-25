import 'package:exam_news_getx/controller/home_controller.dart';
import 'package:exam_news_getx/pages/modeles/articles_news_list_model.dart';
import 'package:exam_news_getx/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.loadArticleNews();
    //print(list.length);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("N E W S", style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        body: GetBuilder<HomeController>(
          builder: (context) {
            return Stack(
              children: [
                ListView.builder(
                  controller: homeController.scrollController,
                  itemCount: homeController.list.length,
                  itemBuilder: (context, index) {
                    return itemOfArticleListNews(
                        homeController.list[index], index);
                  },
                ),
                homeController. isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),

              ],
            );
          },
        )
    );
  }
}

Widget itemOfArticleListNews(Article list, int index) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    image: NetworkImage(list.urlToImage!),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(),
            Card(
              color: Colors.black54,
              margin: EdgeInsets.all(20),
              child: Text(
                list.source!.name!,
                style: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),


          ],
        ),
      ),
      SizedBox(),
      Card(
        color: Colors.black54,

        child: Text(
          list.title!,
          style: TextStyle(fontSize: 16, color: Colors.white,),
        ),
      ),

      SizedBox(),
      Card(
        color: Colors.black54,
        child: Text(
          list.description!,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      SizedBox(),
      Card(
        color: Colors.black54,
        child: Text(
          list.content!,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      SizedBox(),
      Card(
        color: Colors.black54,
        child: Text(

          list.url!,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ],
  );
}