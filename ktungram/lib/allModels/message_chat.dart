import 'package:KTUNGram/allConstants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageChat {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });
  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: this.idFrom,
      FirestoreConstants.idTo: this.idTo,
      FirestoreConstants.timestamp: this.timestamp,
      FirestoreConstants.type: this.type,
      FirestoreConstants.content: this.content,
    };
  }

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(FirestoreConstants.idFrom);
    String idTo = doc.get(FirestoreConstants.idTo);
    String timestamp = doc.get(FirestoreConstants.timestamp);
    String content = doc.get(FirestoreConstants.content);
    int type = doc.get(FirestoreConstants.type);

    return MessageChat(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}
