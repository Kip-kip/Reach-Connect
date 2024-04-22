// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_question.dart';

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
abstract class SurveyQuestionCollectionReference
    implements
        SurveyQuestionQuery,
        FirestoreCollectionReference<SurveyQuestionQuerySnapshot> {
  factory SurveyQuestionCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$SurveyQuestionCollectionReference;

  static SurveyQuestion fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$SurveyQuestionFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    SurveyQuestion value,
    SetOptions? options,
  ) {
    return _$SurveyQuestionToJson(value);
  }

  @override
  SurveyQuestionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<SurveyQuestionDocumentReference> add(SurveyQuestion value);
}

class _$SurveyQuestionCollectionReference extends _$SurveyQuestionQuery
    implements SurveyQuestionCollectionReference {
  factory _$SurveyQuestionCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$SurveyQuestionCollectionReference._(
      firestore.collection('survey_questions').withConverter(
            fromFirestore: SurveyQuestionCollectionReference.fromFirestore,
            toFirestore: SurveyQuestionCollectionReference.toFirestore,
          ),
    );
  }

  _$SurveyQuestionCollectionReference._(
    CollectionReference<SurveyQuestion> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<SurveyQuestion> get reference =>
      super.reference as CollectionReference<SurveyQuestion>;

  @override
  SurveyQuestionDocumentReference doc([String? id]) {
    return SurveyQuestionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<SurveyQuestionDocumentReference> add(SurveyQuestion value) {
    return reference
        .add(value)
        .then((ref) => SurveyQuestionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$SurveyQuestionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class SurveyQuestionDocumentReference
    extends FirestoreDocumentReference<SurveyQuestionDocumentSnapshot> {
  factory SurveyQuestionDocumentReference(
          DocumentReference<SurveyQuestion> reference) =
      _$SurveyQuestionDocumentReference;

  DocumentReference<SurveyQuestion> get reference;

  /// A reference to the [SurveyQuestionCollectionReference] containing this document.
  SurveyQuestionCollectionReference get parent {
    return _$SurveyQuestionCollectionReference(reference.firestore);
  }

  @override
  Stream<SurveyQuestionDocumentSnapshot> snapshots();

  @override
  Future<SurveyQuestionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int? number,
    String? id,
    String? question,
    List<String>? options,
  });

  Future<void> set(SurveyQuestion value);
}

class _$SurveyQuestionDocumentReference
    extends FirestoreDocumentReference<SurveyQuestionDocumentSnapshot>
    implements SurveyQuestionDocumentReference {
  _$SurveyQuestionDocumentReference(this.reference);

  @override
  final DocumentReference<SurveyQuestion> reference;

  /// A reference to the [SurveyQuestionCollectionReference] containing this document.
  SurveyQuestionCollectionReference get parent {
    return _$SurveyQuestionCollectionReference(reference.firestore);
  }

  @override
  Stream<SurveyQuestionDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return SurveyQuestionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<SurveyQuestionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return SurveyQuestionDocumentSnapshot._(
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
    Object? number = _sentinel,
    Object? id = _sentinel,
    Object? question = _sentinel,
    Object? options = _sentinel,
  }) async {
    final json = {
      if (number != _sentinel) "number": number as int?,
      if (id != _sentinel) "id": id as String?,
      if (question != _sentinel) "question": question as String?,
      if (options != _sentinel) "options": options as List<String>?,
    };

    return reference.update(json);
  }

  Future<void> set(SurveyQuestion value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is SurveyQuestionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class SurveyQuestionDocumentSnapshot extends FirestoreDocumentSnapshot {
  SurveyQuestionDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<SurveyQuestion> snapshot;

  @override
  SurveyQuestionDocumentReference get reference {
    return SurveyQuestionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final SurveyQuestion? data;
}

abstract class SurveyQuestionQuery
    implements QueryReference<SurveyQuestionQuerySnapshot> {
  @override
  SurveyQuestionQuery limit(int limit);

  @override
  SurveyQuestionQuery limitToLast(int limit);

  SurveyQuestionQuery whereNumber({
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
  SurveyQuestionQuery whereId({
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
  SurveyQuestionQuery whereQuestion({
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
  SurveyQuestionQuery whereOptions({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });

  SurveyQuestionQuery orderByNumber({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
  });

  SurveyQuestionQuery orderById({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
  });

  SurveyQuestionQuery orderByQuestion({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
  });

  SurveyQuestionQuery orderByOptions({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
  });
}

class _$SurveyQuestionQuery extends QueryReference<SurveyQuestionQuerySnapshot>
    implements SurveyQuestionQuery {
  _$SurveyQuestionQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<SurveyQuestion> reference;

  SurveyQuestionQuerySnapshot _decodeSnapshot(
    QuerySnapshot<SurveyQuestion> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return SurveyQuestionQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<SurveyQuestionDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: SurveyQuestionDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return SurveyQuestionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<SurveyQuestionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<SurveyQuestionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  SurveyQuestionQuery limit(int limit) {
    return _$SurveyQuestionQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  SurveyQuestionQuery limitToLast(int limit) {
    return _$SurveyQuestionQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  SurveyQuestionQuery whereNumber({
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
    return _$SurveyQuestionQuery(
      reference.where(
        'number',
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

  SurveyQuestionQuery whereId({
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
    return _$SurveyQuestionQuery(
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

  SurveyQuestionQuery whereQuestion({
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
    return _$SurveyQuestionQuery(
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

  SurveyQuestionQuery whereOptions({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$SurveyQuestionQuery(
      reference.where(
        'options',
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

  SurveyQuestionQuery orderByNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('number', descending: descending);

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

    return _$SurveyQuestionQuery(query, _collection);
  }

  SurveyQuestionQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
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

    return _$SurveyQuestionQuery(query, _collection);
  }

  SurveyQuestionQuery orderByQuestion({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
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

    return _$SurveyQuestionQuery(query, _collection);
  }

  SurveyQuestionQuery orderByOptions({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SurveyQuestionDocumentSnapshot? startAtDocument,
    SurveyQuestionDocumentSnapshot? endAtDocument,
    SurveyQuestionDocumentSnapshot? endBeforeDocument,
    SurveyQuestionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('options', descending: descending);

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

    return _$SurveyQuestionQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$SurveyQuestionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class SurveyQuestionQuerySnapshot
    extends FirestoreQuerySnapshot<SurveyQuestionQueryDocumentSnapshot> {
  SurveyQuestionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<SurveyQuestion> snapshot;

  @override
  final List<SurveyQuestionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<SurveyQuestionDocumentSnapshot>>
      docChanges;
}

class SurveyQuestionQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements SurveyQuestionDocumentSnapshot {
  SurveyQuestionQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<SurveyQuestion> snapshot;

  @override
  SurveyQuestionDocumentReference get reference {
    return SurveyQuestionDocumentReference(snapshot.reference);
  }

  @override
  final SurveyQuestion data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyQuestion _$SurveyQuestionFromJson(Map<String, dynamic> json) =>
    SurveyQuestion(
      id: json['id'] as String?,
      number: json['number'] as int?,
      question: json['question'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SurveyQuestionToJson(SurveyQuestion instance) =>
    <String, dynamic>{
      'number': instance.number,
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
    };
