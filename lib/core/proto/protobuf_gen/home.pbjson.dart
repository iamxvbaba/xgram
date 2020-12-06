///
//  Generated code. Do not modify.
//  source: home.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ABanner$json = const {
  '1': 'ABanner',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'desc', '3': 2, '4': 1, '5': 9, '10': 'desc'},
    const {'1': 'imagePath', '3': 3, '4': 1, '5': 9, '10': 'imagePath'},
    const {'1': 'isVisible', '3': 4, '4': 1, '5': 3, '10': 'isVisible'},
    const {'1': 'order', '3': 5, '4': 1, '5': 3, '10': 'order'},
    const {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'type', '3': 7, '4': 1, '5': 3, '10': 'type'},
    const {'1': 'url', '3': 8, '4': 1, '5': 9, '10': 'url'},
  ],
};

const TagsBean$json = const {
  '1': 'TagsBean',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

const Article$json = const {
  '1': 'Article',
  '2': const [
    const {'1': 'apkLink', '3': 1, '4': 1, '5': 9, '10': 'apkLink'},
    const {'1': 'author', '3': 2, '4': 1, '5': 9, '10': 'author'},
    const {'1': 'shareUser', '3': 3, '4': 1, '5': 9, '10': 'shareUser'},
    const {'1': 'chapterId', '3': 4, '4': 1, '5': 3, '10': 'chapterId'},
    const {'1': 'chapterName', '3': 5, '4': 1, '5': 9, '10': 'chapterName'},
    const {'1': 'collect', '3': 6, '4': 1, '5': 8, '10': 'collect'},
    const {'1': 'courseId', '3': 7, '4': 1, '5': 3, '10': 'courseId'},
    const {'1': 'desc', '3': 8, '4': 1, '5': 9, '10': 'desc'},
    const {'1': 'envelopePic', '3': 9, '4': 1, '5': 9, '10': 'envelopePic'},
    const {'1': 'fresh', '3': 10, '4': 1, '5': 8, '10': 'fresh'},
    const {'1': 'id', '3': 11, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'link', '3': 12, '4': 1, '5': 9, '10': 'link'},
    const {'1': 'niceDate', '3': 13, '4': 1, '5': 9, '10': 'niceDate'},
    const {'1': 'origin', '3': 14, '4': 1, '5': 9, '10': 'origin'},
    const {'1': 'originId', '3': 15, '4': 1, '5': 3, '10': 'originId'},
    const {'1': 'prefix', '3': 16, '4': 1, '5': 9, '10': 'prefix'},
    const {'1': 'projectLink', '3': 17, '4': 1, '5': 9, '10': 'projectLink'},
    const {'1': 'publishTime', '3': 18, '4': 1, '5': 3, '10': 'publishTime'},
    const {'1': 'superChapterId', '3': 19, '4': 1, '5': 3, '10': 'superChapterId'},
    const {'1': 'superChapterName', '3': 20, '4': 1, '5': 9, '10': 'superChapterName'},
    const {'1': 'tags', '3': 21, '4': 3, '5': 11, '6': '.api.TagsBean', '10': 'tags'},
    const {'1': 'title', '3': 22, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'type', '3': 23, '4': 1, '5': 3, '10': 'type'},
    const {'1': 'userId', '3': 24, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'visible', '3': 25, '4': 1, '5': 3, '10': 'visible'},
    const {'1': 'zan', '3': 26, '4': 1, '5': 3, '10': 'zan'},
  ],
};

const HomeDataArg$json = const {
  '1': 'HomeDataArg',
  '2': const [
    const {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
  ],
};

const HomeDataReply$json = const {
  '1': 'HomeDataReply',
  '2': const [
    const {'1': 'banners', '3': 1, '4': 3, '5': 11, '6': '.api.ABanner', '10': 'banners'},
    const {'1': 'topArticles', '3': 2, '4': 3, '5': 11, '6': '.api.Article', '10': 'topArticles'},
    const {'1': 'articles', '3': 3, '4': 3, '5': 11, '6': '.api.Article', '10': 'articles'},
  ],
};

