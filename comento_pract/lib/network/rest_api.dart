class GetList {
  final int id;
  final String title;
  final String contents;
  final int category_id;
  final int user_id;
  final String created_at;
  final String updated_at;


  GetList({this.user_id, this.id, this.created_at, this.category_id, this.updated_at,this.title, this.contents});

  factory GetList.fromJson(Map<String, dynamic> json) {
    return GetList(
      id: json['id'],
      title: json['title'],
      contents: json['contents'],
      category_id: json['category_id'],
      user_id: json['user_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}

class GetPage{
  final int current_page;
  final List<dynamic> data;

  GetPage({this.current_page, this.data});
  factory GetPage.fromJson(Map<String, dynamic> json){
    return GetPage(
      current_page :json['current_page'],
      data: json['data']
    );
  }
}

class GetCategory {
  final List<dynamic> category;

  GetCategory({this.category});

  factory GetCategory.fromJson(Map<String, dynamic> json) {
    return GetCategory(
      category: json['category'],
    );
  }
}

class GetFilterCategory {
  final int id;
  final String name;

  GetFilterCategory({this.id, this.name});

  factory GetFilterCategory.fromJson(Map<String, dynamic> json) {
    return GetFilterCategory(
      id: json['id'],
      name : json['name']
    );
  }
}