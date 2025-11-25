import 'package:newGetxCLI/app.dart';
import 'package:newGetxCLI/utils/api/app_envirments.dart';

void main() async {
  App.instance.initAndRunApp(
    devMode: true,
    appLog: true,
    apiLog: false,
    setDefault: true,
    samplePayment: true,
    baseURLType: AtomURLType.PROD,
  );
}
