// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_category_entity.dart';

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
abstract class ArticleCategoryEntityCollectionReference
    implements
        ArticleCategoryEntityQuery,
        FirestoreCollectionReference<ArticleCategoryEntityQuerySnapshot> {
  factory ArticleCategoryEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ArticleCategoryEntityCollectionReference;

  static ArticleCategoryEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ArticleCategoryEntityFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ArticleCategoryEntity value,
    SetOptions? options,
  ) {
    return _$ArticleCategoryEntityToJson(value);
  }

  @override
  ArticleCategoryEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ArticleCategoryEntityDocumentReference> add(
      ArticleCategoryEntity value);
}

class _$ArticleCategoryEntityCollectionReference
    extends _$ArticleCategoryEntityQuery
    implements ArticleCategoryEntityCollectionReference {
  factory _$ArticleCategoryEntityCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ArticleCategoryEntityCollectionReference._(
      firestore.collection('article_category').withConverter(
            fromFirestore:
                ArticleCategoryEntityCollectionReference.fromFirestore,
            toFirestore: ArticleCategoryEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$ArticleCategoryEntityCollectionReference._(
    CollectionReference<ArticleCategoryEntity> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<ArticleCategoryEntity> get reference =>
      super.reference as CollectionReference<ArticleCategoryEntity>;

  @override
  ArticleCategoryEntityDocumentReference doc([String? id]) {
    return ArticleCategoryEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ArticleCategoryEntityDocumentReference> add(
      ArticleCategoryEntity value) {
    return reference
        .add(value)
        .then((ref) => ArticleCategoryEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ArticleCategoryEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ArticleCategoryEntityDocumentReference
    extends FirestoreDocumentReference<ArticleCategoryEntityDocumentSnapshot> {
  factory ArticleCategoryEntityDocumentReference(
          DocumentReference<ArticleCategoryEntity> reference) =
      _$ArticleCategoryEntityDocumentReference;

  DocumentReference<ArticleCategoryEntity> get reference;

  /// A reference to the [ArticleCategoryEntityCollectionReference] containing this document.
  ArticleCategoryEntityCollectionReference get parent {
    return _$ArticleCategoryEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<ArticleCategoryEntityDocumentSnapshot> snapshots();

  @override
  Future<ArticleCategoryEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? title,
    String? subtitle,
    String? categoryid,
    String? image,
    int? views,
  });

  Future<void> set(ArticleCategoryEntity value);
}

class _$ArticleCategoryEntityDocumentReference
    extends FirestoreDocumentReference<ArticleCategoryEntityDocumentSnapshot>
    implements ArticleCategoryEntityDocumentReference {
  _$ArticleCategoryEntityDocumentReference(this.reference);

  @override
  final DocumentReference<ArticleCategoryEntity> reference;

  /// A reference to the [ArticleCategoryEntityCollectionReference] containing this document.
  ArticleCategoryEntityCollectionReference get parent {
    return _$ArticleCategoryEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<ArticleCategoryEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ArticleCategoryEntityDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ArticleCategoryEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ArticleCategoryEntityDocumentSnapshot._(
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
    Object? subtitle = _sentinel,
    Object? categoryid = _sentinel,
    Object? image = _sentinel,
    Object? views = _sentinel,
  }) async {
    final json = {
      if (title != _sentinel) "title": title as String?,
      if (subtitle != _sentinel) "subtitle": subtitle as String?,
      if (categoryid != _sentinel) "categoryid": categoryid as String?,
      if (image != _sentinel) "image": image as String?,
      if (views != _sentinel) "views": views as int?,
    };

    return reference.update(json);
  }

  Future<void> set(ArticleCategoryEntity value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleCategoryEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ArticleCategoryEntityDocumentSnapshot extends FirestoreDocumentSnapshot {
  ArticleCategoryEntityDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<ArticleCategoryEntity> snapshot;

  @override
  ArticleCategoryEntityDocumentReference get reference {
    return ArticleCategoryEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ArticleCategoryEntity? data;
}

abstract class ArticleCategoryEntityQuery
    implements QueryReference<ArticleCategoryEntityQuerySnapshot> {
  @override
  ArticleCategoryEntityQuery limit(int limit);

  @override
  ArticleCategoryEntityQuery limitToLast(int limit);

  ArticleCategoryEntityQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ArticleCategoryEntityQuery whereSubtitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ArticleCategoryEntityQuery whereCategoryid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ArticleCategoryEntityQuery whereImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ArticleCategoryEntityQuery whereViews({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });

  ArticleCategoryEntityQuery orderByTitle({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  });

  ArticleCategoryEntityQuery orderBySubtitle({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  });

  ArticleCategoryEntityQuery orderByCategoryid({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  });

  ArticleCategoryEntityQuery orderByImage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  });

  ArticleCategoryEntityQuery orderByViews({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$ArticleCategoryEntityQuery
    extends QueryReference<ArticleCategoryEntityQuerySnapshot>
    implements ArticleCategoryEntityQuery {
  _$ArticleCategoryEntityQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<ArticleCategoryEntity> reference;

  ArticleCategoryEntityQuerySnapshot _decodeSnapshot(
    QuerySnapshot<ArticleCategoryEntity> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ArticleCategoryEntityQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ArticleCategoryEntityDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ArticleCategoryEntityDocumentSnapshot._(
            change.doc, change.doc.data()),
      );
    }).toList();

    return ArticleCategoryEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ArticleCategoryEntityQuerySnapshot> snapshots(
      [SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ArticleCategoryEntityQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ArticleCategoryEntityQuery limit(int limit) {
    return _$ArticleCategoryEntityQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ArticleCategoryEntityQuery limitToLast(int limit) {
    return _$ArticleCategoryEntityQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ArticleCategoryEntityQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ArticleCategoryEntityQuery(
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

  ArticleCategoryEntityQuery whereSubtitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ArticleCategoryEntityQuery(
      reference.where(
        'subtitle',
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

  ArticleCategoryEntityQuery whereCategoryid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ArticleCategoryEntityQuery(
      reference.where(
        'categoryid',
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

  ArticleCategoryEntityQuery whereImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ArticleCategoryEntityQuery(
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

  ArticleCategoryEntityQuery whereViews({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$ArticleCategoryEntityQuery(
      reference.where(
        'views',
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

  ArticleCategoryEntityQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
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

    return _$ArticleCategoryEntityQuery(query, _collection);
  }

  ArticleCategoryEntityQuery orderBySubtitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('subtitle', descending: descending);

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

    return _$ArticleCategoryEntityQuery(query, _collection);
  }

  ArticleCategoryEntityQuery orderByCategoryid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('categoryid', descending: descending);

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

    return _$ArticleCategoryEntityQuery(query, _collection);
  }

  ArticleCategoryEntityQuery orderByImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
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

    return _$ArticleCategoryEntityQuery(query, _collection);
  }

  ArticleCategoryEntityQuery orderByViews({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ArticleCategoryEntityDocumentSnapshot? startAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endAtDocument,
    ArticleCategoryEntityDocumentSnapshot? endBeforeDocument,
    ArticleCategoryEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('views', descending: descending);

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

    return _$ArticleCategoryEntityQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ArticleCategoryEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ArticleCategoryEntityQuerySnapshot
    extends FirestoreQuerySnapshot<ArticleCategoryEntityQueryDocumentSnapshot> {
  ArticleCategoryEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<ArticleCategoryEntity> snapshot;

  @override
  final List<ArticleCategoryEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ArticleCategoryEntityDocumentSnapshot>>
      docChanges;
}

class ArticleCategoryEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements ArticleCategoryEntityDocumentSnapshot {
  ArticleCategoryEntityQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<ArticleCategoryEntity> snapshot;

  @override
  ArticleCategoryEntityDocumentReference get reference {
    return ArticleCategoryEntityDocumentReference(snapshot.reference);
  }

  @override
  final ArticleCategoryEntity data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleCategoryEntity _$ArticleCategoryEntityFromJson(
        Map<String, dynamic> json) =>
    ArticleCategoryEntity()
      ..title = json['title'] as String?
      ..subtitle = json['subtitle'] as String?
      ..categoryid = json['categoryid'] as String?
      ..image = json['image'] as String?
      ..views = json['views'] as int?;

Map<String, dynamic> _$ArticleCategoryEntityToJson(
        ArticleCategoryEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'categoryid': instance.categoryid,
      'image': instance.image,
      'views': instance.views,
    };
