import 'dart:convert';

List<GetJson> getJsonFromJson(String str) =>
    List<GetJson>.from(json.decode(str).map((x) => GetJson.fromJson(x)));

String getJsonToJson(List<GetJson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetJson {
  AlphaTwoCode alphaTwoCode;
  Country country;
  String? stateProvince;
  List<String> webPages;
  String name;
  List<String> domains;

  GetJson({
    required this.alphaTwoCode,
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
    required this.domains,
  });

  factory GetJson.fromJson(Map<String, dynamic> json) => GetJson(
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
        country: countryValues.map[json["country"]]!,
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        domains: List<String>.from(json["domains"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "country": countryValues.reverse[country],
        "state-province": stateProvince,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "name": name,
        "domains": List<dynamic>.from(domains.map((x) => x)),
      };
}

enum AlphaTwoCode { IN }

final alphaTwoCodeValues = EnumValues({"IN": AlphaTwoCode.IN});

enum Country { INDIA }

final countryValues = EnumValues({"India": Country.INDIA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// class GetJson {
// // Lets create a constructor
//   GetJson({
//     required this.alpha_two_code,
//     required this.country,
//     required this.state_province,
//     required this.web_pages,
//     required this.name,
//     required this.domains,
//   });
//
// // declare the variable
//   late final String alpha_two_code;
//   late final String country;
//   late final String state_province;
//   late final String web_pages;
//   late final String name;
//   late final String domains;
//
// // that is function to jsondata to dart, when we take the data from the server
// // its take the data from the server json format and give it us as a dart format
// // get method
//   GetJson.fromjson(Map<String, dynamic> json) {
//     alpha_two_code = json['alpha_two_code'];
//     country = json['country'];
//     state_province = json['state-province'];
//     web_pages = json['web_pages'];
//     name = json['name'];
//     domains = json['domains'];
//   }
// // dart to json data when we send the data to the server
// // its take custom object and send to the server as a json format
// // post method
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data["alpha_two_code"] = alpha_two_code;
//     data['country'] = country;
//     data['state-province'] = state_province;
//     data['web_pages'] = web_pages;
//     data['name'] = name;
//     data['domains'] = domains;
//
//     return data;
//   }
// }
