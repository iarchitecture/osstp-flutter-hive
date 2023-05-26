import 'package:osstp_network/osstp_network.dart';

import '../model/home_model.dart';

class HomeSwiperApi extends OsstpRequest<AutoIndexResponseModel> {
  /// 接口
  @override
  get path => "/auto/index";

  @override
  get parameter => {
        'num': '20',
      };
}
