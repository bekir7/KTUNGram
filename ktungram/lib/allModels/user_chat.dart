import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:KTUNGram/allConstants/constants.dart';

class UserChat {
  String id;
  String photoUrl;
  String nickname;
  String aboutMe;
  String phoneNumber;

  UserChat({
    required this.id,
    required this.aboutMe,
    required this.nickname,
    required this.phoneNumber,
    required this.photoUrl,
  });
  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.phoneNumber: phoneNumber,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    String phoneNumber = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (e) {}
    try {
      phoneNumber = doc.get(FirestoreConstants.phoneNumber);
    } catch (e) {}
    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      nickname: nickname,
      aboutMe: aboutMe,
    );
  }
}
