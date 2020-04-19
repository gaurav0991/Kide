
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {

  final String title, body, image, subtitle, date, likes, views;

  PostDetailsPage({
    this.title,
    this.body,
    this.image,
    this.subtitle,
    this.date,
    this.likes,
    this.views
  });

  @override
  _PostDetailsPageState createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[500],
        child: Icon(Icons.share),
        onPressed: () {},
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue[300],
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  child: Icon(Icons.arrow_back, size: 30, color: Colors.blue[300],),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            expandedHeight: deviceHeight * 0.31,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              background: widget.image != null ? Image.network(
                widget.image,
                fit: BoxFit.fill,
              ) : SizedBox()
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Chip(
                              backgroundColor: DynamicTheme.of(context).data.cardColor,
                              avatar: Icon(Icons.access_time, color: Colors.blue[300],),
                              label: Text(
                                widget.date,
                                style: TextStyle(
                                  color: DynamicTheme.of(context).data.textTheme.subtitle.color
                                ),
                              ),
                            ),
                            Spacer(),
                            Chip(
                              backgroundColor: DynamicTheme.of(context).data.cardColor,
                              avatar: Icon(Icons.favorite, color: Colors.blue[300],),
                              label: Text(
                                "${widget.likes} likes",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: DynamicTheme.of(context).data.textTheme.subtitle.color
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                            height: 1.2
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                        child: Text(
                          widget.body,
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 1.0
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 1
            ),
          )
        ],
      ),
    );
  }
}