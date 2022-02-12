part of dnc_flutter_firestore_service;

class ChatService {

  final ChatBaseService _chatBaseService = ChatBaseService();

  Stream<List<ChatModel>> loadAsStream(bool first, List<DocumentSnapshot> prevDoc,
      {int size = 10, String sort = "id", String direction = "asc"}) {
    return _chatBaseService.findAllAsStream(first, prevDoc, size: size, sort: sort, direction: direction);
  }

  Future<List<ChatModel>> loadAsList(bool first, List<DocumentSnapshot> prevDoc,
      {int size = 10, String sort = "id", String direction = "asc"}) async {
    return _chatBaseService.findAllAsList(first, prevDoc, size: size, sort: sort, direction: direction);
  }

  Future<dynamic> send(ChatModel model) async {
    return await _chatBaseService.save(model);
  }

  Future<dynamic> edit(ChatModel model, String id) async {
    return await _chatBaseService.update(model, id);
  }

  Future<dynamic> delete(String id) async {
    return await delete(id);
  }

}