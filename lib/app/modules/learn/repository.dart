import '../../data/provider/api.dart';

class LearnRepository {
  final LimeApi api;

  LearnRepository(this.api);

  getAll() {
    return api.getAll();
  }

  getId(id) {
    return api.getId(id);
  }

  delete(id) {
    return api.delete(id);
  }

  edit(obj) {
    return api.edit(obj);
  }

  add(obj) {
    return api.add(obj);
  }
}
