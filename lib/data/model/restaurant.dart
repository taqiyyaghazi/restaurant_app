import 'dart:convert';

class RestaurantData {
    final List<Restaurant> restaurants;

    RestaurantData({
        required this.restaurants,
    });

    RestaurantData copyWith({
        List<Restaurant>? restaurants,
    }) => 
        RestaurantData(
            restaurants: restaurants ?? this.restaurants,
        );

    factory RestaurantData.fromRawJson(String str) => RestaurantData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
        restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
    };
}

class Restaurant {
    final String id;
    final String name;
    final String description;
    final String pictureId;
    final String city;
    final double rating;
    final Menus menus;

    Restaurant({
        required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating,
        required this.menus,
    });

    Restaurant copyWith({
        String? id,
        String? name,
        String? description,
        String? pictureId,
        String? city,
        double? rating,
        Menus? menus,
    }) => 
        Restaurant(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            pictureId: pictureId ?? this.pictureId,
            city: city ?? this.city,
            rating: rating ?? this.rating,
            menus: menus ?? this.menus,
        );

    factory Restaurant.fromRawJson(String str) => Restaurant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
        menus: Menus.fromJson(json["menus"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
    };
}

class Menus {
    final List<Drink> foods;
    final List<Drink> drinks;

    Menus({
        required this.foods,
        required this.drinks,
    });

    Menus copyWith({
        List<Drink>? foods,
        List<Drink>? drinks,
    }) => 
        Menus(
            foods: foods ?? this.foods,
            drinks: drinks ?? this.drinks,
        );

    factory Menus.fromRawJson(String str) => Menus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}

class Drink {
    final String name;

    Drink({
        required this.name,
    });

    Drink copyWith({
        String? name,
    }) => 
        Drink(
            name: name ?? this.name,
        );

    factory Drink.fromRawJson(String str) => Drink.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}


RestaurantData parseRestaurants(String? json) {
  if (json == null) {
    return RestaurantData(restaurants: []);
  }

  return RestaurantData.fromRawJson(json);
}