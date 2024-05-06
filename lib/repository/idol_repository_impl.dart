import 'package:flutter_leanr_byjun0302/data_source/idol_data_source.dart';
import 'package:flutter_leanr_byjun0302/model/idol.dart';

import 'idol_repositroy.dart';

class IdolRepositoryImpl implements IdolRepository {
  final IdolDataSource _dataSource;

  IdolRepositoryImpl(this._dataSource);

  @override
  List<Idol> getIdols() => _dataSource.getIdols();
}