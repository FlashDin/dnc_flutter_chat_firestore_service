part of dnc_flutter_firestore_service;

class ChatModel extends BaseModel {
  UserModel me;
  UserModel to;
  String message;

  ChatModel({UserModel? me, UserModel? to, this.message = ""})
      : me = me ?? UserModel(),
        to = to ?? UserModel();

  factory ChatModel.fromJson(dynamic map) {
    return ChatModel(
        me: map["me"],
        to: map["to"],
        message: map["message"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "me": me.toJson(),
      "to": to.toJson(),
      "message": message
    };
  }

  @override
  String toString() {
    return 'ChatModel{me: $me, to: $to, message: $message}';
  }
}
