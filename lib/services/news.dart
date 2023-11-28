import 'dart:convert';
import 'package:finpro/Models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];


  Future<void> getNews() async{
    String url="https://newsapi.org/v2/everything?q=weather&from=2023-11-19&to=2020-9-19&sortBy=date&apiKey=1fdc03cd06644ce98b0f5e28fd933b62";
    var response= await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          news.add(articleModel);
        }
      });
    }

  }
}