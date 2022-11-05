import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_backend/components/hello.dart';
import 'package:dart_frog_backend/utils.dart';

Future<Response> onRequest(RequestContext context, String name) {
  return renderJasprComponent(context, Hello(name: name));
}
