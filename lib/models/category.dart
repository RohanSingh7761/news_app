class Category {
  final String title;
  String? description;

  Category({
    required this.title,
    this.description,
  });
}

class CatergoryProvider {
  List<Category> availCategories = [
    Category(
      title: "Business",
      description: "Get the latest news related to business",
    ),
    Category(
      title: "Entertainment",
      description: "Find out what's happening in the entertainment world",
    ),
    Category(
      title: "General",
      description: "What's happening around you",
    ),
    Category(
      title: "Health",
      description: "Get the latest updates on health world",
    ),
    Category(
      title: "Science",
      description: "Explore the fascinating science updates",
    ),
    Category(
      title: "Sports",
    ),
    Category(
      title: "Technology",
    ),
  ];
}
