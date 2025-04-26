// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantEntityCollection on Isar {
  IsarCollection<RestaurantEntity> get restaurantEntitys => this.collection();
}

const RestaurantEntitySchema = CollectionSchema(
  name: r'RestaurantEntity',
  id: -7565349802107891491,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'alertsIds': PropertySchema(
      id: 1,
      name: r'alertsIds',
      type: IsarType.stringList,
    ),
    r'cachedAt': PropertySchema(
      id: 2,
      name: r'cachedAt',
      type: IsarType.dateTime,
    ),
    r'closingTime': PropertySchema(
      id: 3,
      name: r'closingTime',
      type: IsarType.dateTime,
    ),
    r'commentsIds': PropertySchema(
      id: 4,
      name: r'commentsIds',
      type: IsarType.stringList,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'dietaryTagsIds': PropertySchema(
      id: 6,
      name: r'dietaryTagsIds',
      type: IsarType.stringList,
    ),
    r'email': PropertySchema(
      id: 7,
      name: r'email',
      type: IsarType.string,
    ),
    r'foodTagsIds': PropertySchema(
      id: 8,
      name: r'foodTagsIds',
      type: IsarType.stringList,
    ),
    r'id': PropertySchema(
      id: 9,
      name: r'id',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 10,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 11,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 12,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 13,
      name: r'name',
      type: IsarType.string,
    ),
    r'openingTime': PropertySchema(
      id: 14,
      name: r'openingTime',
      type: IsarType.dateTime,
    ),
    r'opensHolidays': PropertySchema(
      id: 15,
      name: r'opensHolidays',
      type: IsarType.bool,
    ),
    r'opensWeekends': PropertySchema(
      id: 16,
      name: r'opensWeekends',
      type: IsarType.bool,
    ),
    r'overviewPhoto': PropertySchema(
      id: 17,
      name: r'overviewPhoto',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 18,
      name: r'phone',
      type: IsarType.string,
    ),
    r'photos': PropertySchema(
      id: 19,
      name: r'photos',
      type: IsarType.stringList,
    ),
    r'productsIds': PropertySchema(
      id: 20,
      name: r'productsIds',
      type: IsarType.stringList,
    ),
    r'profilePhoto': PropertySchema(
      id: 21,
      name: r'profilePhoto',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 22,
      name: r'rating',
      type: IsarType.double,
    ),
    r'reservationsIds': PropertySchema(
      id: 23,
      name: r'reservationsIds',
      type: IsarType.stringList,
    ),
    r'routeIndications': PropertySchema(
      id: 24,
      name: r'routeIndications',
      type: IsarType.string,
    ),
    r'suscribersIds': PropertySchema(
      id: 25,
      name: r'suscribersIds',
      type: IsarType.stringList,
    ),
    r'tags': PropertySchema(
      id: 26,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'visitsIds': PropertySchema(
      id: 27,
      name: r'visitsIds',
      type: IsarType.stringList,
    )
  },
  estimateSize: _restaurantEntityEstimateSize,
  serialize: _restaurantEntitySerialize,
  deserialize: _restaurantEntityDeserialize,
  deserializeProp: _restaurantEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _restaurantEntityGetId,
  getLinks: _restaurantEntityGetLinks,
  attach: _restaurantEntityAttach,
  version: '3.1.0+1',
);

int _restaurantEntityEstimateSize(
  RestaurantEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.alertsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.commentsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.description.length * 3;
  {
    final list = object.dietaryTagsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.foodTagsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.overviewPhoto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.photos;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.productsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.profilePhoto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.reservationsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.routeIndications.length * 3;
  {
    final list = object.suscribersIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.visitsIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _restaurantEntitySerialize(
  RestaurantEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeStringList(offsets[1], object.alertsIds);
  writer.writeDateTime(offsets[2], object.cachedAt);
  writer.writeDateTime(offsets[3], object.closingTime);
  writer.writeStringList(offsets[4], object.commentsIds);
  writer.writeString(offsets[5], object.description);
  writer.writeStringList(offsets[6], object.dietaryTagsIds);
  writer.writeString(offsets[7], object.email);
  writer.writeStringList(offsets[8], object.foodTagsIds);
  writer.writeString(offsets[9], object.id);
  writer.writeBool(offsets[10], object.isActive);
  writer.writeDouble(offsets[11], object.latitude);
  writer.writeDouble(offsets[12], object.longitude);
  writer.writeString(offsets[13], object.name);
  writer.writeDateTime(offsets[14], object.openingTime);
  writer.writeBool(offsets[15], object.opensHolidays);
  writer.writeBool(offsets[16], object.opensWeekends);
  writer.writeString(offsets[17], object.overviewPhoto);
  writer.writeString(offsets[18], object.phone);
  writer.writeStringList(offsets[19], object.photos);
  writer.writeStringList(offsets[20], object.productsIds);
  writer.writeString(offsets[21], object.profilePhoto);
  writer.writeDouble(offsets[22], object.rating);
  writer.writeStringList(offsets[23], object.reservationsIds);
  writer.writeString(offsets[24], object.routeIndications);
  writer.writeStringList(offsets[25], object.suscribersIds);
  writer.writeStringList(offsets[26], object.tags);
  writer.writeStringList(offsets[27], object.visitsIds);
}

RestaurantEntity _restaurantEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantEntity(
    address: reader.readStringOrNull(offsets[0]),
    alertsIds: reader.readStringList(offsets[1]),
    closingTime: reader.readDateTime(offsets[3]),
    commentsIds: reader.readStringList(offsets[4]),
    description: reader.readString(offsets[5]),
    dietaryTagsIds: reader.readStringList(offsets[6]),
    email: reader.readStringOrNull(offsets[7]),
    foodTagsIds: reader.readStringList(offsets[8]),
    id: reader.readString(offsets[9]),
    isActive: reader.readBool(offsets[10]),
    latitude: reader.readDouble(offsets[11]),
    longitude: reader.readDouble(offsets[12]),
    name: reader.readString(offsets[13]),
    openingTime: reader.readDateTime(offsets[14]),
    opensHolidays: reader.readBool(offsets[15]),
    opensWeekends: reader.readBool(offsets[16]),
    overviewPhoto: reader.readStringOrNull(offsets[17]),
    phone: reader.readStringOrNull(offsets[18]),
    photos: reader.readStringList(offsets[19]),
    productsIds: reader.readStringList(offsets[20]),
    profilePhoto: reader.readStringOrNull(offsets[21]),
    rating: reader.readDoubleOrNull(offsets[22]),
    reservationsIds: reader.readStringList(offsets[23]),
    routeIndications: reader.readString(offsets[24]),
    suscribersIds: reader.readStringList(offsets[25]),
    tags: reader.readStringList(offsets[26]),
    visitsIds: reader.readStringList(offsets[27]),
  );
  object.cachedAt = reader.readDateTime(offsets[2]);
  object.isarId = id;
  return object;
}

P _restaurantEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringList(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringList(offset)) as P;
    case 20:
      return (reader.readStringList(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readStringList(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readStringList(offset)) as P;
    case 26:
      return (reader.readStringList(offset)) as P;
    case 27:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _restaurantEntityGetId(RestaurantEntity object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _restaurantEntityGetLinks(RestaurantEntity object) {
  return [];
}

void _restaurantEntityAttach(
    IsarCollection<dynamic> col, Id id, RestaurantEntity object) {
  object.isarId = id;
}

extension RestaurantEntityQueryWhereSort
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QWhere> {
  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RestaurantEntityQueryWhere
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QWhereClause> {
  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RestaurantEntityQueryFilter
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QFilterCondition> {
  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alertsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alertsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alertsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alertsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alertsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alertsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alertsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alertsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alertsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alertsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alertsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alertsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alertsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alertsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alertsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alertsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alertsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      alertsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alertsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      cachedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cachedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      cachedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cachedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      cachedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cachedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      cachedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cachedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      closingTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      closingTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      closingTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      closingTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commentsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commentsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commentsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commentsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commentsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commentsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commentsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commentsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commentsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commentsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commentsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commentsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commentsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commentsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commentsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      commentsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commentsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dietaryTagsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dietaryTagsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dietaryTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dietaryTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dietaryTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dietaryTagsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dietaryTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dietaryTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dietaryTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dietaryTagsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dietaryTagsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dietaryTagsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTagsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTagsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTagsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTagsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTagsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      dietaryTagsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTagsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodTagsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodTagsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodTagsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodTagsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodTagsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodTagsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodTagsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTagsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTagsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTagsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTagsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTagsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      foodTagsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTagsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      openingTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      openingTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      openingTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      openingTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      opensHolidaysEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opensHolidays',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      opensWeekendsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opensWeekends',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'overviewPhoto',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'overviewPhoto',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overviewPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overviewPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overviewPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overviewPhoto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'overviewPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'overviewPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'overviewPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'overviewPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overviewPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      overviewPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'overviewPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photos',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photos',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      photosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      productsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'productsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'profilePhoto',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'profilePhoto',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profilePhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profilePhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profilePhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profilePhoto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profilePhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profilePhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profilePhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profilePhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profilePhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      profilePhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profilePhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      ratingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      ratingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      ratingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      ratingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reservationsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reservationsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservationsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reservationsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reservationsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reservationsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reservationsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reservationsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reservationsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reservationsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservationsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reservationsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservationsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservationsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservationsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservationsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservationsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      reservationsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservationsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeIndications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'routeIndications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'routeIndications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'routeIndications',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'routeIndications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'routeIndications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'routeIndications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'routeIndications',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'routeIndications',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      routeIndicationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'routeIndications',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'suscribersIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'suscribersIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suscribersIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suscribersIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suscribersIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suscribersIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suscribersIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suscribersIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suscribersIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suscribersIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suscribersIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suscribersIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suscribersIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suscribersIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suscribersIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suscribersIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suscribersIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      suscribersIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suscribersIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visitsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visitsIds',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visitsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visitsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visitsIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visitsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visitsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visitsIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visitsIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visitsIds',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitsIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitsIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitsIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitsIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitsIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterFilterCondition>
      visitsIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitsIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension RestaurantEntityQueryObject
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QFilterCondition> {}

extension RestaurantEntityQueryLinks
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QFilterCondition> {}

extension RestaurantEntityQuerySortBy
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QSortBy> {
  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByClosingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByClosingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOpeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOpeningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOpensHolidays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensHolidays', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOpensHolidaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensHolidays', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOpensWeekends() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensWeekends', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOpensWeekendsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensWeekends', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOverviewPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overviewPhoto', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByOverviewPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overviewPhoto', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByProfilePhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhoto', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByProfilePhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhoto', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByRouteIndications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeIndications', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      sortByRouteIndicationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeIndications', Sort.desc);
    });
  }
}

extension RestaurantEntityQuerySortThenBy
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QSortThenBy> {
  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByClosingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByClosingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOpeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOpeningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOpensHolidays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensHolidays', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOpensHolidaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensHolidays', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOpensWeekends() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensWeekends', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOpensWeekendsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opensWeekends', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOverviewPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overviewPhoto', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByOverviewPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overviewPhoto', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByProfilePhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhoto', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByProfilePhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhoto', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByRouteIndications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeIndications', Sort.asc);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QAfterSortBy>
      thenByRouteIndicationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeIndications', Sort.desc);
    });
  }
}

extension RestaurantEntityQueryWhereDistinct
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> {
  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByAlertsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alertsIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedAt');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByClosingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closingTime');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByCommentsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentsIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByDietaryTagsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dietaryTagsIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByFoodTagsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodTagsIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByOpeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openingTime');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByOpensHolidays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opensHolidays');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByOpensWeekends() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opensWeekends');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByOverviewPhoto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overviewPhoto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByPhotos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photos');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByProductsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productsIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByProfilePhoto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profilePhoto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByReservationsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reservationsIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByRouteIndications({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeIndications',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctBySuscribersIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suscribersIds');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<RestaurantEntity, RestaurantEntity, QDistinct>
      distinctByVisitsIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitsIds');
    });
  }
}

