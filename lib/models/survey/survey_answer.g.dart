// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answer.dart';

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
abstract class SurveyAnswerCollectionReference
    implements
        SurveyAnswerQuery,
        FirestoreCollectionReference<SurveyAnswerQuerySnapshot> {
  factory SurveyAnswerCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$SurveyAnswerCollectionReference;

  static SurveyAnswer fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$SurveyAnswerFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    SurveyAnswer value,
    SetOptions? options,
  ) {
    return _$SurveyAnswerToJson(value);
  }

  @override
  SurveyAnswerDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<SurveyAnswerDocumentReference> add(SurveyAnswer value);
}

class _$SurveyAnswerCollectionReference extends _$SurveyAnswerQuery
    implements SurveyAnswerCollectionReference {
  factory _$SurveyAnswerCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$SurveyAnswerCollectionReference._(
      firestore.collection('survey_answers').withConverter(
            fromFirestore: SurveyAnswerCollectionReference.fromFirestore,
            toFirestore: SurveyAnswerCollectionReference.toFirestore,
          ),
    );
  }

  _$SurveyAnswerCollectionReference._(
    CollectionReference<SurveyAnswer> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<SurveyAnswer> get reference =>
      super.reference as CollectionReference<SurveyAnswer>;

  @override
  SurveyAnswerDocumentReference doc([String? id]) {
    return SurveyAnswerDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<SurveyAnswerDocumentReference> add(SurveyAnswer value) {
    return reference
        .add(value)
        .then((ref) => SurveyAnswerDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$SurveyAnswerCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class SurveyAnswerDocumentReference
    extends FirestoreDocumentReference<SurveyAnswerDocumentSnapshot> {
  factory SurveyAnswerDocumentReference(
          DocumentReference<SurveyAnswer> reference) =
      _$SurveyAnswerDocumentReference;

  DocumentReference<SurveyAnswer> get reference;

  /// A reference to the [SurveyAnswerCollectionReference] containing this document.
  SurveyAnswerCollectionReference get parent {
    return _$SurveyAnswerCollectionReference(reference.firestore);
  }

  @override
  Stream<SurveyAnswerDocumentSnapshot> snapshots();

  @override
  Future<SurveyAnswerDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? email,
    String? question,
    String? answer,
    int? created,
  });

  Future<void> set(SurveyAnswer value);
}

class _$SurveyAnswerDocumentReference
    extends FirestoreDocumentReference<SurveyAnswerDocumentSnapshot>
    implements SurveyAnswerDocumentReference {
  _$SurveyAnswerDocumentReference(this.reference);

  @override
  final DocumentReference<SurveyAnswer> reference;

  /// A reference to the [SurveyAnswerCollectionReference] containing this document.
  SurveyAnswerCollectionReference get parent {
    return _$SurveyAnswerCollectionReference(reference.firestore);
  }

  @override
  Stream<SurveyAnswerDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return SurveyAnswerDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<SurveyAnswerDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return SurveyAnswerDocumentSnapshot._(
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
    Object? email = _sentinel,
    Object? question = _sentinel,
    Object? answer = _sentinel,
    Object? created = _sentinel,
  }) async {
    final json = {
      if (email != _sentinel) "email": email as String?,
      if (question != _sentinel) "question": question as String?,
      if (answer != _sentinel) "answer": answer as String?,
      if (created != _sentinel) "created": created as int?,
    };

    return reference.update(json);
  }

  Future<void> set(SurveyAnswer value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is SurveyAnswerDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class SurveyAnswerDocumentSnapshot extends FirestoreDocumentSnapshot {
  SurveyAnswerDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<SurveyAnswer> snapshot;

  @override
  SurveyAnswerDocumentReference get reference {
    return SurveyAnswerDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final SurveyAnswer? data;
}

abstract class SurveyAnswerQuery
    implements QueryReference<SurveyAnswerQuerySnapshot> {
  @override
  SurveyAnswerQuery limit(int limit);

  @override
  SurveyAnswerQuery limitToLast(int limit);

  SurveyAnswerQuery whereEmail({
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
  SurveyAnswerQuery whereQuestion({
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
  SurveyAnswerQuery whereAnswer({
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
  SurveyAnswerQuery whereCreated({
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

  SurveyAnswerQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  });

  SurveyAnswerQuery orderByQuestion({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  });

  SurveyAnswerQuery orderByAnswer({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  });

  SurveyAnswerQuery orderByCreated({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  });
}

class _$SurveyAnswerQuery extends QueryReference<SurveyAnswerQuerySnapshot>
    implements SurveyAnswerQuery {
  _$SurveyAnswerQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<SurveyAnswer> reference;

  SurveyAnswerQuerySnapshot _decodeSnapshot(
    QuerySnapshot<SurveyAnswer> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return SurveyAnswerQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<SurveyAnswerDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: SurveyAnswerDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return SurveyAnswerQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<SurveyAnswerQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<SurveyAnswerQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  SurveyAnswerQuery limit(int limit) {
    return _$SurveyAnswerQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  SurveyAnswerQuery limitToLast(int limit) {
    return _$SurveyAnswerQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  SurveyAnswerQuery whereEmail({
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
    return _$SurveyAnswerQuery(
      reference.where(
        'email',
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

  SurveyAnswerQuery whereQuestion({
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
    return _$SurveyAnswerQuery(
      reference.where(
        'question',
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

  SurveyAnswerQuery whereAnswer({
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
    return _$SurveyAnswerQuery(
      reference.where(
        'answer',
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

  SurveyAnswerQuery whereCreated({
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
    return _$SurveyAnswerQuery(
      reference.where(
        'created',
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

  SurveyAnswerQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('email', descending: descending);

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

    return _$SurveyAnswerQuery(query, _collection);
  }

  SurveyAnswerQuery orderByQuestion({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('question', descending: descending);

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

    return _$SurveyAnswerQuery(query, _collection);
  }

  SurveyAnswerQuery orderByAnswer({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('answer', descending: descending);

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

    return _$SurveyAnswerQuery(query, _collection);
  }

  SurveyAnswerQuery orderByCreated({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyAnswerDocumentSnapshot? startAtDocument,
    SurveyAnswerDocumentSnapshot? endAtDocument,
    SurveyAnswerDocumentSnapshot? endBeforeDocument,
    SurveyAnswerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('created', descending: descending);

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

    return _$SurveyAnswerQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$SurveyAnswerQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class SurveyAnswerQuerySnapshot
    extends FirestoreQuerySnapshot<SurveyAnswerQueryDocumentSnapshot> {
  SurveyAnswerQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<SurveyAnswer> snapshot;

  @override
  final List<SurveyAnswerQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<SurveyAnswerDocumentSnapshot>> docChanges;
}

class SurveyAnswerQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements SurveyAnswerDocumentSnapshot {
  SurveyAnswerQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<SurveyAnswer> snapshot;

  @override
  SurveyAnswerDocumentReference get reference {
    return SurveyAnswerDocumentReference(snapshot.reference);
  }

  @override
  final SurveyAnswer data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyAnswer _$SurveyAnswerFromJson(Map<String, dynamic> json) => SurveyAnswer(
      email: json['email'] as String?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      created: json['created'] as int?,
    );

Map<String, dynamic> _$SurveyAnswerToJson(SurveyAnswer instance) =>
    <String, dynamic>{
      'email': instance.email,
      'question': instance.question,
      'answer': instance.answer,
      'created': instance.created,
    };
