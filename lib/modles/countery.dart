class coun {
   String country;
   String flag;
   int cases;
   int todayCases;
   int deaths;
   int recovered;
   int active;

  coun({required this.country,required this.flag,required this.cases,required this.todayCases,required this.deaths,required this.recovered,required this.active});


  factory coun.tojson({required Map data}) {
    return coun(
      country: data['country'],
      flag: data['countryInfo']['flag'],
      cases: data['cases'],
      todayCases: data['todayCases'],
      deaths: data['deaths'],
      recovered: data['recovered'],
      active: data['active'],
    );
}

  toList() {}
}
