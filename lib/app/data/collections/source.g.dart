// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSourceCollection on Isar {
  IsarCollection<Source> get sources => this.collection();
}

const SourceSchema = CollectionSchema(
  name: r'Source',
  id: 1877768871581930899,
  properties: {
    r'icon': PropertySchema(
      id: 0,
      name: r'icon',
      type: IsarType.string,
    ),
    r'lastUpdateTime': PropertySchema(
      id: 1,
      name: r'lastUpdateTime',
      type: IsarType.long,
    ),
    r'link': PropertySchema(
      id: 2,
      name: r'link',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'ruleCode': PropertySchema(
      id: 4,
      name: r'ruleCode',
      type: IsarType.string,
    ),
    r'ruleName': PropertySchema(
      id: 5,
      name: r'ruleName',
      type: IsarType.string,
    ),
    r'ruleUrl': PropertySchema(
      id: 6,
      name: r'ruleUrl',
      type: IsarType.string,
    ),
    r'updateErrorTip': PropertySchema(
      id: 7,
      name: r'updateErrorTip',
      type: IsarType.string,
    ),
    r'updateResultType': PropertySchema(
      id: 8,
      name: r'updateResultType',
      type: IsarType.long,
      enumMap: _SourceupdateResultTypeEnumValueMap,
    ),
    r'url': PropertySchema(
      id: 9,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _sourceEstimateSize,
  serialize: _sourceSerialize,
  deserialize: _sourceDeserialize,
  deserializeProp: _sourceDeserializeProp,
  idName: r'id',
  indexes: {
    r'url': IndexSchema(
      id: -5756857009679432345,
      name: r'url',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'url',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sourceGetId,
  getLinks: _sourceGetLinks,
  attach: _sourceAttach,
  version: '3.1.0+1',
);

int _sourceEstimateSize(
  Source object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.icon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.link;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruleCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruleUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updateErrorTip;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sourceSerialize(
  Source object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.icon);
  writer.writeLong(offsets[1], object.lastUpdateTime);
  writer.writeString(offsets[2], object.link);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.ruleCode);
  writer.writeString(offsets[5], object.ruleName);
  writer.writeString(offsets[6], object.ruleUrl);
  writer.writeString(offsets[7], object.updateErrorTip);
  writer.writeLong(offsets[8], object.updateResultType?.value);
  writer.writeString(offsets[9], object.url);
}

Source _sourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Source();
  object.icon = reader.readStringOrNull(offsets[0]);
  object.lastUpdateTime = reader.readLongOrNull(offsets[1]);
  object.link = reader.readStringOrNull(offsets[2]);
  object.name = reader.readStringOrNull(offsets[3]);
  object.ruleCode = reader.readStringOrNull(offsets[4]);
  object.ruleName = reader.readStringOrNull(offsets[5]);
  object.ruleUrl = reader.readStringOrNull(offsets[6]);
  object.updateErrorTip = reader.readStringOrNull(offsets[7]);
  object.updateResultType =
      _SourceupdateResultTypeValueEnumMap[reader.readLongOrNull(offsets[8])];
  object.url = reader.readStringOrNull(offsets[9]);
  return object;
}

P _sourceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_SourceupdateResultTypeValueEnumMap[
          reader.readLongOrNull(offset)]) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SourceupdateResultTypeEnumValueMap = {
  'refreshing': 0,
  'success': 1,
  'fail': 2,
};
const _SourceupdateResultTypeValueEnumMap = {
  0: LastUpdateType.refreshing,
  1: LastUpdateType.success,
  2: LastUpdateType.fail,
};

Id _sourceGetId(Source object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sourceGetLinks(Source object) {
  return [];
}

void _sourceAttach(IsarCollection<dynamic> col, Id id, Source object) {}

extension SourceByIndex on IsarCollection<Source> {
  Future<Source?> getByUrl(String? url) {
    return getByIndex(r'url', [url]);
  }

  Source? getByUrlSync(String? url) {
    return getByIndexSync(r'url', [url]);
  }

  Future<bool> deleteByUrl(String? url) {
    return deleteByIndex(r'url', [url]);
  }

  bool deleteByUrlSync(String? url) {
    return deleteByIndexSync(r'url', [url]);
  }

  Future<List<Source?>> getAllByUrl(List<String?> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndex(r'url', values);
  }

  List<Source?> getAllByUrlSync(List<String?> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'url', values);
  }

  Future<int> deleteAllByUrl(List<String?> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'url', values);
  }

  int deleteAllByUrlSync(List<String?> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'url', values);
  }

  Future<Id> putByUrl(Source object) {
    return putByIndex(r'url', object);
  }

  Id putByUrlSync(Source object, {bool saveLinks = true}) {
    return putByIndexSync(r'url', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUrl(List<Source> objects) {
    return putAllByIndex(r'url', objects);
  }

  List<Id> putAllByUrlSync(List<Source> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'url', objects, saveLinks: saveLinks);
  }
}

extension SourceQueryWhereSort on QueryBuilder<Source, Source, QWhere> {
  QueryBuilder<Source, Source, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SourceQueryWhere on QueryBuilder<Source, Source, QWhereClause> {
  QueryBuilder<Source, Source, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'url',
        value: [null],
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'url',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> urlEqualTo(String? url) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'url',
        value: [url],
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterWhereClause> urlNotEqualTo(String? url) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SourceQueryFilter on QueryBuilder<Source, Source, QFilterCondition> {
  QueryBuilder<Source, Source, QAfterFilterCondition> iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> lastUpdateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdateTime',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition>
      lastUpdateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdateTime',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> lastUpdateTimeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> lastUpdateTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> lastUpdateTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> lastUpdateTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'link',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'link',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'link',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'link',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> nameEqualTo(
    String? value, {
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

  QueryBuilder<Source, Source, QAfterFilterCondition> nameGreaterThan(
    String? value, {
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

  QueryBuilder<Source, Source, QAfterFilterCondition> nameLessThan(
    String? value, {
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

  QueryBuilder<Source, Source, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Source, Source, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Source, Source, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Source, Source, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleCode',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleCode',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleName',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleName',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruleUrl',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruleUrl',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> ruleUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateErrorTip',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition>
      updateErrorTipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateErrorTip',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateErrorTip',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateErrorTip',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateErrorTip',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateErrorTip',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updateErrorTip',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updateErrorTip',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateErrorTip',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateErrorTip',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateErrorTipIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateErrorTip',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition>
      updateErrorTipIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateErrorTip',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateResultTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateResultType',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition>
      updateResultTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateResultType',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateResultTypeEqualTo(
      LastUpdateType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateResultType',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition>
      updateResultTypeGreaterThan(
    LastUpdateType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateResultType',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateResultTypeLessThan(
    LastUpdateType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateResultType',
        value: value,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> updateResultTypeBetween(
    LastUpdateType? lower,
    LastUpdateType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateResultType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension SourceQueryObject on QueryBuilder<Source, Source, QFilterCondition> {}

extension SourceQueryLinks on QueryBuilder<Source, Source, QFilterCondition> {}

extension SourceQuerySortBy on QueryBuilder<Source, Source, QSortBy> {
  QueryBuilder<Source, Source, QAfterSortBy> sortByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByLastUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByLastUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByRuleCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleCode', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByRuleCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleCode', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByRuleUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleUrl', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByRuleUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleUrl', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByUpdateErrorTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateErrorTip', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByUpdateErrorTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateErrorTip', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByUpdateResultType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateResultType', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByUpdateResultTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateResultType', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension SourceQuerySortThenBy on QueryBuilder<Source, Source, QSortThenBy> {
  QueryBuilder<Source, Source, QAfterSortBy> thenByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByLastUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByLastUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByRuleCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleCode', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByRuleCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleCode', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByRuleUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleUrl', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByRuleUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleUrl', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByUpdateErrorTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateErrorTip', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByUpdateErrorTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateErrorTip', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByUpdateResultType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateResultType', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByUpdateResultTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateResultType', Sort.desc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Source, Source, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension SourceQueryWhereDistinct on QueryBuilder<Source, Source, QDistinct> {
  QueryBuilder<Source, Source, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByLastUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdateTime');
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'link', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByRuleCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByRuleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByRuleUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByUpdateErrorTip(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateErrorTip',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByUpdateResultType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateResultType');
    });
  }

  QueryBuilder<Source, Source, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension SourceQueryProperty on QueryBuilder<Source, Source, QQueryProperty> {
  QueryBuilder<Source, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<Source, int?, QQueryOperations> lastUpdateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdateTime');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> linkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'link');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> ruleCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleCode');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> ruleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleName');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> ruleUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleUrl');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> updateErrorTipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateErrorTip');
    });
  }

  QueryBuilder<Source, LastUpdateType?, QQueryOperations>
      updateResultTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateResultType');
    });
  }

  QueryBuilder<Source, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
