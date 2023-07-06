class peoplesData
{
  String? email ;
  double? dangerous ;

  peoplesData({
    this.email,
    this.dangerous,
  });
  peoplesData.fromJson(json)
  {
    email = json['email'];
    dangerous = json['dangerous'];
  }
  Map<String, dynamic> ToMap()
  {
    return {
      'email' : email,
      'dangerous' :dangerous ,

    };
  }



}