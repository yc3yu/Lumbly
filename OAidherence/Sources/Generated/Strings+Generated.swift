// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum MainTabBar {
    /// Activity
    internal static let activity = L10n.tr("Localizable", "MainTabBar.activity", fallback: "Activity")
    /// Localizable.strings
    ///   OAidherence
    /// 
    ///   Created by Yue chen Yu on 2022-10-31.
    internal static let exercise = L10n.tr("Localizable", "MainTabBar.exercise", fallback: "Exercise")
    /// Profile
    internal static let profile = L10n.tr("Localizable", "MainTabBar.profile", fallback: "Profile")
  }
  internal enum ResultsView {
    /// No problems were detected in this session. Well done!
    internal static let noProblemsDetected = L10n.tr("Localizable", "ResultsView.noProblemsDetected", fallback: "No problems were detected in this session. Well done!")
    /// Problem
    internal static let problem = L10n.tr("Localizable", "ResultsView.problem", fallback: "Problem")
    /// Problems
    internal static let problems = L10n.tr("Localizable", "ResultsView.problems", fallback: "Problems")
    /// Problems or Well-Done
    internal static let problemsOrWellDone = L10n.tr("Localizable", "ResultsView.problemsOrWellDone", fallback: "Problems or Well-Done")
    /// Results
    internal static let results = L10n.tr("Localizable", "ResultsView.results", fallback: "Results")
    /// Solution
    internal static let solution = L10n.tr("Localizable", "ResultsView.solution", fallback: "Solution")
    /// Well-Done
    internal static let welldone = L10n.tr("Localizable", "ResultsView.welldone", fallback: "Well-Done")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
