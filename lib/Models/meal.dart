
enum Complexity1 {
  Simple,
  Challenging,
  Hard,
}

enum Affordability1 {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal2{

  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  final int duration;
  final Complexity1 complexity;
  final Affordability1 affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal2({
    required this.id,
    required this.title,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

}
