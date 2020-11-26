abstract class KeyStorageService {
  bool hasNotificationsEnabled;
  void set(String key,dynamic value);
  void del(String key);
  dynamic get(String key);
}
