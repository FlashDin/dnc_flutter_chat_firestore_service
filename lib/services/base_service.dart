part of dnc_flutter_firestore_service;

abstract class BaseService<D, ID> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collection;

  BaseService({String? collection})
      : collection = collection ?? (D).toString().toUnderscore.toLowerCase();

  Map<String, Object> getMap(D model);

  D getModel(Map<String, Object> map);

  List<D> getModels(List<dynamic> map);

  Query<Object?> _getList(bool first, List<DocumentSnapshot> prevDoc, int size,
      String sort, String direction) {
    CollectionReference collectionReference = firestore.collection(collection);
    Query query = collectionReference
        .orderBy(sort, descending: direction != 'asc')
        .limit(size);
    return first
        ? query
        : query.startAfterDocument(prevDoc[prevDoc.length - 1]);
  }

  Stream<List<D>> findAllAsStream(bool first, List<DocumentSnapshot> prevDoc,
      {int size = 10, String sort = "id", String direction = "asc"}) {
    Query query = _getList(first, prevDoc, size, sort, direction);
    return query
        .snapshots()
        .map((t) => getModels(t.docs.map((e) => e.data()).toList()));
  }

  Future<List<D>> findAllAsList(bool first, List<DocumentSnapshot> prevDoc,
      {int size = 10, String sort = "id", String direction = "asc"}) async {
    QuerySnapshot query =
        await _getList(first, prevDoc, size, sort, direction).get();
    return getModels(query.docs.map((e) => e.data()).toList());
  }

  Future<dynamic> save(D model) {
    String m = jsonEncode(model);
    CollectionReference collectionReference = firestore.collection(collection);
    return collectionReference
        .add(jsonDecode(m))
        .then((value) => ResponseMessage.sendSuccess.value)
        .catchError((error) {
      print(error);
      return ResponseMessage.sendFail.value;
    });
  }

  Future<dynamic> update(D model, ID id) {
    String m = jsonEncode(model);
    CollectionReference collectionReference = firestore.collection(collection);
    return collectionReference
        .doc(id.toString())
        .update(jsonDecode(m))
        .then((value) => ResponseMessage.updateSuccess.value)
        .catchError((error) {
      print(error);
      return ResponseMessage.updateFail.value;
    });
  }

  Future<dynamic> delete(ID id) {
    CollectionReference collectionReference = firestore.collection(collection);
    return collectionReference
        .doc(id.toString())
        .delete()
        .then((value) => ResponseMessage.deleteSuccess.value)
        .catchError((error) {
      print(error);
      return ResponseMessage.deleteFail.value;
    });
  }
}
