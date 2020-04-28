class CovidModel {
  String country;
  int confirmed;
  int recovered;
  int critical;
  int deaths;
  double latitude;
  double longitude;

  CovidModel(
      {this.country,
      this.confirmed,
      this.recovered,
      this.critical,
      this.deaths,
      this.latitude,
      this.longitude});

  CovidModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    critical = json['critical'];
    deaths = json['deaths'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['confirmed'] = this.confirmed;
    data['recovered'] = this.recovered;
    data['critical'] = this.critical;
    data['deaths'] = this.deaths;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

// class CovidModel {
// //   "confirmed":"932346"
// // "recovered":"193149"
// // "deaths":"46807"
// // "active":"484122"
// // "date":"2020-04-01"
//   String country;
//   String confirmed;
//   String recovered;
//   String critical;
//   String deaths;
//   String latitude;
//   String longitude;

//   CovidModel({
//     this.country,
//     this.confirmed,
//     this.recovered,
//     this.critical,
//     this.deaths,
//     this.latitude,
//     this.longitude,
//   });

//   CovidModel.fromJson(Map<String, dynamic> json) {
//     country = json['country'];
//     confirmed = json['confirmed'];
//     recovered = json['recovered'];
//     critical = json['critical'];
//     deaths = json['deaths'];
//     latitude = json['latitude'];
//     longitude = json['longitute'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();

//     data['country'] = this.country;
//     data['confirmed'] = this.confirmed;
//     data['recovered'] = this.recovered;
//     data['critical'] = this.critical;
//     data['deaths'] = this.deaths;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     return data;
//   }

//   // static CovidModel fromMap(Map<String, dynamic> map) {
//   //   if (map == null) {
//   //     print('RETORNOU NULA A CLASSE MODEL');
//   //     return null;
//   //   } else {
//   //     print('RETORNOU COM VALOR');
//   //     return CovidModel(
//   //         country: map['country'],
//   //         confirmed: map['confirmed'],
//   //         recovered: map['recovered'],
//   //         critical: map['critical'],
//   //         deaths: map['deaths'],
//   //         latitude: map['latitude'],
//   //         longitude: map['longitude']);
//   //   }
//   // }
// }
