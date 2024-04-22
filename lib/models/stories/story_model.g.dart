// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

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
abstract class StoryModelCollectionReference
    implements
        StoryModelQuery,
        FirestoreCollectionReference<StoryModelQuerySnapshot> {
  factory StoryModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$StoryModelCollectionReference;

  static StoryModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$StoryModelFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    StoryModel value,
    SetOptions? options,
  ) {
    return _$StoryModelToJson(value);
  }

  @override
  StoryModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<StoryModelDocumentReference> add(StoryModel value);
}

class _$StoryModelCollectionReference extends _$StoryModelQuery
    implements StoryModelCollectionReference {
  factory _$StoryModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$StoryModelCollectionReference._(
      firestore.collection('story_model').withConverter(
            fromFirestore: StoryModelCollectionReference.fromFirestore,
            toFirestore: StoryModelCollectionReference.toFirestore,
          ),
    );
  }

  _$StoryModelCollectionReference._(
    CollectionReference<StoryModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<StoryModel> get reference =>
      super.reference as CollectionReference<StoryModel>;

  @override
  StoryModelDocumentReference doc([String? id]) {
    return StoryModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<StoryModelDocumentReference> add(StoryModel value) {
    return reference.add(value).then((ref) => StoryModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$StoryModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class StoryModelDocumentReference
    extends FirestoreDocumentReference<StoryModelDocumentSnapshot> {
  factory StoryModelDocumentReference(DocumentReference<StoryModel> reference) =
      _$StoryModelDocumentReference;

  DocumentReference<StoryModel> get reference;

  /// A reference to the [StoryModelCollectionReference] containing this document.
  StoryModelCollectionReference get parent {
    return _$StoryModelCollectionReference(reference.firestore);
  }

  @override
  Stream<StoryModelDocumentSnapshot> snapshots();

  @override
  Future<StoryModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String url,
    String user,
    String owner,
    int expiry,
  });

  Future<void> set(StoryModel value);
}

class _$StoryModelDocumentReference
    extends FirestoreDocumentReference<StoryModelDocumentSnapshot>
    implements StoryModelDocumentReference {
  _$StoryModelDocumentReference(this.reference);

  @override
  final DocumentReference<StoryModel> reference;

  /// A reference to the [StoryModelCollectionReference] containing this document.
  StoryModelCollectionReference get parent {
    return _$StoryModelCollectionReference(reference.firestore);
  }

  @override
  Stream<StoryModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return StoryModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<StoryModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return StoryModelDocumentSnapshot._(
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
    Object? url = _sentinel,
    Object? user = _sentinel,
    Object? owner = _sentinel,
    Object? expiry = _sentinel,
  }) async {
    final json = {
      if (url != _sentinel) "url": url as String,
      if (user != _sentinel) "user": user as String,
      if (owner != _sentinel) "owner": owner as String,
      if (expiry != _sentinel) "expiry": expiry as int,
    };

    return reference.update(json);
  }

  Future<void> set(StoryModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is StoryModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class StoryModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  StoryModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<StoryModel> snapshot;

  @override
  StoryModelDocumentReference get reference {
    return StoryModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final StoryModel? data;
}

abstract class StoryModelQuery
    implements QueryReference<StoryModelQuerySnapshot> {
  @override
  StoryModelQuery limit(int limit);

  @override
  StoryModelQuery limitToLast(int limit);

  StoryModelQuery whereUrl({
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
  StoryModelQuery whereUser({
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
  StoryModelQuery whereOwner({
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
  StoryModelQuery whereExpiry({
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

  StoryModelQuery orderByUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  });

  StoryModelQuery orderByUser({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  });

  StoryModelQuery orderByOwner({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  });

  StoryModelQuery orderByExpiry({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  });
}

class _$StoryModelQuery extends QueryReference<StoryModelQuerySnapshot>
    implements StoryModelQuery {
  _$StoryModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<StoryModel> reference;

  StoryModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<StoryModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return StoryModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<StoryModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: StoryModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return StoryModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<StoryModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<StoryModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  StoryModelQuery limit(int limit) {
    return _$StoryModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  StoryModelQuery limitToLast(int limit) {
    return _$StoryModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  StoryModelQuery whereUrl({
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
    return _$StoryModelQuery(
      reference.where(
        'url',
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

  StoryModelQuery whereUser({
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
    return _$StoryModelQuery(
      reference.where(
        'user',
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

  StoryModelQuery whereOwner({
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
    return _$StoryModelQuery(
      reference.where(
        'owner',
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

  StoryModelQuery whereExpiry({
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
    return _$StoryModelQuery(
      reference.where(
        'expiry',
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

  StoryModelQuery orderByUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('url', descending: descending);

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

    return _$StoryModelQuery(query, _collection);
  }

  StoryModelQuery orderByUser({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('user', descending: descending);

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

    return _$StoryModelQuery(query, _collection);
  }

  StoryModelQuery orderByOwner({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('owner', descending: descending);

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

    return _$StoryModelQuery(query, _collection);
  }

  StoryModelQuery orderByExpiry({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StoryModelDocumentSnapshot? startAtDocument,
    StoryModelDocumentSnapshot? endAtDocument,
    StoryModelDocumentSnapshot? endBeforeDocument,
    StoryModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('expiry', descending: descending);

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

    return _$StoryModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$StoryModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class StoryModelQuerySnapshot
    extends FirestoreQuerySnapshot<StoryModelQueryDocumentSnapshot> {
  StoryModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<StoryModel> snapshot;

  @override
  final List<StoryModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<StoryModelDocumentSnapshot>> docChanges;
}

class StoryModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements StoryModelDocumentSnapshot {
  StoryModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<StoryModel> snapshot;

  @override
  StoryModelDocumentReference get reference {
    return StoryModelDocumentReference(snapshot.reference);
  }

  @override
  final StoryModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      url: json['url'] as String,
      media: $enumDecode(_$MediaTypeEnumMap, json['media']),
      duration: Duration(microseconds: json['duration'] as int),
      user: json['user'] as String,
      expiry: json['expiry'] as int,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'media': _$MediaTypeEnumMap[instance.media],
      'duration': instance.duration.inMicroseconds,
      'user': instance.user,
      'owner': instance.owner,
      'expiry': instance.expiry,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};
