/// code : 200
/// message : "Done"
/// data : {"data":[{"id":1,"name":"علوش","description":"سوبر ماركت","category_id":1,"area_id":1,"phone":"011111","image":"/uploads/places/166034502923218.jpeg","whatsapp":"0123123123","distance":0,"rate":0,"latitude":"30.08392775740314","longitude":"31.329268544982895","images":["/uploads/places/163882380587947.jpeg","/uploads/places/166034502945075.jpg","/uploads/places/166034502996808.jpeg"],"tags":[]},{"id":2,"name":"محل مستحضرات","description":"محل مستحضرات","category_id":2,"area_id":2,"phone":"+11115752554","image":"/uploads/places/166034516956645.jpg","whatsapp":"0123123123","distance":0,"rate":0,"latitude":"30.104943541556064","longitude":"31.343988508056626","images":["/uploads/places/163882467821514.jpeg","/uploads/places/163882467827798.jpeg","/uploads/places/166034516944051.jpg"],"tags":[]},{"id":3,"name":"أولاد رجب","description":"details","category_id":1,"area_id":1,"phone":"01115752554","image":"/uploads/places/166034668646198.jpg","whatsapp":"3123123123","distance":0,"rate":0,"latitude":"30.078506","longitude":"31.328024","images":["/uploads/places/163837781587534.jpeg","/uploads/places/163837781512804.jpeg","/uploads/places/166002121144376.png","/uploads/places/166002121183662.png","/uploads/places/166002121130928.png"],"tags":[]}],"pagination":{"total":3,"count":3,"per_page":10,"current_page":1,"total_pages":1,"next_page_url":null,"prev_page_url":null}}

class PlacesModel {
  PlacesModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? BigData.fromJson(json['data']) : null;
  }
  num? code;
  String? message;
  BigData? data;


}


class BigData {

  List<Data>? data;
  Pagination? pagination;
  BigData.fromJson(dynamic json) {
    if (json['data'] != null) {
     data = [];
      json['data'].forEach((v) {
       data?.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }



}
class Pagination {

  Pagination.fromJson(dynamic json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }
  num? total;
  num? count;
  num? perPage;
  num? currentPage;
  num? totalPages;
  dynamic nextPageUrl;
  dynamic prevPageUrl;


}

/// id : 1
/// name : "علوش"
/// description : "سوبر ماركت"
/// category_id : 1
/// area_id : 1
/// phone : "011111"
/// image : "/uploads/places/166034502923218.jpeg"
/// whatsapp : "0123123123"
/// distance : 0
/// rate : 0
/// latitude : "30.08392775740314"
/// longitude : "31.329268544982895"
/// images : ["/uploads/places/163882380587947.jpeg","/uploads/places/166034502945075.jpg","/uploads/places/166034502996808.jpeg"]
/// tags : []

class Data {

  Data.fromJson(dynamic json) {
  id = json['id'];
  name = json['name'];
  description = json['description'];
  categoryId = json['category_id'];
  areaId = json['area_id'];
  phone = json['phone'];
  image = json['image'];
  whatsapp = json['whatsapp'];
  distance = json['distance'];
  rate = json['rate'];
  latitude = json['latitude'];
  longitude = json['longitude'];
  images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num?  id;
  String?  name;
  String?  description;
  num?  categoryId;
  num?  areaId;
  String?  phone;
  String?  image;
  String?  whatsapp;
  num?  distance;
  num?  rate;
  String?  latitude;
  String?  longitude;
  List<String>?  images;
  List<dynamic>?  tags;


}