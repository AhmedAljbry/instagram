class MessageModle
{

  late String message;
  late String messageimage;
  late String datetime;
  late String sendid;
  late String resaveid;

  MessageModle({

    required this.message,
    required this.messageimage,
    required this.datetime,
    required this.sendid,
    required this.resaveid,
  });
  MessageModle.formjson(Map<String,dynamic>json)
  {
    message=json["message"];
    messageimage=json["messageimage"];
    datetime=json["datetime"];
    sendid=json["sendid"];
    resaveid=json["resaveid"];
  }
  Map<String,dynamic>tomap()
  {
    return {

      'message':message,
      'messageimage':messageimage,
      'datetime':datetime,
      'sendid':sendid,
      'resaveid':resaveid,
    };
  }
}