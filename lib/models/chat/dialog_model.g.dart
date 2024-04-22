// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class DialogModelCollectionReference
    implements
        DialogModelQuery,
        FirestoreCollectionReference<DialogModelQuerySnapshot> {
  factory DialogModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$DialogModelCollectionReference;

  static DialogModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return DialogModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    DialogModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  DialogModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<DialogModelDocumentReference> add(DialogModel value);
}

class _$DialogModelCollectionReference extends _$DialogModelQuery
    implements DialogModelCollectionReference {
  factory _$DialogModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$DialogModelCollectionReference._(
      firestore.collection('dialogs').withConverter(
            fromFirestore: DialogModelCollectionReference.fromFirestore,
            toFirestore: DialogModelCollectionReference.toFirestore,
          ),
    );
  }

  _$DialogModelCollectionReference._(
    CollectionReference<DialogModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<DialogModel> get reference =>
      super.reference as CollectionReference<DialogModel>;

  @override
  DialogModelDocumentReference doc([String? id]) {
    return DialogModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<DialogModelDocumentReference> add(DialogModel value) {
    return reference
        .add(value)
        .then((ref) => DialogModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$DialogModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class DialogModelDocumentReference
    extends FirestoreDocumentReference<DialogModelDocumentSnapshot> {
  factory DialogModelDocumentReference(
          DocumentReference<DialogModel> reference) =
      _$DialogModelDocumentReference;

  DocumentReference<DialogModel> get reference;

  /// A reference to the [DialogModelCollectionReference] containing this document.
  DialogModelCollectionReference get parent {
    return _$DialogModelCollectionReference(reference.firestore);
  }

  @override
  Stream<DialogModelDocumentSnapshot> snapshots();

  @override
  Future<DialogModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String id,
    List<OwnersData> ownersData,
    int lastMessageTime,
    String lastMessageText,
    List<String> owners,
  });

  Future<void> set(DialogModel value);
}

class _$DialogModelDocumentReference
    extends FirestoreDocumentReference<DialogModelDocumentSnapshot>
    implements DialogModelDocumentReference {
  _$DialogModelDocumentReference(this.reference);

  @override
  final DocumentReference<DialogModel> reference;

  /// A reference to the [DialogModelCollectionReference] containing this document.
  DialogModelCollectionReference get parent {
    return _$DialogModelCollectionReference(reference.firestore);
  }

  @override
  Stream<DialogModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return DialogModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<DialogModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return DialogModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? id = _sentinel,
    Object? ownersData = _sentinel,
    Object? lastMessageTime = _sentinel,
    Object? lastMessageText = _sentinel,
    Object? owners = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String,
      if (ownersData != _sentinel) "ownersData": ownersData as List<OwnersData>,
      if (lastMessageTime != _sentinel)
        "lastMessageTime": lastMessageTime as int,
      if (lastMessageText != _sentinel)
        "lastMessageText": lastMessageText as String,
      if (owners != _sentinel) "owners": owners as List<String>,
    };

    return reference.update(json);
  }

  Future<void> set(DialogModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is DialogModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class DialogModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  DialogModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<DialogModel> snapshot;

  @override
  DialogModelDocumentReference get reference {
    return DialogModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final DialogModel? data;
}

abstract class DialogModelQuery
    implements QueryReference<DialogModelQuerySnapshot> {
  @override
  DialogModelQuery limit(int limit);

  @override
  DialogModelQuery limitToLast(int limit);

  DialogModelQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  DialogModelQuery whereOwnersData({
    List<OwnersData>? isEqualTo,
    List<OwnersData>? isNotEqualTo,
    List<OwnersData>? isLessThan,
    List<OwnersData>? isLessThanOrEqualTo,
    List<OwnersData>? isGreaterThan,
    List<OwnersData>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<OwnersData>? arrayContainsAny,
  });
  DialogModelQuery whereLastMessageTime({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  DialogModelQuery whereLastMessageText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  DialogModelQuery whereOwners({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });

  DialogModelQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  });

  DialogModelQuery orderByOwnersData({
    bool descending = false,
    List<OwnersData> startAt,
    List<OwnersData> startAfter,
    List<OwnersData> endAt,
    List<OwnersData> endBefore,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  });

  DialogModelQuery orderByLastMessageTime({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  });

  DialogModelQuery orderByLastMessageText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  });

  DialogModelQuery orderByOwners({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  });
}

class _$DialogModelQuery extends QueryReference<DialogModelQuerySnapshot>
    implements DialogModelQuery {
  _$DialogModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<DialogModel> reference;

  DialogModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<DialogModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return DialogModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<DialogModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: DialogModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return DialogModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<DialogModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<DialogModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  DialogModelQuery limit(int limit) {
    return _$DialogModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  DialogModelQuery limitToLast(int limit) {
    return _$DialogModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  DialogModelQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$DialogModelQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DialogModelQuery whereOwnersData({
    List<OwnersData>? isEqualTo,
    List<OwnersData>? isNotEqualTo,
    List<OwnersData>? isLessThan,
    List<OwnersData>? isLessThanOrEqualTo,
    List<OwnersData>? isGreaterThan,
    List<OwnersData>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<OwnersData>? arrayContainsAny,
  }) {
    return _$DialogModelQuery(
      reference.where(
        'ownersData',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  DialogModelQuery whereLastMessageTime({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$DialogModelQuery(
      reference.where(
        'lastMessageTime',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DialogModelQuery whereLastMessageText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$DialogModelQuery(
      reference.where(
        'lastMessageText',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DialogModelQuery whereOwners({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$DialogModelQuery(
      reference.where(
        'owners',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  DialogModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DialogModelQuery(query, _collection);
  }

  DialogModelQuery orderByOwnersData({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('ownersData', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DialogModelQuery(query, _collection);
  }

  DialogModelQuery orderByLastMessageTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastMessageTime', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DialogModelQuery(query, _collection);
  }

  DialogModelQuery orderByLastMessageText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastMessageText', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DialogModelQuery(query, _collection);
  }

  DialogModelQuery orderByOwners({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DialogModelDocumentSnapshot? startAtDocument,
    DialogModelDocumentSnapshot? endAtDocument,
    DialogModelDocumentSnapshot? endBeforeDocument,
    DialogModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('owners', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DialogModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$DialogModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class DialogModelQuerySnapshot
    extends FirestoreQuerySnapshot<DialogModelQueryDocumentSnapshot> {
  DialogModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<DialogModel> snapshot;

  @override
  final List<DialogModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<DialogModelDocumentSnapshot>> docChanges;
}

class DialogModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements DialogModelDocumentSnapshot {
  DialogModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<DialogModel> snapshot;

  @override
  DialogModelDocumentReference get reference {
    return DialogModelDocumentReference(snapshot.reference);
  }

  @override
  final DialogModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogModel _$DialogModelFromJson(Map<String, dynamic> json) => DialogModel(
      id: json['id'] as String,
      ownersData: (json['ownersData'] as List<dynamic>)
          .map((e) => OwnersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessageTime: json['lastMessageTime'] as int,
      lastMessageText: json['lastMessageText'] as String,
      owners:
          (json['owners'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DialogModelToJson(DialogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownersData': instance.ownersData,
      'lastMessageTime': instance.lastMessageTime,
      'lastMessageText': instance.lastMessageText,
      'owners': instance.owners,
    };
