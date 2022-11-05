import 'package:toolbox/core/persistant_store.dart';
import 'package:toolbox/data/model/server/server_private_info.dart';

class ServerStore extends PersistentStore {
  void put(ServerPrivateInfo info) {
    box.put(info.id, info);
  }

  List<ServerPrivateInfo> fetch() {
    final ids = box.keys;
    final List<ServerPrivateInfo> ss = [];
    for (final id in ids) {
      final s = box.get(id);
      if (s != null) {
        ss.add(s);
      }
    }
    return ss;
  }

  void delete(ServerPrivateInfo s) {
    box.delete(s.id);
  }

  void update(ServerPrivateInfo old, ServerPrivateInfo newInfo) {
    if (!have(old)) {
      throw Exception('Old ServerPrivateInfo not found');
    }
    put(newInfo);
  }

  bool have(ServerPrivateInfo s) => box.get(s.id) != null;
}
