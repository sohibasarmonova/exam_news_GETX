import 'package:exam_news_getx/pages/modeles/articles_news_list_model.dart';
import 'package:exam_news_getx/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  ScrollController scrollController = ScrollController();
  bool isLoading = true;
  int currentPage = 1;
  List<Article> list = [];

  initScrollListener() {
    loadArticleNews();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
          scrollController.offset) {
        loadArticleNews();
      }
    });
  }

  loadArticleNews() async {

    isLoading = true;
    update();
    var response =
    await Network.GET(Network.API_NEWS_INFOS, Network.paramsArticle());
    List<Article> articles = Network.parseArticles(response!);
    print(articles.length);

      list = articles;
    isLoading = false;

    update();
  }
}