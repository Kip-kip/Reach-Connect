// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_entity.dart';

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
abstract class TherapistEntityCollectionReference
    implements
        TherapistEntityQuery,
        FirestoreCollectionReference<TherapistEntityQuerySnapshot> {
  factory TherapistEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TherapistEntityCollectionReference;

  static TherapistEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$TherapistEntityFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    TherapistEntity value,
    SetOptions? options,
  ) {
    return _$TherapistEntityToJson(value);
  }

  @override
  TherapistEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TherapistEntityDocumentReference> add(TherapistEntity value);
}

class _$TherapistEntityCollectionReference extends _$TherapistEntityQuery
    implements TherapistEntityCollectionReference {
  factory _$TherapistEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TherapistEntityCollectionReference._(
      firestore.collection('consultant').withConverter(
            fromFirestore: TherapistEntityCollectionReference.fromFirestore,
            toFirestore: TherapistEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$TherapistEntityCollectionReference._(
    CollectionReference<TherapistEntity> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<TherapistEntity> get reference =>
      super.reference as CollectionReference<TherapistEntity>;

  @override
  TherapistEntityDocumentReference doc([String? id]) {
    return TherapistEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TherapistEntityDocumentReference> add(TherapistEntity value) {
    return reference
        .add(value)
        .then((ref) => TherapistEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TherapistEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TherapistEntityDocumentReference
    extends FirestoreDocumentReference<TherapistEntityDocumentSnapshot> {
  factory TherapistEntityDocumentReference(
          DocumentReference<TherapistEntity> reference) =
      _$TherapistEntityDocumentReference;

  DocumentReference<TherapistEntity> get reference;

  /// A reference to the [TherapistEntityCollectionReference] containing this document.
  TherapistEntityCollectionReference get parent {
    return _$TherapistEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<TherapistEntityDocumentSnapshot> snapshots();

  @override
  Future<TherapistEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? bio,
    String? category,
    String? email,
    int? experience,
    String? fullName,
    String? hospital,
    bool? isTherapist,
    bool? online,
    int? patientsSeen,
    int? price,
    String? qualificationDocuments,
    int? review,
    int? status,
    String? specialty,
    int? totalScore,
    int? satisfaction,
    bool? availabilityStatus,
    String? practiceDetails,
  });

  Future<void> set(TherapistEntity value);
}

class _$TherapistEntityDocumentReference
    extends FirestoreDocumentReference<TherapistEntityDocumentSnapshot>
    implements TherapistEntityDocumentReference {
  _$TherapistEntityDocumentReference(this.reference);

  @override
  final DocumentReference<TherapistEntity> reference;

  /// A reference to the [TherapistEntityCollectionReference] containing this document.
  TherapistEntityCollectionReference get parent {
    return _$TherapistEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<TherapistEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TherapistEntityDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TherapistEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TherapistEntityDocumentSnapshot._(
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
    Object? bio = _sentinel,
    Object? category = _sentinel,
    Object? email = _sentinel,
    Object? experience = _sentinel,
    Object? fullName = _sentinel,
    Object? hospital = _sentinel,
    Object? isTherapist = _sentinel,
    Object? online = _sentinel,
    Object? patientsSeen = _sentinel,
    Object? price = _sentinel,
    Object? qualificationDocuments = _sentinel,
    Object? review = _sentinel,
    Object? status = _sentinel,
    Object? specialty = _sentinel,
    Object? totalScore = _sentinel,
    Object? satisfaction = _sentinel,
    Object? availabilityStatus = _sentinel,
    Object? practiceDetails = _sentinel,
  }) async {
    final json = {
      if (bio != _sentinel) "bio": bio as String?,
      if (category != _sentinel) "category": category as String?,
      if (email != _sentinel) "email": email as String?,
      if (experience != _sentinel) "experience": experience as int?,
      if (fullName != _sentinel) "fullName": fullName as String?,
      if (hospital != _sentinel) "hospital": hospital as String?,
      if (isTherapist != _sentinel) "isTherapist": isTherapist as bool?,
      if (online != _sentinel) "online": online as bool?,
      if (patientsSeen != _sentinel) "patientsSeen": patientsSeen as int?,
      if (price != _sentinel) "price": price as int?,
      if (qualificationDocuments != _sentinel)
        "qualificationDocuments": qualificationDocuments as String?,
      if (review != _sentinel) "review": review as int?,
      if (status != _sentinel) "status": status as int?,
      if (specialty != _sentinel) "specialty": specialty as String?,
      if (totalScore != _sentinel) "totalScore": totalScore as int?,
      if (satisfaction != _sentinel) "satisfaction": satisfaction as int?,
      if (availabilityStatus != _sentinel)
        "availabilityStatus": availabilityStatus as bool?,
      if (practiceDetails != _sentinel)
        "practiceDetails": practiceDetails as String?,
    };

    return reference.update(json);
  }

  Future<void> set(TherapistEntity value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TherapistEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TherapistEntityDocumentSnapshot extends FirestoreDocumentSnapshot {
  TherapistEntityDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<TherapistEntity> snapshot;

  @override
  TherapistEntityDocumentReference get reference {
    return TherapistEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final TherapistEntity? data;
}

abstract class TherapistEntityQuery
    implements QueryReference<TherapistEntityQuerySnapshot> {
  @override
  TherapistEntityQuery limit(int limit);

  @override
  TherapistEntityQuery limitToLast(int limit);

  TherapistEntityQuery whereBio({
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
  TherapistEntityQuery whereCategory({
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
  TherapistEntityQuery whereEmail({
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
  TherapistEntityQuery whereExperience({
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
  TherapistEntityQuery whereFullName({
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
  TherapistEntityQuery whereHospital({
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
  TherapistEntityQuery whereIsTherapist({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  TherapistEntityQuery whereOnline({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  TherapistEntityQuery wherePatientsSeen({
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
  TherapistEntityQuery wherePrice({
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
  TherapistEntityQuery whereQualificationDocuments({
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
  TherapistEntityQuery whereReview({
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
  TherapistEntityQuery whereStatus({
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
  TherapistEntityQuery whereSpecialty({
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
  TherapistEntityQuery whereTotalScore({
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
  TherapistEntityQuery whereSatisfaction({
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
  TherapistEntityQuery whereAvailabilityStatus({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  TherapistEntityQuery wherePracticeDetails({
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

  TherapistEntityQuery orderByBio({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByCategory({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByExperience({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByFullName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByHospital({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByIsTherapist({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByOnline({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByPatientsSeen({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByPrice({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByQualificationDocuments({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByReview({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByStatus({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderBySpecialty({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByTotalScore({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderBySatisfaction({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByAvailabilityStatus({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });

  TherapistEntityQuery orderByPracticeDetails({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$TherapistEntityQuery
    extends QueryReference<TherapistEntityQuerySnapshot>
    implements TherapistEntityQuery {
  _$TherapistEntityQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<TherapistEntity> reference;

  TherapistEntityQuerySnapshot _decodeSnapshot(
    QuerySnapshot<TherapistEntity> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TherapistEntityQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TherapistEntityDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TherapistEntityDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TherapistEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TherapistEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TherapistEntityQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TherapistEntityQuery limit(int limit) {
    return _$TherapistEntityQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TherapistEntityQuery limitToLast(int limit) {
    return _$TherapistEntityQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TherapistEntityQuery whereBio({
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
    return _$TherapistEntityQuery(
      reference.where(
        'bio',
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

  TherapistEntityQuery whereCategory({
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
    return _$TherapistEntityQuery(
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

  TherapistEntityQuery whereEmail({
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
    return _$TherapistEntityQuery(
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

  TherapistEntityQuery whereExperience({
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
    return _$TherapistEntityQuery(
      reference.where(
        'experience',
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

  TherapistEntityQuery whereFullName({
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
    return _$TherapistEntityQuery(
      reference.where(
        'fullName',
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

  TherapistEntityQuery whereHospital({
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
    return _$TherapistEntityQuery(
      reference.where(
        'hospital',
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

  TherapistEntityQuery whereIsTherapist({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$TherapistEntityQuery(
      reference.where(
        'isTherapist',
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

  TherapistEntityQuery whereOnline({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$TherapistEntityQuery(
      reference.where(
        'online',
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

  TherapistEntityQuery wherePatientsSeen({
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
    return _$TherapistEntityQuery(
      reference.where(
        'patientsSeen',
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

  TherapistEntityQuery wherePrice({
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
    return _$TherapistEntityQuery(
      reference.where(
        'price',
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

  TherapistEntityQuery whereQualificationDocuments({
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
    return _$TherapistEntityQuery(
      reference.where(
        'qualificationDocuments',
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

  TherapistEntityQuery whereReview({
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
    return _$TherapistEntityQuery(
      reference.where(
        'review',
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

  TherapistEntityQuery whereStatus({
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
    return _$TherapistEntityQuery(
      reference.where(
        'status',
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

  TherapistEntityQuery whereSpecialty({
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
    return _$TherapistEntityQuery(
      reference.where(
        'specialty',
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

  TherapistEntityQuery whereTotalScore({
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
    return _$TherapistEntityQuery(
      reference.where(
        'totalScore',
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

  TherapistEntityQuery whereSatisfaction({
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
    return _$TherapistEntityQuery(
      reference.where(
        'satisfaction',
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

  TherapistEntityQuery whereAvailabilityStatus({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$TherapistEntityQuery(
      reference.where(
        'availabilityStatus',
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

  TherapistEntityQuery wherePracticeDetails({
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
    return _$TherapistEntityQuery(
      reference.where(
        'practiceDetails',
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

  TherapistEntityQuery orderByBio({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('bio', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByCategory({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByExperience({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('experience', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByFullName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('fullName', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByHospital({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('hospital', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByIsTherapist({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isTherapist', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByOnline({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('online', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByPatientsSeen({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('patientsSeen', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('price', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByQualificationDocuments({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy('qualificationDocuments', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByReview({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('review', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('status', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderBySpecialty({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('specialty', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByTotalScore({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('totalScore', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderBySatisfaction({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('satisfaction', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByAvailabilityStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('availabilityStatus', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  TherapistEntityQuery orderByPracticeDetails({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TherapistEntityDocumentSnapshot? startAtDocument,
    TherapistEntityDocumentSnapshot? endAtDocument,
    TherapistEntityDocumentSnapshot? endBeforeDocument,
    TherapistEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('practiceDetails', descending: descending);

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

    return _$TherapistEntityQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TherapistEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TherapistEntityQuerySnapshot
    extends FirestoreQuerySnapshot<TherapistEntityQueryDocumentSnapshot> {
  TherapistEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<TherapistEntity> snapshot;

  @override
  final List<TherapistEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TherapistEntityDocumentSnapshot>>
      docChanges;
}

class TherapistEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements TherapistEntityDocumentSnapshot {
  TherapistEntityQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<TherapistEntity> snapshot;

  @override
  TherapistEntityDocumentReference get reference {
    return TherapistEntityDocumentReference(snapshot.reference);
  }

  @override
  final TherapistEntity data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistEntity _$TherapistEntityFromJson(Map<String, dynamic> json) =>
    TherapistEntity(
      bio: json['bio'] as String?,
      category: json['category'] as String?,
      email: json['email'] as String?,
      experience: json['experience'] as int?,
      fullName: json['fullName'] as String?,
      hospital: json['hospital'] as String?,
      isTherapist: json['isTherapist'] as bool?,
      online: json['online'] as bool?,
      patientsSeen: json['patientsSeen'] as int?,
      price: json['price'] as int?,
      qualificationDocuments: json['qualificationDocuments'] as String?,
      review: json['review'] as int?,
      status: json['status'] as int?,
      specialty: json['specialty'] as String?,
      totalScore: json['totalScore'] as int?,
      satisfaction: json['satisfaction'] as int?,
      availabilityStatus: json['availabilityStatus'] as bool?,
      practiceDetails: json['practiceDetails'] as String?,
    );

Map<String, dynamic> _$TherapistEntityToJson(TherapistEntity instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'category': instance.category,
      'email': instance.email,
      'experience': instance.experience,
      'fullName': instance.fullName,
      'hospital': instance.hospital,
      'isTherapist': instance.isTherapist,
      'online': instance.online,
      'patientsSeen': instance.patientsSeen,
      'price': instance.price,
      'qualificationDocuments': instance.qualificationDocuments,
      'review': instance.review,
      'status': instance.status,
      'specialty': instance.specialty,
      'totalScore': instance.totalScore,
      'satisfaction': instance.satisfaction,
      'availabilityStatus': instance.availabilityStatus,
      'practiceDetails': instance.practiceDetails,
    };
