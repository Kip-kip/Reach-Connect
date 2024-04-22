// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability.dart';

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
abstract class AvailabilityCollectionReference
    implements
        AvailabilityQuery,
        FirestoreCollectionReference<AvailabilityQuerySnapshot> {
  factory AvailabilityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AvailabilityCollectionReference;

  static Availability fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$AvailabilityFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Availability value,
    SetOptions? options,
  ) {
    return _$AvailabilityToJson(value);
  }

  @override
  AvailabilityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AvailabilityDocumentReference> add(Availability value);
}

class _$AvailabilityCollectionReference extends _$AvailabilityQuery
    implements AvailabilityCollectionReference {
  factory _$AvailabilityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AvailabilityCollectionReference._(
      firestore.collection('availability').withConverter(
            fromFirestore: AvailabilityCollectionReference.fromFirestore,
            toFirestore: AvailabilityCollectionReference.toFirestore,
          ),
    );
  }

  _$AvailabilityCollectionReference._(
    CollectionReference<Availability> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Availability> get reference =>
      super.reference as CollectionReference<Availability>;

  @override
  AvailabilityDocumentReference doc([String? id]) {
    return AvailabilityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AvailabilityDocumentReference> add(Availability value) {
    return reference
        .add(value)
        .then((ref) => AvailabilityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AvailabilityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AvailabilityDocumentReference
    extends FirestoreDocumentReference<AvailabilityDocumentSnapshot> {
  factory AvailabilityDocumentReference(
          DocumentReference<Availability> reference) =
      _$AvailabilityDocumentReference;

  DocumentReference<Availability> get reference;

  /// A reference to the [AvailabilityCollectionReference] containing this document.
  AvailabilityCollectionReference get parent {
    return _$AvailabilityCollectionReference(reference.firestore);
  }

  @override
  Stream<AvailabilityDocumentSnapshot> snapshots();

  @override
  Future<AvailabilityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? email,
    int? day,
    int? slotDuration,
    List<int>? morningSlots,
    List<int>? midDaySlots,
    List<int>? eveningSlots,
  });

  Future<void> set(Availability value);
}

class _$AvailabilityDocumentReference
    extends FirestoreDocumentReference<AvailabilityDocumentSnapshot>
    implements AvailabilityDocumentReference {
  _$AvailabilityDocumentReference(this.reference);

  @override
  final DocumentReference<Availability> reference;

  /// A reference to the [AvailabilityCollectionReference] containing this document.
  AvailabilityCollectionReference get parent {
    return _$AvailabilityCollectionReference(reference.firestore);
  }

  @override
  Stream<AvailabilityDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AvailabilityDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AvailabilityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AvailabilityDocumentSnapshot._(
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
    Object? day = _sentinel,
    Object? slotDuration = _sentinel,
    Object? morningSlots = _sentinel,
    Object? midDaySlots = _sentinel,
    Object? eveningSlots = _sentinel,
  }) async {
    final json = {
      if (email != _sentinel) "email": email as String?,
      if (day != _sentinel) "day": day as int?,
      if (slotDuration != _sentinel) "slotDuration": slotDuration as int?,
      if (morningSlots != _sentinel) "morningSlots": morningSlots as List<int>?,
      if (midDaySlots != _sentinel) "midDaySlots": midDaySlots as List<int>?,
      if (eveningSlots != _sentinel) "eveningSlots": eveningSlots as List<int>?,
    };

    return reference.update(json);
  }

  Future<void> set(Availability value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailabilityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AvailabilityDocumentSnapshot extends FirestoreDocumentSnapshot {
  AvailabilityDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Availability> snapshot;

  @override
  AvailabilityDocumentReference get reference {
    return AvailabilityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Availability? data;
}

abstract class AvailabilityQuery
    implements QueryReference<AvailabilityQuerySnapshot> {
  @override
  AvailabilityQuery limit(int limit);

  @override
  AvailabilityQuery limitToLast(int limit);

  AvailabilityQuery whereEmail({
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
  AvailabilityQuery whereDay({
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
  AvailabilityQuery whereSlotDuration({
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
  AvailabilityQuery whereMorningSlots({
    List<int>? isEqualTo,
    List<int>? isNotEqualTo,
    List<int>? isLessThan,
    List<int>? isLessThanOrEqualTo,
    List<int>? isGreaterThan,
    List<int>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? arrayContainsAny,
  });
  AvailabilityQuery whereMidDaySlots({
    List<int>? isEqualTo,
    List<int>? isNotEqualTo,
    List<int>? isLessThan,
    List<int>? isLessThanOrEqualTo,
    List<int>? isGreaterThan,
    List<int>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? arrayContainsAny,
  });
  AvailabilityQuery whereEveningSlots({
    List<int>? isEqualTo,
    List<int>? isNotEqualTo,
    List<int>? isLessThan,
    List<int>? isLessThanOrEqualTo,
    List<int>? isGreaterThan,
    List<int>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? arrayContainsAny,
  });

  AvailabilityQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  });

  AvailabilityQuery orderByDay({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  });

  AvailabilityQuery orderBySlotDuration({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  });

  AvailabilityQuery orderByMorningSlots({
    bool descending = false,
    List<int>? startAt,
    List<int>? startAfter,
    List<int>? endAt,
    List<int>? endBefore,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  });

  AvailabilityQuery orderByMidDaySlots({
    bool descending = false,
    List<int>? startAt,
    List<int>? startAfter,
    List<int>? endAt,
    List<int>? endBefore,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  });

  AvailabilityQuery orderByEveningSlots({
    bool descending = false,
    List<int>? startAt,
    List<int>? startAfter,
    List<int>? endAt,
    List<int>? endBefore,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  });
}

class _$AvailabilityQuery extends QueryReference<AvailabilityQuerySnapshot>
    implements AvailabilityQuery {
  _$AvailabilityQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Availability> reference;

  AvailabilityQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Availability> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AvailabilityQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AvailabilityDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AvailabilityDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AvailabilityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AvailabilityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AvailabilityQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AvailabilityQuery limit(int limit) {
    return _$AvailabilityQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AvailabilityQuery limitToLast(int limit) {
    return _$AvailabilityQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AvailabilityQuery whereEmail({
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
    return _$AvailabilityQuery(
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

  AvailabilityQuery whereDay({
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
    return _$AvailabilityQuery(
      reference.where(
        'day',
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

  AvailabilityQuery whereSlotDuration({
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
    return _$AvailabilityQuery(
      reference.where(
        'slotDuration',
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

  AvailabilityQuery whereMorningSlots({
    List<int>? isEqualTo,
    List<int>? isNotEqualTo,
    List<int>? isLessThan,
    List<int>? isLessThanOrEqualTo,
    List<int>? isGreaterThan,
    List<int>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? arrayContainsAny,
  }) {
    return _$AvailabilityQuery(
      reference.where(
        'morningSlots',
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

  AvailabilityQuery whereMidDaySlots({
    List<int>? isEqualTo,
    List<int>? isNotEqualTo,
    List<int>? isLessThan,
    List<int>? isLessThanOrEqualTo,
    List<int>? isGreaterThan,
    List<int>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? arrayContainsAny,
  }) {
    return _$AvailabilityQuery(
      reference.where(
        'midDaySlots',
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

  AvailabilityQuery whereEveningSlots({
    List<int>? isEqualTo,
    List<int>? isNotEqualTo,
    List<int>? isLessThan,
    List<int>? isLessThanOrEqualTo,
    List<int>? isGreaterThan,
    List<int>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? arrayContainsAny,
  }) {
    return _$AvailabilityQuery(
      reference.where(
        'eveningSlots',
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

  AvailabilityQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
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

    return _$AvailabilityQuery(query, _collection);
  }

  AvailabilityQuery orderByDay({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('day', descending: descending);

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

    return _$AvailabilityQuery(query, _collection);
  }

  AvailabilityQuery orderBySlotDuration({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('slotDuration', descending: descending);

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

    return _$AvailabilityQuery(query, _collection);
  }

  AvailabilityQuery orderByMorningSlots({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('morningSlots', descending: descending);

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

    return _$AvailabilityQuery(query, _collection);
  }

  AvailabilityQuery orderByMidDaySlots({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('midDaySlots', descending: descending);

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

    return _$AvailabilityQuery(query, _collection);
  }

  AvailabilityQuery orderByEveningSlots({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AvailabilityDocumentSnapshot? startAtDocument,
    AvailabilityDocumentSnapshot? endAtDocument,
    AvailabilityDocumentSnapshot? endBeforeDocument,
    AvailabilityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('eveningSlots', descending: descending);

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

    return _$AvailabilityQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AvailabilityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AvailabilityQuerySnapshot
    extends FirestoreQuerySnapshot<AvailabilityQueryDocumentSnapshot> {
  AvailabilityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Availability> snapshot;

  @override
  final List<AvailabilityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AvailabilityDocumentSnapshot>> docChanges;
}

class AvailabilityQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements AvailabilityDocumentSnapshot {
  AvailabilityQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Availability> snapshot;

  @override
  AvailabilityDocumentReference get reference {
    return AvailabilityDocumentReference(snapshot.reference);
  }

  @override
  final Availability data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
      email: json['email'] as String?,
      day: json['day'] as int?,
      slotDuration: json['slotDuration'] as int?,
      morningSlots: (json['morningSlots'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      midDaySlots: (json['midDaySlots'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      eveningSlots: (json['eveningSlots'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'email': instance.email,
      'day': instance.day,
      'slotDuration': instance.slotDuration,
      'morningSlots': instance.morningSlots,
      'midDaySlots': instance.midDaySlots,
      'eveningSlots': instance.eveningSlots,
    };
