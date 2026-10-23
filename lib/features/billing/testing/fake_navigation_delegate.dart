// Captures native navigation events for upgrade contract tests.
// Owns deterministic loading, resource failures and navigation callbacks.
// Does not instantiate an Android or iOS WebView.
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class FakeNavigationDelegate extends PlatformNavigationDelegate {
  NavigationRequestCallback? navigate;
  PageEventCallback? started;
  ProgressCallback? progress;
  WebResourceErrorCallback? resourceError;
  HttpResponseErrorCallback? httpError;
  FakeNavigationDelegate(super.params) : super.implementation();
  @override
  Future<void> setOnNavigationRequest(
    NavigationRequestCallback onNavigationRequest,
  ) async {
    navigate = onNavigationRequest;
  }

  @override
  Future<void> setOnPageStarted(PageEventCallback onPageStarted) async {
    started = onPageStarted;
  }

  @override
  Future<void> setOnProgress(ProgressCallback onProgress) async {
    progress = onProgress;
  }

  @override
  Future<void> setOnWebResourceError(
    WebResourceErrorCallback onWebResourceError,
  ) async {
    resourceError = onWebResourceError;
  }

  @override
  Future<void> setOnHttpError(HttpResponseErrorCallback onHttpError) async {
    httpError = onHttpError;
  }
}
