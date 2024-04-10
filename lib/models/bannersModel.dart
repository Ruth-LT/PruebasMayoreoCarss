class  banner{
  int id;
  String name;
  String url;
  String url_mobile;
  String action_url;

  banner(
      {
        this.id,
        this.name,
        this.url,
        this.url_mobile,
        this.action_url,
      });

  factory banner.fromJson(Map<String, dynamic> json) {
    return banner(
      id: int.parse(json['id']),
      name: json['name'] as String,
      url: json['url'] as String,
      url_mobile: json['url_mobile'] as String,
      action_url: json['action_url'].toString()
    );
  }

}