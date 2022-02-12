part of dnc_flutter_firestore_service;

enum ResponseMessage {
  sendSuccess,
  sendFail,
  updateSuccess,
  updateFail,
  deleteSuccess,
  deleteFail,
  loadSuccess,
  loadFail,
  loadProcess
}

extension ResponseMessageExtension on ResponseMessage {
  String get value {
    return [
      "Message was sent",
      "Message send failed",
      "Message was edited",
      "Message edit failed",
      "Message was deleted",
      "Message delete failed",
      "Message was success to load",
      "Message load failed",
      "Load Message..."
    ][index];
  }
}