extension RestaurantEntityQueryProperty
    on QueryBuilder<RestaurantEntity, RestaurantEntity, QQueryProperty> {
  QueryBuilder<RestaurantEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<RestaurantEntity, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      alertsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alertsIds');
    });
  }

  QueryBuilder<RestaurantEntity, DateTime, QQueryOperations>
      cachedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedAt');
    });
  }

  QueryBuilder<RestaurantEntity, DateTime, QQueryOperations>
      closingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closingTime');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      commentsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentsIds');
    });
  }

  QueryBuilder<RestaurantEntity, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      dietaryTagsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dietaryTagsIds');
    });
  }

  QueryBuilder<RestaurantEntity, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      foodTagsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodTagsIds');
    });
  }

  QueryBuilder<RestaurantEntity, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantEntity, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RestaurantEntity, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<RestaurantEntity, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<RestaurantEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RestaurantEntity, DateTime, QQueryOperations>
      openingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openingTime');
    });
  }

  QueryBuilder<RestaurantEntity, bool, QQueryOperations>
      opensHolidaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opensHolidays');
    });
  }

  QueryBuilder<RestaurantEntity, bool, QQueryOperations>
      opensWeekendsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opensWeekends');
    });
  }

  QueryBuilder<RestaurantEntity, String?, QQueryOperations>
      overviewPhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overviewPhoto');
    });
  }

  QueryBuilder<RestaurantEntity, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      productsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productsIds');
    });
  }

  QueryBuilder<RestaurantEntity, String?, QQueryOperations>
      profilePhotoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profilePhoto');
    });
  }

  QueryBuilder<RestaurantEntity, double?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      reservationsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reservationsIds');
    });
  }

  QueryBuilder<RestaurantEntity, String, QQueryOperations>
      routeIndicationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeIndications');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      suscribersIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suscribersIds');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<RestaurantEntity, List<String>?, QQueryOperations>
      visitsIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitsIds');
    });
  }
}
