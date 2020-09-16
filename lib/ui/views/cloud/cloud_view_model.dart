import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/repositories/posts_repository/posts_repository.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class CloudViewModel extends BaseViewModel {
  final _postsRepository = locator<PostsRepository>();
  final _log = Logger('CloudViewModel');
}
