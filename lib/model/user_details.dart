class UserDetails {
  String? displayName;
  String? email;
  String? photoURL;

  //Constructor

UserDetails({this.displayName, this.email, this.photoURL});

// need to create map

UserDetails.fromJson(Map<String, dynamic>json)
  {
    displayName = json["displaName"];
    photoURL = json["photoURL"];
    email = json["email"];

  }
  Map<String, dynamic> tojson()
  {
    final Map<String,dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoURL'] = this.photoURL;

    return data;
  }

}