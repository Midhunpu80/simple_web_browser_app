class Duc {
  String query;
  List<Result> results;

  Duc({
    required this.query,
    required this.results,
  });

  factory Duc.fromJson(Map<String, dynamic> json) {
    return Duc(
      query: json['query'],
      results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'query': query,
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
  }
}

class Result {
  int position;
  String url;
  String title;
  String description;

  Result({
    required this.position,
    required this.url,
    required this.title,
    required this.description,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      position: json['position'],
      url: json['url'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'url': url,
      'title': title,
      'description': description,
    };
  }
}
