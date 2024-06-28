class PostModle
{
  late String name;
  late String image;
  late String posts;
  late String postimage;
  late String datetime;
  late String uId;
  PostModle({
    required this.name,
    required this.image,
    required this.posts,
    required this.postimage,
    required this.datetime,
    required this.uId,
  });
  PostModle.formjson(Map<String,dynamic>json)
  {
    name=json["name"];
    image=json["image"];
    posts=json["posts"];
    postimage=json["postimage"];
    datetime=json["datetime"];
    uId=json["uId"];
  }
  Map<String,dynamic>tomap()
  {
    return {
      'name':name,
      'image':image,
      'posts':posts,
      'postimage':postimage,
      'datetime':datetime,
      'uId':uId,
    };
  }
}