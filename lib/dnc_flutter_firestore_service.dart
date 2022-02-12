library dnc_flutter_firestore_service;

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnc_flutter_firestore_service/utils/cap_extension.dart';
import 'package:flutter/widgets.dart';

export 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'
    show
    ListEquality,
    FieldPath,
    Blob,
    GeoPoint,
    Timestamp,
    Source,
    GetOptions,
    SetOptions,
    DocumentChangeType,
    PersistenceSettings,
    Settings;
export 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart'
    show FirebaseException;

part 'services/base_service.dart';
part 'services/user_service.dart';
part 'services/chat_base_service.dart';
part 'models/base_model.dart';
part 'models/chat_model.dart';
part 'constans/response_message.dart';
part 'models/user_model.dart';
part 'services/chat_service.dart';