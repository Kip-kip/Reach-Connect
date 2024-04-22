// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

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
abstract class AppointmentModelCollectionReference
    implements
        AppointmentModelQuery,
        FirestoreCollectionReference<AppointmentModelQuerySnapshot> {
  factory AppointmentModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AppointmentModelCollectionReference;

  static AppointmentModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AppointmentModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AppointmentModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  AppointmentModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AppointmentModelDocumentReference> add(AppointmentModel value);
}

class _$AppointmentModelCollectionReference extends _$AppointmentModelQuery
    implements AppointmentModelCollectionReference {
  factory _$AppointmentModelCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AppointmentModelCollectionReference._(
      firestore.collection('appointments').withConverter(
            fromFirestore: AppointmentModelCollectionReference.fromFirestore,
            toFirestore: AppointmentModelCollectionReference.toFirestore,
          ),
    );
  }

  _$AppointmentModelCollectionReference._(
    CollectionReference<AppointmentModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<AppointmentModel> get reference =>
      super.reference as CollectionReference<AppointmentModel>;

  @override
  AppointmentModelDocumentReference doc([String? id]) {
    return AppointmentModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AppointmentModelDocumentReference> add(AppointmentModel value) {
    return reference
        .add(value)
        .then((ref) => AppointmentModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppointmentModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AppointmentModelDocumentReference
    extends FirestoreDocumentReference<AppointmentModelDocumentSnapshot> {
  factory AppointmentModelDocumentReference(
          DocumentReference<AppointmentModel> reference) =
      _$AppointmentModelDocumentReference;

  DocumentReference<AppointmentModel> get reference;

  /// A reference to the [AppointmentModelCollectionReference] containing this document.
  AppointmentModelCollectionReference get parent {
    return _$AppointmentModelCollectionReference(reference.firestore);
  }

  @override
  Stream<AppointmentModelDocumentSnapshot> snapshots();

  @override
  Future<AppointmentModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String id,
    int appointmentDate,
    bool completed,
    String doctorEmail,
    String patientEmail,
    String status,
    int doctorBill,
    int paidAmount,
    String doctorName,
    String doctorImage,
    String? dialog,
    int? totalCost,
    int? duration,
    String? billStatus,
    double rating,
  });

  Future<void> set(AppointmentModel value);
}

class _$AppointmentModelDocumentReference
    extends FirestoreDocumentReference<AppointmentModelDocumentSnapshot>
    implements AppointmentModelDocumentReference {
  _$AppointmentModelDocumentReference(this.reference);

  @override
  final DocumentReference<AppointmentModel> reference;

  /// A reference to the [AppointmentModelCollectionReference] containing this document.
  AppointmentModelCollectionReference get parent {
    return _$AppointmentModelCollectionReference(reference.firestore);
  }

  @override
  Stream<AppointmentModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AppointmentModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AppointmentModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AppointmentModelDocumentSnapshot._(
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
    Object? appointmentDate = _sentinel,
    Object? completed = _sentinel,
    Object? doctorEmail = _sentinel,
    Object? patientEmail = _sentinel,
    Object? status = _sentinel,
    Object? doctorBill = _sentinel,
    Object? paidAmount = _sentinel,
    Object? doctorName = _sentinel,
    Object? doctorImage = _sentinel,
    Object? dialog = _sentinel,
    Object? totalCost = _sentinel,
    Object? duration = _sentinel,
    Object? billStatus = _sentinel,
    Object? rating = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String,
      if (appointmentDate != _sentinel)
        "appointmentDate": appointmentDate as int,
      if (completed != _sentinel) "completed": completed as bool,
      if (doctorEmail != _sentinel) "doctorEmail": doctorEmail as String,
      if (patientEmail != _sentinel) "patientEmail": patientEmail as String,
      if (status != _sentinel) "status": status as String,
      if (doctorBill != _sentinel) "doctorBill": doctorBill as int,
      if (paidAmount != _sentinel) "paidAmount": paidAmount as int,
      if (doctorName != _sentinel) "doctorName": doctorName as String,
      if (doctorImage != _sentinel) "doctorImage": doctorImage as String,
      if (dialog != _sentinel) "dialog": dialog as String?,
      if (totalCost != _sentinel) "totalCost": totalCost as int?,
      if (duration != _sentinel) "duration": duration as int?,
      if (billStatus != _sentinel) "billStatus": billStatus as String?,
      if (rating != _sentinel) "rating": rating as double,
    };

    return reference.update(json);
  }

  Future<void> set(AppointmentModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AppointmentModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AppointmentModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  AppointmentModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<AppointmentModel> snapshot;

  @override
  AppointmentModelDocumentReference get reference {
    return AppointmentModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AppointmentModel? data;
}

abstract class AppointmentModelQuery
    implements QueryReference<AppointmentModelQuerySnapshot> {
  @override
  AppointmentModelQuery limit(int limit);

  @override
  AppointmentModelQuery limitToLast(int limit);

  AppointmentModelQuery whereId({
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
  AppointmentModelQuery whereAppointmentDate({
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
  AppointmentModelQuery whereCompleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  AppointmentModelQuery whereDoctorEmail({
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
  AppointmentModelQuery wherePatientEmail({
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
  AppointmentModelQuery whereStatus({
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
  AppointmentModelQuery whereDoctorBill({
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
  AppointmentModelQuery wherePaidAmount({
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
  AppointmentModelQuery whereDoctorName({
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
  AppointmentModelQuery whereDoctorImage({
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
  AppointmentModelQuery whereDialog({
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
  AppointmentModelQuery whereTotalCost({
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
  AppointmentModelQuery whereDuration({
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
  AppointmentModelQuery whereBillStatus({
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
  AppointmentModelQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });

  AppointmentModelQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByAppointmentDate({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByCompleted({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByDoctorEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByPatientEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByStatus({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByDoctorBill({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByPaidAmount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByDoctorName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByDoctorImage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByDialog({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByTotalCost({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByDuration({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByBillStatus({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });

  AppointmentModelQuery orderByRating({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  });
}

class _$AppointmentModelQuery
    extends QueryReference<AppointmentModelQuerySnapshot>
    implements AppointmentModelQuery {
  _$AppointmentModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<AppointmentModel> reference;

  AppointmentModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<AppointmentModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AppointmentModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AppointmentModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AppointmentModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AppointmentModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AppointmentModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AppointmentModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AppointmentModelQuery limit(int limit) {
    return _$AppointmentModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AppointmentModelQuery limitToLast(int limit) {
    return _$AppointmentModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AppointmentModelQuery whereId({
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
    return _$AppointmentModelQuery(
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

  AppointmentModelQuery whereAppointmentDate({
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
    return _$AppointmentModelQuery(
      reference.where(
        'appointmentDate',
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

  AppointmentModelQuery whereCompleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$AppointmentModelQuery(
      reference.where(
        'completed',
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

  AppointmentModelQuery whereDoctorEmail({
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
    return _$AppointmentModelQuery(
      reference.where(
        'doctorEmail',
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

  AppointmentModelQuery wherePatientEmail({
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
    return _$AppointmentModelQuery(
      reference.where(
        'patientEmail',
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

  AppointmentModelQuery whereStatus({
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
    return _$AppointmentModelQuery(
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

  AppointmentModelQuery whereDoctorBill({
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
    return _$AppointmentModelQuery(
      reference.where(
        'doctorBill',
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

  AppointmentModelQuery wherePaidAmount({
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
    return _$AppointmentModelQuery(
      reference.where(
        'paidAmount',
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

  AppointmentModelQuery whereDoctorName({
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
    return _$AppointmentModelQuery(
      reference.where(
        'doctorName',
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

  AppointmentModelQuery whereDoctorImage({
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
    return _$AppointmentModelQuery(
      reference.where(
        'doctorImage',
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

  AppointmentModelQuery whereDialog({
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
    return _$AppointmentModelQuery(
      reference.where(
        'dialog',
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

  AppointmentModelQuery whereTotalCost({
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
    return _$AppointmentModelQuery(
      reference.where(
        'totalCost',
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

  AppointmentModelQuery whereDuration({
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
    return _$AppointmentModelQuery(
      reference.where(
        'duration',
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

  AppointmentModelQuery whereBillStatus({
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
    return _$AppointmentModelQuery(
      reference.where(
        'billStatus',
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

  AppointmentModelQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$AppointmentModelQuery(
      reference.where(
        'rating',
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

  AppointmentModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByAppointmentDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('appointmentDate', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByCompleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('completed', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByDoctorEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('doctorEmail', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByPatientEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('patientEmail', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByDoctorBill({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('doctorBill', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByPaidAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('paidAmount', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByDoctorName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('doctorName', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByDoctorImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('doctorImage', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByDialog({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('dialog', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByTotalCost({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('totalCost', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByDuration({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('duration', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByBillStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('billStatus', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  AppointmentModelQuery orderByRating({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppointmentModelDocumentSnapshot? startAtDocument,
    AppointmentModelDocumentSnapshot? endAtDocument,
    AppointmentModelDocumentSnapshot? endBeforeDocument,
    AppointmentModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('rating', descending: descending);

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

    return _$AppointmentModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppointmentModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AppointmentModelQuerySnapshot
    extends FirestoreQuerySnapshot<AppointmentModelQueryDocumentSnapshot> {
  AppointmentModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<AppointmentModel> snapshot;

  @override
  final List<AppointmentModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AppointmentModelDocumentSnapshot>>
      docChanges;
}

class AppointmentModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements AppointmentModelDocumentSnapshot {
  AppointmentModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<AppointmentModel> snapshot;

  @override
  AppointmentModelDocumentReference get reference {
    return AppointmentModelDocumentReference(snapshot.reference);
  }

  @override
  final AppointmentModel data;
}
