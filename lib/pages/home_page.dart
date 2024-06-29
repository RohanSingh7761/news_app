import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/components/slider_option.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/pages/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future getNews () {
  //   final
  // }

  @override
  Widget build(BuildContext context) {
    final categories = CatergoryProvider().availCategories;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QuickNews",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: categories.length,
            itemBuilder: (context, index, realIndex) {
              return SliderOption(
                title: categories[index].title,
              );
            },
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            child: Text("View all news.."),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewsPage()),
            ),
          )
        ],
      ),
    );
  }
}
