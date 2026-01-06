import 'package:flutter/material.dart';

/// A custom scaffold widget with built-in loading overlay support.
///
/// Wraps [Scaffold] with convenient options for displaying a loading indicator
/// and handles focus management. Automatically dismisses keyboard when tapping
/// outside text fields.
///
/// Example:
/// ```dart
/// KitScaffold(
///   appBar: AppBar(title: Text('Home')),
///   body: MyContent(),
///   isLoading: isLoading,
///   floatingActionButton: FloatingActionButton(onPressed: () {}),
/// )
/// ```
class KitScaffold extends StatelessWidget {
  /// The main content widget displayed in the scaffold body.
  final Widget body;

  /// Background color of the scaffold. Uses theme default if null.
  final Color? backgroundColor;

  /// If true, displays a semi-transparent loading overlay with spinner.
  final bool isLoading;

  /// Optional app bar widget.
  final PreferredSizeWidget? appBar;

  /// Optional bottom sheet widget.
  final Widget? bottomsheet;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// If true, shows an indicator that the feature is unavailable.
  final bool isUnavailableFeatureScreen;

  /// Optional bottom navigation bar or app bar.
  final Widget? bottomAppBar;

  const KitScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.isLoading = false,
    this.appBar,
    this.floatingActionButton,
    this.isUnavailableFeatureScreen = false,
    this.bottomsheet,
    this.bottomAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        bottomSheet: bottomsheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: bottomAppBar,
        appBar: appBar,
        body: Stack(
          fit: StackFit.expand,
          children: [
            body,
            if (isLoading)
              Container(
                color: Colors.black.withValues(alpha: .2),
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
