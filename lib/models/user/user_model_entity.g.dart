// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_entity.dart';

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
abstract class UserModelEntityCollectionReference
    implements
        UserModelEntityQuery,
        FirestoreCollectionReference<UserModelEntityQuerySnapshot> {
  factory UserModelEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserModelEntityCollectionReference;

  static UserModelEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserModelEntityFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserModelEntity value,
    SetOptions? options,
  ) {
    return _$UserModelEntityToJson(value);
  }

  @override
  UserModelEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserModelEntityDocumentReference> add(UserModelEntity value);
}

class _$UserModelEntityCollectionReference extends _$UserModelEntityQuery
    implements UserModelEntityCollectionReference {
  factory _$UserModelEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserModelEntityCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserModelEntityCollectionReference.fromFirestore,
            toFirestore: UserModelEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$UserModelEntityCollectionReference._(
    CollectionReference<UserModelEntity> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<UserModelEntity> get reference =>
      super.reference as CollectionReference<UserModelEntity>;

  @override
  UserModelEntityDocumentReference doc([String? id]) {
    return UserModelEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserModelEntityDocumentReference> add(UserModelEntity value) {
    return reference
        .add(value)
        .then((ref) => UserModelEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserModelEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserModelEntityDocumentReference
    extends FirestoreDocumentReference<UserModelEntityDocumentSnapshot> {
  factory UserModelEntityDocumentReference(
          DocumentReference<UserModelEntity> reference) =
      _$UserModelEntityDocumentReference;

  DocumentReference<UserModelEntity> get reference;

  /// A reference to the [UserModelEntityCollectionReference] containing this document.
  UserModelEntityCollectionReference get parent {
    return _$UserModelEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<UserModelEntityDocumentSnapshot> snapshots();

  @override
  Future<UserModelEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? id,
    String? fullname,
    String? email,
    String? password,
    String? gender,
    String? phone,
    int? dob,
    int? isConsultant,
    int? activated,
  });

  Future<void> set(UserModelEntity value);
}

class _$UserModelEntityDocumentReference
    extends FirestoreDocumentReference<UserModelEntityDocumentSnapshot>
    implements UserModelEntityDocumentReference {
  _$UserModelEntityDocumentReference(this.reference);

  @override
  final DocumentReference<UserModelEntity> reference;

  /// A reference to the [UserModelEntityCollectionReference] containing this document.
  UserModelEntityCollectionReference get parent {
    return _$UserModelEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<UserModelEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return UserModelEntityDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<UserModelEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return UserModelEntityDocumentSnapshot._(
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
    Object? fullname = _sentinel,
    Object? email = _sentinel,
    Object? password = _sentinel,
    Object? gender = _sentinel,
    Object? phone = _sentinel,
    Object? dob = _sentinel,
    Object? isConsultant = _sentinel,
    Object? activated = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String?,
      if (fullname != _sentinel) "fullname": fullname as String?,
      if (email != _sentinel) "email": email as String?,
      if (password != _sentinel) "password": password as String?,
      if (gender != _sentinel) "gender": gender as String?,
      if (phone != _sentinel) "phone": phone as String?,
      if (dob != _sentinel) "dob": dob as int?,
      if (isConsultant != _sentinel) "isConsultant": isConsultant as int?,
      if (activated != _sentinel) "activated": activated as int?,
    };

    return reference.update(json);
  }

  Future<void> set(UserModelEntity value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is UserModelEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class UserModelEntityDocumentSnapshot extends FirestoreDocumentSnapshot {
  UserModelEntityDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<UserModelEntity> snapshot;

  @override
  UserModelEntityDocumentReference get reference {
    return UserModelEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserModelEntity? data;
}

abstract class UserModelEntityQuery
    implements QueryReference<UserModelEntityQuerySnapshot> {
  @override
  UserModelEntityQuery limit(int limit);

  @override
  UserModelEntityQuery limitToLast(int limit);

  UserModelEntityQuery whereId({
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
  UserModelEntityQuery whereFullname({
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
  UserModelEntityQuery whereEmail({
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
  UserModelEntityQuery wherePassword({
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
  UserModelEntityQuery whereGender({
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
  UserModelEntityQuery wherePhone({
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
  UserModelEntityQuery whereDob({
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
  UserModelEntityQuery whereIsConsultant({
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
  UserModelEntityQuery whereActivated({
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

  UserModelEntityQuery orderById({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByFullname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByPassword({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByGender({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByPhone({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByDob({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByIsConsultant({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });

  UserModelEntityQuery orderByActivated({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$UserModelEntityQuery
    extends QueryReference<UserModelEntityQuerySnapshot>
    implements UserModelEntityQuery {
  _$UserModelEntityQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<UserModelEntity> reference;

  UserModelEntityQuerySnapshot _decodeSnapshot(
    QuerySnapshot<UserModelEntity> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return UserModelEntityQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<UserModelEntityDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: UserModelEntityDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return UserModelEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<UserModelEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<UserModelEntityQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  UserModelEntityQuery limit(int limit) {
    return _$UserModelEntityQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  UserModelEntityQuery limitToLast(int limit) {
    return _$UserModelEntityQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  UserModelEntityQuery whereId({
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
    return _$UserModelEntityQuery(
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

  UserModelEntityQuery whereFullname({
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
    return _$UserModelEntityQuery(
      reference.where(
        'fullname',
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

  UserModelEntityQuery whereEmail({
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
    return _$UserModelEntityQuery(
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

  UserModelEntityQuery wherePassword({
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
    return _$UserModelEntityQuery(
      reference.where(
        'password',
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

  UserModelEntityQuery whereGender({
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
    return _$UserModelEntityQuery(
      reference.where(
        'gender',
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

  UserModelEntityQuery wherePhone({
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
    return _$UserModelEntityQuery(
      reference.where(
        'phone',
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

  UserModelEntityQuery whereDob({
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
    return _$UserModelEntityQuery(
      reference.where(
        'dob',
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

  UserModelEntityQuery whereIsConsultant({
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
    return _$UserModelEntityQuery(
      reference.where(
        'isConsultant',
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

  UserModelEntityQuery whereActivated({
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
    return _$UserModelEntityQuery(
      reference.where(
        'activated',
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

  UserModelEntityQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByFullname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('fullname', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByPassword({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('password', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByGender({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('gender', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByPhone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('phone', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByDob({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('dob', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByIsConsultant({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isConsultant', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  UserModelEntityQuery orderByActivated({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelEntityDocumentSnapshot? startAtDocument,
    UserModelEntityDocumentSnapshot? endAtDocument,
    UserModelEntityDocumentSnapshot? endBeforeDocument,
    UserModelEntityDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('activated', descending: descending);

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

    return _$UserModelEntityQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserModelEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserModelEntityQuerySnapshot
    extends FirestoreQuerySnapshot<UserModelEntityQueryDocumentSnapshot> {
  UserModelEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<UserModelEntity> snapshot;

  @override
  final List<UserModelEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserModelEntityDocumentSnapshot>>
      docChanges;
}

class UserModelEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements UserModelEntityDocumentSnapshot {
  UserModelEntityQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<UserModelEntity> snapshot;

  @override
  UserModelEntityDocumentReference get reference {
    return UserModelEntityDocumentReference(snapshot.reference);
  }

  @override
  final UserModelEntity data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelEntity _$UserModelEntityFromJson(Map<String, dynamic> json) =>
    UserModelEntity(
      id: json['id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      isConsultant: json['isConsultant'] as int?,
      activated: json['activated'] as int?,
      phone: json['phone'] as String?,
      dob: json['dob'] as int?,
    );

Map<String, dynamic> _$UserModelEntityToJson(UserModelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
      'dob': instance.dob,
      'isConsultant': instance.isConsultant,
      'activated': instance.activated,
    };
