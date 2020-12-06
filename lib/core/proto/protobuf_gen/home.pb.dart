///
//  Generated code. Do not modify.
//  source: home.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ABanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ABanner', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'id')
    ..aOS(2, 'desc')
    ..aOS(3, 'imagePath', protoName: 'imagePath')
    ..aInt64(4, 'isVisible', protoName: 'isVisible')
    ..aInt64(5, 'order')
    ..aOS(6, 'title')
    ..aInt64(7, 'type')
    ..aOS(8, 'url')
    ..hasRequiredFields = false
  ;

  ABanner._() : super();
  factory ABanner() => create();
  factory ABanner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ABanner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ABanner clone() => ABanner()..mergeFromMessage(this);
  ABanner copyWith(void Function(ABanner) updates) => super.copyWith((message) => updates(message as ABanner));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ABanner create() => ABanner._();
  ABanner createEmptyInstance() => create();
  static $pb.PbList<ABanner> createRepeated() => $pb.PbList<ABanner>();
  @$core.pragma('dart2js:noInline')
  static ABanner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ABanner>(create);
  static ABanner _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imagePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set imagePath($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImagePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearImagePath() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get isVisible => $_getI64(3);
  @$pb.TagNumber(4)
  set isVisible($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsVisible() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsVisible() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get order => $_getI64(4);
  @$pb.TagNumber(5)
  set order($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get type => $_getI64(6);
  @$pb.TagNumber(7)
  set type($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get url => $_getSZ(7);
  @$pb.TagNumber(8)
  set url($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearUrl() => clearField(8);
}

class TagsBean extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TagsBean', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'url')
    ..hasRequiredFields = false
  ;

  TagsBean._() : super();
  factory TagsBean() => create();
  factory TagsBean.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagsBean.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TagsBean clone() => TagsBean()..mergeFromMessage(this);
  TagsBean copyWith(void Function(TagsBean) updates) => super.copyWith((message) => updates(message as TagsBean));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagsBean create() => TagsBean._();
  TagsBean createEmptyInstance() => create();
  static $pb.PbList<TagsBean> createRepeated() => $pb.PbList<TagsBean>();
  @$core.pragma('dart2js:noInline')
  static TagsBean getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagsBean>(create);
  static TagsBean _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class Article extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Article', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOS(1, 'apkLink', protoName: 'apkLink')
    ..aOS(2, 'author')
    ..aOS(3, 'shareUser', protoName: 'shareUser')
    ..aInt64(4, 'chapterId', protoName: 'chapterId')
    ..aOS(5, 'chapterName', protoName: 'chapterName')
    ..aOB(6, 'collect')
    ..aInt64(7, 'courseId', protoName: 'courseId')
    ..aOS(8, 'desc')
    ..aOS(9, 'envelopePic', protoName: 'envelopePic')
    ..aOB(10, 'fresh')
    ..aInt64(11, 'id')
    ..aOS(12, 'link')
    ..aOS(13, 'niceDate', protoName: 'niceDate')
    ..aOS(14, 'origin')
    ..aInt64(15, 'originId', protoName: 'originId')
    ..aOS(16, 'prefix')
    ..aOS(17, 'projectLink', protoName: 'projectLink')
    ..aInt64(18, 'publishTime', protoName: 'publishTime')
    ..aInt64(19, 'superChapterId', protoName: 'superChapterId')
    ..aOS(20, 'superChapterName', protoName: 'superChapterName')
    ..pc<TagsBean>(21, 'tags', $pb.PbFieldType.PM, subBuilder: TagsBean.create)
    ..aOS(22, 'title')
    ..aInt64(23, 'type')
    ..aInt64(24, 'userId', protoName: 'userId')
    ..aInt64(25, 'visible')
    ..aInt64(26, 'zan')
    ..hasRequiredFields = false
  ;

  Article._() : super();
  factory Article() => create();
  factory Article.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Article.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Article clone() => Article()..mergeFromMessage(this);
  Article copyWith(void Function(Article) updates) => super.copyWith((message) => updates(message as Article));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Article create() => Article._();
  Article createEmptyInstance() => create();
  static $pb.PbList<Article> createRepeated() => $pb.PbList<Article>();
  @$core.pragma('dart2js:noInline')
  static Article getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Article>(create);
  static Article _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get apkLink => $_getSZ(0);
  @$pb.TagNumber(1)
  set apkLink($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApkLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearApkLink() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get author => $_getSZ(1);
  @$pb.TagNumber(2)
  set author($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthor() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get shareUser => $_getSZ(2);
  @$pb.TagNumber(3)
  set shareUser($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShareUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearShareUser() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get chapterId => $_getI64(3);
  @$pb.TagNumber(4)
  set chapterId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChapterId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChapterId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get chapterName => $_getSZ(4);
  @$pb.TagNumber(5)
  set chapterName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChapterName() => $_has(4);
  @$pb.TagNumber(5)
  void clearChapterName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get collect => $_getBF(5);
  @$pb.TagNumber(6)
  set collect($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCollect() => $_has(5);
  @$pb.TagNumber(6)
  void clearCollect() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get courseId => $_getI64(6);
  @$pb.TagNumber(7)
  set courseId($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCourseId() => $_has(6);
  @$pb.TagNumber(7)
  void clearCourseId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get envelopePic => $_getSZ(8);
  @$pb.TagNumber(9)
  set envelopePic($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasEnvelopePic() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnvelopePic() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get fresh => $_getBF(9);
  @$pb.TagNumber(10)
  set fresh($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasFresh() => $_has(9);
  @$pb.TagNumber(10)
  void clearFresh() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get id => $_getI64(10);
  @$pb.TagNumber(11)
  set id($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasId() => $_has(10);
  @$pb.TagNumber(11)
  void clearId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get link => $_getSZ(11);
  @$pb.TagNumber(12)
  set link($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLink() => $_has(11);
  @$pb.TagNumber(12)
  void clearLink() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get niceDate => $_getSZ(12);
  @$pb.TagNumber(13)
  set niceDate($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasNiceDate() => $_has(12);
  @$pb.TagNumber(13)
  void clearNiceDate() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get origin => $_getSZ(13);
  @$pb.TagNumber(14)
  set origin($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasOrigin() => $_has(13);
  @$pb.TagNumber(14)
  void clearOrigin() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get originId => $_getI64(14);
  @$pb.TagNumber(15)
  set originId($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasOriginId() => $_has(14);
  @$pb.TagNumber(15)
  void clearOriginId() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get prefix => $_getSZ(15);
  @$pb.TagNumber(16)
  set prefix($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasPrefix() => $_has(15);
  @$pb.TagNumber(16)
  void clearPrefix() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get projectLink => $_getSZ(16);
  @$pb.TagNumber(17)
  set projectLink($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasProjectLink() => $_has(16);
  @$pb.TagNumber(17)
  void clearProjectLink() => clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get publishTime => $_getI64(17);
  @$pb.TagNumber(18)
  set publishTime($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasPublishTime() => $_has(17);
  @$pb.TagNumber(18)
  void clearPublishTime() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get superChapterId => $_getI64(18);
  @$pb.TagNumber(19)
  set superChapterId($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasSuperChapterId() => $_has(18);
  @$pb.TagNumber(19)
  void clearSuperChapterId() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get superChapterName => $_getSZ(19);
  @$pb.TagNumber(20)
  set superChapterName($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSuperChapterName() => $_has(19);
  @$pb.TagNumber(20)
  void clearSuperChapterName() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<TagsBean> get tags => $_getList(20);

  @$pb.TagNumber(22)
  $core.String get title => $_getSZ(21);
  @$pb.TagNumber(22)
  set title($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasTitle() => $_has(21);
  @$pb.TagNumber(22)
  void clearTitle() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get type => $_getI64(22);
  @$pb.TagNumber(23)
  set type($fixnum.Int64 v) { $_setInt64(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasType() => $_has(22);
  @$pb.TagNumber(23)
  void clearType() => clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get userId => $_getI64(23);
  @$pb.TagNumber(24)
  set userId($fixnum.Int64 v) { $_setInt64(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasUserId() => $_has(23);
  @$pb.TagNumber(24)
  void clearUserId() => clearField(24);

  @$pb.TagNumber(25)
  $fixnum.Int64 get visible => $_getI64(24);
  @$pb.TagNumber(25)
  set visible($fixnum.Int64 v) { $_setInt64(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasVisible() => $_has(24);
  @$pb.TagNumber(25)
  void clearVisible() => clearField(25);

  @$pb.TagNumber(26)
  $fixnum.Int64 get zan => $_getI64(25);
  @$pb.TagNumber(26)
  set zan($fixnum.Int64 v) { $_setInt64(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasZan() => $_has(25);
  @$pb.TagNumber(26)
  void clearZan() => clearField(26);
}

class HomeDataArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HomeDataArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.int>(1, 'page', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  HomeDataArg._() : super();
  factory HomeDataArg() => create();
  factory HomeDataArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeDataArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HomeDataArg clone() => HomeDataArg()..mergeFromMessage(this);
  HomeDataArg copyWith(void Function(HomeDataArg) updates) => super.copyWith((message) => updates(message as HomeDataArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeDataArg create() => HomeDataArg._();
  HomeDataArg createEmptyInstance() => create();
  static $pb.PbList<HomeDataArg> createRepeated() => $pb.PbList<HomeDataArg>();
  @$core.pragma('dart2js:noInline')
  static HomeDataArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeDataArg>(create);
  static HomeDataArg _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);
}

class HomeDataReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HomeDataReply', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..pc<ABanner>(1, 'banners', $pb.PbFieldType.PM, subBuilder: ABanner.create)
    ..pc<Article>(2, 'topArticles', $pb.PbFieldType.PM, protoName: 'topArticles', subBuilder: Article.create)
    ..pc<Article>(3, 'articles', $pb.PbFieldType.PM, subBuilder: Article.create)
    ..hasRequiredFields = false
  ;

  HomeDataReply._() : super();
  factory HomeDataReply() => create();
  factory HomeDataReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeDataReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HomeDataReply clone() => HomeDataReply()..mergeFromMessage(this);
  HomeDataReply copyWith(void Function(HomeDataReply) updates) => super.copyWith((message) => updates(message as HomeDataReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeDataReply create() => HomeDataReply._();
  HomeDataReply createEmptyInstance() => create();
  static $pb.PbList<HomeDataReply> createRepeated() => $pb.PbList<HomeDataReply>();
  @$core.pragma('dart2js:noInline')
  static HomeDataReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeDataReply>(create);
  static HomeDataReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ABanner> get banners => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Article> get topArticles => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Article> get articles => $_getList(2);
}

