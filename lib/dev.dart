import 'package:newGetxCLI/app.dart';
import 'package:newGetxCLI/utils/api/app_envirments.dart';

void main() async {
  App.instance.initAndRunApp(
    devMode: false,
    appLog: false,
    apiLog: false,
    setDefault: true,
    samplePayment: true,
    baseURLType: AtomURLType.DEV,
  );
}
