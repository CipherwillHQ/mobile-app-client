// Captures navigation and loading events for native wrapper tests.
// Owns callbacks invoked by the fake WebView.
// Does not instantiate Android or iOS browser controls.
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class FakeNavigationDelegate extends PlatformNavigationDelegate {
  NavigationRequestCallback? navigate;
  ProgressCallback? progress;
  UrlChangeCallback? changed;
  PageEventCallback? finished;
  WebResourceErrorCallback? resourceError;
  FakeNavigationDelegate(super.params) : super.implementation();
  @override
  Future<void> setOnNavigationRequest(
    NavigationRequestCallback onNavigationRequest,
  ) async {
    navigate = onNavigationRequest;
  }

  @override
  Future<void> setOnProgress(ProgressCallback onProgress) async {
    progress = onProgress;
  }

  @override
  Future<void> setOnUrlChange(UrlChangeCallback onUrlChange) async {
    changed = onUrlChange;
  }

  @override
  Future<void> setOnPageFinished(PageEventCallback onPageFinished) async {
    finished = onPageFinished;
  }

  @override
  Future<void> setOnWebResourceError(
    WebResourceErrorCallback onWebResourceError,
  ) async {
    resourceError = onWebResourceError;
  }
}
