// Covers native app-switcher snapshots when Cipherwill becomes inactive
// Owns a privacy cover above the Flutter window.
// Does not authenticate users or retain vault data.

import Flutter
import UIKit
class SceneDelegate: FlutterSceneDelegate {
  private var privacyCover: UIView?
  override func sceneWillResignActive(_ scene: UIScene) {
    super.sceneWillResignActive(scene)
    guard let window = window else { return }
    let cover = UIView(frame: window.bounds)
    cover.backgroundColor = UIColor(red: 0, green: 62/255, blue: 203/255, alpha: 1)
    cover.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    window.addSubview(cover); privacyCover = cover
  }
  override func sceneDidBecomeActive(_ scene: UIScene) {
    super.sceneDidBecomeActive(scene)
    privacyCover?.removeFromSuperview(); privacyCover = nil
  }
}
