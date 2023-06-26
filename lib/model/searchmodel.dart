// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
    String status;
    List<Item> items;

    Search({
        required this.status,
        required this.items,
    });

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        status: json["status"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    String title;
    String htmlTitle;
    String link;
    String displayLink;
    String snippet;
    String htmlSnippet;

    Item({
        required this.title,
        required this.htmlTitle,
        required this.link,
        required this.displayLink,
        required this.snippet,
        required this.htmlSnippet,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        htmlTitle: json["htmlTitle"],
        link: json["link"],
        displayLink: json["displayLink"],
        snippet: json["snippet"],
        htmlSnippet: json["htmlSnippet"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "htmlTitle": htmlTitle,
        "link": link,
        "displayLink": displayLink,
        "snippet": snippet,
        "htmlSnippet": htmlSnippet,
    };
}
