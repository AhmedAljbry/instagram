class UserModle
{
  late String name;
  late String email;
  late String phone;
  late String password;
  late String covoerimage;
  late String userimage;
  late String bio;
  late String uId;
UserModle({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.covoerimage,
    required this.userimage,
    required this.bio,
    required this.uId,
});
UserModle.formjson(Map<String,dynamic>json)
{
  name=json["name"];
  email=json["email"];
  phone=json["phone"];
  password=json["password"];
  covoerimage=json["covoerimage"];
  userimage=json["userimage"];
  bio=json["bio"];
  uId=json["uId"];
}
Map<String,dynamic>tomap()
{
 return {
   'name':name,
   'email':email,
   'phone':phone,
   'password':password,
   'covoerimage':covoerimage,
   'userimage':userimage,
   'bio':bio,
   'uId':uId,
 };
}
}