part of dnc_flutter_firestore_service;

class BaseModel {
  String id;
  DateTime createdDate;
  DateTime modifiedDate;

  BaseModel({String? id, DateTime? createdDate, DateTime? modifiedDate})
      : id = id ?? UniqueKey().toString(),
        createdDate = createdDate ?? DateTime.now(),
        modifiedDate = modifiedDate ?? DateTime.now();

  factory BaseModel.fromJson(dynamic map) {
    return BaseModel(
        id: map["id"],
        createdDate: map["createdDate"],
        modifiedDate: map["modifiedDate"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "createdDate": createdDate, "modifiedDate": modifiedDate};
  }

  @override
  String toString() {
    return 'BaseModel{id: $id, createdDate: $createdDate, modifiedDate: $modifiedDate}';
  }
}
