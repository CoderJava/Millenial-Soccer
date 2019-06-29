import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:millenial_soccer/src/bloc/news/news_bloc.dart';
import 'package:millenial_soccer/src/model/news/news_response.dart';
import 'package:millenial_soccer/src/utils/utils.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsBloc _newsBloc;

  @override
  void initState() {
    _newsBloc = NewsBloc();
    super.initState();
  }

  @override
  void dispose() {
    _newsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDateFrom = DateFormat("yyyy-MM-dd").format(DateTime.now());
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("News"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FutureBuilder(
          future: _newsBloc.getNews(strDateFrom),
          builder: (BuildContext context, AsyncSnapshot<NewsResponse> snapshot) {
            if (snapshot.hasData) {
              NewsResponse newsResponse = snapshot.data;
              List<ItemArticleNews> listArticles = newsResponse.listArticles;
              return ListView.separated(
                itemCount: listArticles.length,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 4.0,
                      right: 16.0,
                      bottom: 4.0,
                    ),
                    child: Divider(color: Colors.grey),
                  );
                },
                itemBuilder: (context, index) {
                  ItemArticleNews itemArticleNews = listArticles[index];
                  String title = itemArticleNews.title;
                  String description = itemArticleNews.description;
                  String urlImage =
                      itemArticleNews.urlToImage ?? pathImageNotFound;
                  String source = itemArticleNews.source.name ?? "N/A";
                  String url = itemArticleNews.url;
                  if (index == 0) {
                    return _buildWidgetHeadlineNews(
                        urlImage, mediaQuery, title, context, source, url);
                  } else {
                    return _buildWidgetItemNews(url, context, urlImage,
                        mediaQuery, title, description, source);
                  }
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            return Center(
              child: buildCircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  GestureDetector _buildWidgetItemNews(
      String url,
      BuildContext context,
      String urlImage,
      MediaQueryData mediaQuery,
      String title,
      String description,
      String source) {
    return GestureDetector(
      onTap: () {
        launchUrl(url).then((isCanLaunchUrl) {
          if (!isCanLaunchUrl) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Cannot open detail news")),
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage("assets/image/img_placeholder.jpg"),
              image: NetworkImage(urlImage),
              fit: BoxFit.cover,
              width: mediaQuery.size.width / 4,
              height: mediaQuery.size.width / 4,
            ),
            Container(
              width: 16.0,
            ),
            Expanded(
              child: Container(
                height: mediaQuery.size.width / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.title.merge(
                            TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      source,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetHeadlineNews(String urlImage, MediaQueryData mediaQuery,
      String title, BuildContext context, String source, String url) {
    return GestureDetector(
      onTap: () {
        launchUrl(url).then((isCanLaunchUrl) {
          if (!isCanLaunchUrl) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Cannot open detail news")),
            );
          }
        });
      },
      child: Stack(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage("assets/image/img_placeholder.jpg"),
            image: NetworkImage(urlImage),
            fit: BoxFit.cover,
            height: mediaQuery.size.height / 2,
          ),
          Opacity(
            child: Container(
              height: mediaQuery.size.height / 2,
              color: Colors.black,
            ),
            opacity: 0.3,
          ),
          Container(
            height: mediaQuery.size.height / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .merge(TextStyle(color: Colors.white)),
                  ),
                  Text(
                    source,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .merge(TextStyle(color: Colors.white70)),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
