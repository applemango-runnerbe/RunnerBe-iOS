// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let appleLogin = ImageAsset(name: "Apple_login")
  internal static let arrowLeft = ImageAsset(name: "Arrow_Left")
  internal static let bookmarkTabIconFocused = ImageAsset(name: "BookmarkTabIcon_focused")
  internal static let bookmarkTabIconNormal = ImageAsset(name: "BookmarkTabIcon_normal")
  internal static let checkBoxIconChecked = ImageAsset(name: "CheckBoxIcon_Checked")
  internal static let checkBoxIconEmpty = ImageAsset(name: "CheckBoxIcon_Empty")
  internal static let chevronRight = ImageAsset(name: "Chevron_right")
  internal static let homeTabIconFocused = ImageAsset(name: "HomeTabIcon_Focused")
  internal static let homeTabIconNormal = ImageAsset(name: "HomeTabIcon_normal")
  internal static let kakaoLogin = ImageAsset(name: "Kakao_login")
  internal static let logoSignature = ImageAsset(name: "Logo_signature")
  internal static let messageTabIconFocused = ImageAsset(name: "MessageTabIcon_focused")
  internal static let messageTabIconNormal = ImageAsset(name: "MessageTabIcon_normal")
  internal static let myPageTabIconFocused = ImageAsset(name: "MyPageTabIcon_focused")
  internal static let myPageTabIconNormal = ImageAsset(name: "MyPageTabIcon_normal")
  internal static let naverLogin = ImageAsset(name: "Naver_login")
  internal static let refresh = ImageAsset(name: "Refresh")
  internal static let upload = ImageAsset(name: "Upload")
  internal static let x = ImageAsset(name: "X")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
