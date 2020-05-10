
class Global {
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;

  Global({this.totalConfirmed, this.totalDeaths, this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    totalConfirmed = json['TotalConfirmed'];
    totalDeaths = json['TotalDeaths'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalConfirmed'] = this.totalConfirmed;
    data['TotalDeaths'] = this.totalDeaths;
    data['TotalRecovered'] = this.totalRecovered;
    return data;
  }
}

class Countries {
  Global global;
  List<Countrie> countrie;
  String date;

  Countries({this.global, this.countrie, this.date});

  Countries.fromJson(Map<String, dynamic> json) {
    global =
        json['Global'] != null ? new Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countrie = new List<Countrie>();
      json['Countries'].forEach((v) {
        countrie.add(new Countrie.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.global != null) {
      data['Global'] = this.global.toJson();
    }
    if (this.countrie != null) {
      data['Countries'] = this.countrie.map((v) => v.toJson()).toList();
    }
    data['Date'] = this.date;
    return data;
  }
}

class Globally {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Globally(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  Globally.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewConfirmed'] = this.newConfirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['TotalRecovered'] = this.totalRecovered;
    return data;
  }
}

class Countrie {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Countrie(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  Countrie.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Slug'] = this.slug;
    data['NewConfirmed'] = this.newConfirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['TotalRecovered'] = this.totalRecovered;
    data['Date'] = this.date;
    return data;
  }
}


