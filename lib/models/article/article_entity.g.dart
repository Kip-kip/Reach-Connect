// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

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
abstract class PostCollectionReference
    implements PostQuery, FirestoreCollectionReference<PostQuerySnapshot> {
  factory PostCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PostCollectionReference;

  static Post fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Post.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Post value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  PostDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PostDocumentReference> add(Post value);
}

class _$PostCollectionReference extends _$PostQuery
    implements PostCollectionReference {
  factory _$PostCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PostCollectionReference._(
      firestore.collection('articles').withConverter(
            fromFirestore: PostCollectionReference.fromFirestore,
            toFirestore: PostCollectionReference.toFirestore,
          ),
    );
  }

  _$PostCollectionReference._(
    CollectionReference<Post> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Post> get reference =>
      super.reference as CollectionReference<Post>;

  @override
  PostDocumentReference doc([String? id]) {
    return PostDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PostDocumentReference> add(Post value) {
    return reference.add(value).then((ref) => PostDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PostDocumentReference
    extends FirestoreDocumentReference<PostDocumentSnapshot> {
  factory PostDocumentReference(DocumentReference<Post> reference) =
      _$PostDocumentReference;

  DocumentReference<Post> get reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  @override
  Stream<PostDocumentSnapshot> snapshots();

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String title,
    String postId,
    String text,
    String createdAt,
    String ownerId,
    String mood,
    String image,
    String authorName,
    String avatar,
  });

  Future<void> set(Post value);
}

class _$PostDocumentReference
    extends FirestoreDocumentReference<PostDocumentSnapshot>
    implements PostDocumentReference {
  _$PostDocumentReference(this.reference);

  @override
  final DocumentReference<Post> reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  @override
  Stream<PostDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return PostDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return PostDocumentSnapshot._(
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
    Object? text = _sentinel,
    Object? createdAt = _sentinel,
    Object? ownerId = _sentinel,
    Object? mood = _sentinel,
    Object? image = _sentinel,
    Object? authorName = _sentinel,
    Object? avatar = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String,
      if (postId != _sentinel) "postId": postId as String,
      if (text != _sentinel) "text": text as String,
      if (createdAt != _sentinel) "createdAt": createdAt as String,
      if (ownerId != _sentinel) "ownerId": ownerId as String,
      if (mood != _sentinel) "mood": mood as String,
      if (image != _sentinel) "image": image as String,
      if (authorName != _sentinel) "authorName": authorName as String,
      if (avatar != _sentinel) "avatar": avatar as String,
    };

    return reference.update(json);
  }

  Future<void> set(Post value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class PostDocumentSnapshot extends FirestoreDocumentSnapshot {
  PostDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Post? data;
}

abstract class PostQuery implements QueryReference<PostQuerySnapshot> {
  @override
  PostQuery limit(int limit);

  @override
  PostQuery limitToLast(int limit);

  PostQuery whereTitle({
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
  PostQuery wherePostId({
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
  PostQuery whereText({
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
  PostQuery whereCreatedAt({
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
  PostQuery whereOwnerId({
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
  PostQuery whereMood({
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
  PostQuery whereImage({
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
  PostQuery whereAuthorName({
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
  PostQuery whereAvatar({
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

  PostQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByPostId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByCreatedAt({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByMood({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByImage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByAuthorName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByAvatar({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });
}

class _$PostQuery extends QueryReference<PostQuerySnapshot>
    implements PostQuery {
  _$PostQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Post> reference;

  PostQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Post> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return PostQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<PostDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: PostDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return PostQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<PostQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<PostQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  PostQuery limit(int limit) {
    return _$PostQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  PostQuery limitToLast(int limit) {
    return _$PostQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  PostQuery whereTitle({
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
    return _$PostQuery(
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

  PostQuery wherePostId({
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
    return _$PostQuery(
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

  PostQuery whereText({
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
    return _$PostQuery(
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

  PostQuery whereCreatedAt({
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
    return _$PostQuery(
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

  PostQuery whereOwnerId({
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
    return _$PostQuery(
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

  PostQuery whereMood({
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
    return _$PostQuery(
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

  PostQuery whereImage({
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
    return _$PostQuery(
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

  PostQuery whereAuthorName({
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
    return _$PostQuery(
      reference.where(
        'authorName',
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

  PostQuery whereAvatar({
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
    return _$PostQuery(
      reference.where(
        'avatar',
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

  PostQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByPostId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByMood({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByAuthorName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('authorName', descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByAvatar({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('avatar', descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PostQuerySnapshot
    extends FirestoreQuerySnapshot<PostQueryDocumentSnapshot> {
  PostQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Post> snapshot;

  @override
  final List<PostQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PostDocumentSnapshot>> docChanges;
}

class PostQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements PostDocumentSnapshot {
  PostQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(snapshot.reference);
  }

  @override
  final Post data;
}
