// ignore_for_file: prefer_collection_literals

class CityModle {
  bool? status;
  List<Data>? data;
  Meta? meta;
  String? message;

  CityModle({this.status, this.data, this.meta, this.message});

  CityModle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? isActive;
  Translations? translations;

  Data({this.id, this.name, this.isActive, this.translations});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['is_active'] = isActive;
    if (translations != null) {
      data['translations'] = translations!.toJson();
    }
    return data;
  }
}

class Translations {
  En? en;
  En? ar;

  Translations({this.en, this.ar});

  Translations.fromJson(Map<String, dynamic> json) {
    en = json['en'] != null ? En.fromJson(json['en']) : null;
    ar = json['ar'] != null ? En.fromJson(json['ar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (en != null) {
      data['en'] = en!.toJson();
    }
    if (ar != null) {
      data['ar'] = ar!.toJson();
    }
    return data;
  }
}

class En {
  String? name;

  En({this.name});

  En.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    return data;
  }
}

class Meta {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Meta(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['count'] = count;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    return data;
  }
}
