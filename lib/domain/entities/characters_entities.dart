// To parse this JSON data, do
//
//     final charactersModel = charactersModelFromJson(jsonString);

import 'dart:convert';

List<CharactersModel> charactersModelFromJson(String str) => List<CharactersModel>.from(json.decode(str).map((x) => CharactersModel.fromJson(x)));

String charactersModelToJson(List<CharactersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharactersModel {
    String id;
    String name;
    String status;
    String species;
    String gender;
    Location origin;
    Location location;
    String image;

    CharactersModel({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
    });

    factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        id: json["id"].toString(),
        name: json["name"],
        status: json["status"],
        species: json["species"],
        gender: json["gender"],
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
    };
}

class Location {
    String name;
    String url;

    Location({
        required this.name,
        required this.url,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
