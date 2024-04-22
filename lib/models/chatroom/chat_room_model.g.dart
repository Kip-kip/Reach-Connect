// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

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
abstract class ChatRoomModelCollectionReference
    implements
        ChatRoomModelQuery,
        FirestoreCollectionReference<ChatRoomModelQuerySnapshot> {
  factory ChatRoomModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ChatRoomModelCollectionReference;

  static ChatRoomModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ChatRoomModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ChatRoomModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  ChatRoomModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ChatRoomModelDocumentReference> add(ChatRoomModel value);
}

class _$ChatRoomModelCollectionReference extends _$ChatRoomModelQuery
    implements ChatRoomModelCollectionReference {
  factory _$ChatRoomModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ChatRoomModelCollectionReference._(
      firestore.collection('chatroom').withConverter(
            fromFirestore: ChatRoomModelCollectionReference.fromFirestore,
            toFirestore: ChatRoomModelCollectionReference.toFirestore,
          ),
    );
  }

  _$ChatRoomModelCollectionReference._(
    CollectionReference<ChatRoomModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<ChatRoomModel> get reference =>
      super.reference as CollectionReference<ChatRoomModel>;

  @override
  ChatRoomModelDocumentReference doc([String? id]) {
    return ChatRoomModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ChatRoomModelDocumentReference> add(ChatRoomModel value) {
    return reference
        .add(value)
        .then((ref) => ChatRoomModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChatRoomModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ChatRoomModelDocumentReference
    extends FirestoreDocumentReference<ChatRoomModelDocumentSnapshot> {
  factory ChatRoomModelDocumentReference(
          DocumentReference<ChatRoomModel> reference) =
      _$ChatRoomModelDocumentReference;

  DocumentReference<ChatRoomModel> get reference;

  /// A reference to the [ChatRoomModelCollectionReference] containing this document.
  ChatRoomModelCollectionReference get parent {
    return _$ChatRoomModelCollectionReference(reference.firestore);
  }

  @override
  Stream<ChatRoomModelDocumentSnapshot> snapshots();

  @override
  Future<ChatRoomModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String postId,
    String category,
    String text,
    String createdAt,
    String ownerId,
    String mood,
    String image,
    List<String> comments,
  });

  Future<void> set(ChatRoomModel value);
}

class _$ChatRoomModelDocumentReference
    extends FirestoreDocumentReference<ChatRoomModelDocumentSnapshot>
    implements ChatRoomModelDocumentReference {
  _$ChatRoomModelDocumentReference(this.reference);

  @override
  final DocumentReference<ChatRoomModel> reference;

  /// A reference to the [ChatRoomModelCollectionReference] containing this document.
  ChatRoomModelCollectionReference get parent {
    return _$ChatRoomModelCollectionReference(reference.firestore);
  }

  @override
  Stream<ChatRoomModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ChatRoomModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ChatRoomModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ChatRoomModelDocumentSnapshot._(
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
    Object? title = _sentinel,
    Object? postId = _sentinel,
    Object? category = _sentinel,
    Object? text = _sentinel,
    Object? createdAt = _sentinel,
    Object? ownerId = _sentinel,
    Object? mood = _sentinel,
    Object? image = _sentinel,
    Object? comments = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (postId != _sentinel) "postId": postId as String,
      if (category != _sentinel) "category": category as String,
      if (text != _sentinel) "text": text as String,
      if (createdAt != _sentinel) "createdAt": createdAt as String,
      if (ownerId != _sentinel) "ownerId": ownerId as String,
      if (mood != _sentinel) "mood": mood as String,
      if (image != _sentinel) "image": image as String,
      if (comments != _sentinel) "comments": comments as List<String>,
    };

    return reference.update(json);
  }

  Future<void> set(ChatRoomModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatRoomModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ChatRoomModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  ChatRoomModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<ChatRoomModel> snapshot;

  @override
  ChatRoomModelDocumentReference get reference {
    return ChatRoomModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ChatRoomModel? data;
}

abstract class ChatRoomModelQuery
    implements QueryReference<ChatRoomModelQuerySnapshot> {
  @override
  ChatRoomModelQuery limit(int limit);

  @override
  ChatRoomModelQuery limitToLast(int limit);

  ChatRoomModelQuery whereTitle({
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
  ChatRoomModelQuery wherePostId({
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
  ChatRoomModelQuery whereCategory({
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
  ChatRoomModelQuery whereText({
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
  ChatRoomModelQuery whereCreatedAt({
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
  ChatRoomModelQuery whereOwnerId({
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
  ChatRoomModelQuery whereMood({
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
  ChatRoomModelQuery whereImage({
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
  ChatRoomModelQuery whereComments({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });

  ChatRoomModelQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByPostId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByCategory({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByCreatedAt({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByMood({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByImage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });

  ChatRoomModelQuery orderByComments({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  });
}

class _$ChatRoomModelQuery extends QueryReference<ChatRoomModelQuerySnapshot>
    implements ChatRoomModelQuery {
  _$ChatRoomModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<ChatRoomModel> reference;

  ChatRoomModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<ChatRoomModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ChatRoomModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ChatRoomModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ChatRoomModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ChatRoomModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ChatRoomModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ChatRoomModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ChatRoomModelQuery limit(int limit) {
    return _$ChatRoomModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ChatRoomModelQuery limitToLast(int limit) {
    return _$ChatRoomModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ChatRoomModelQuery whereTitle({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'title',
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

  ChatRoomModelQuery wherePostId({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'postId',
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

  ChatRoomModelQuery whereCategory({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'category',
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

  ChatRoomModelQuery whereText({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'text',
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

  ChatRoomModelQuery whereCreatedAt({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'createdAt',
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

  ChatRoomModelQuery whereOwnerId({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'ownerId',
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

  ChatRoomModelQuery whereMood({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'mood',
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

  ChatRoomModelQuery whereImage({
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
    return _$ChatRoomModelQuery(
      reference.where(
        'image',
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

  ChatRoomModelQuery whereComments({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$ChatRoomModelQuery(
      reference.where(
        'comments',
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

  ChatRoomModelQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('title', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByPostId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('postId', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByCategory({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('category', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('text', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('createdAt', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('ownerId', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByMood({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('mood', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('image', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  ChatRoomModelQuery orderByComments({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomModelDocumentSnapshot? startAtDocument,
    ChatRoomModelDocumentSnapshot? endAtDocument,
    ChatRoomModelDocumentSnapshot? endBeforeDocument,
    ChatRoomModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('comments', descending: descending);

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

    return _$ChatRoomModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChatRoomModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ChatRoomModelQuerySnapshot
    extends FirestoreQuerySnapshot<ChatRoomModelQueryDocumentSnapshot> {
  ChatRoomModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<ChatRoomModel> snapshot;

  @override
  final List<ChatRoomModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ChatRoomModelDocumentSnapshot>> docChanges;
}

class ChatRoomModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ChatRoomModelDocumentSnapshot {
  ChatRoomModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<ChatRoomModel> snapshot;

  @override
  ChatRoomModelDocumentReference get reference {
    return ChatRoomModelDocumentReference(snapshot.reference);
  }

  @override
  final ChatRoomModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      postId: json['postId'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      category: json['category'] as String? ?? "",
      createdAt: json['createdAt'] as String,
      ownerId: json['ownerId'] as String,
      mood: json['mood'] as String,
      image: json['image'] as String,
    )..comments =
        (json['comments'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'postId': instance.postId,
      'category': instance.category,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'ownerId': instance.ownerId,
      'mood': instance.mood,
      'image': instance.image,
      'comments': instance.comments,
    };
