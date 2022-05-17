import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends Controller {

  @override
  void construct(BuildContext context) {
    super.construct(context);
  }

  Future<void> onTapDocumentation() async {
    await launch("https://nylo.dev/docs");
  }

  Future<void> onTapGithub() async {
    await launch("https://github.com/nylo-core/nylo");
  }

  Future<void> onTapChangeLog() async {
    await launch("https://github.com/nylo-core/framework/blob/2.x/CHANGELOG.md");
  }

  void onTapRouteToPizza() {
    if(context != null) {
      Navigator.of(context!).pushNamed('/pizza');
    }
  }
}
