import 'package:flutter/material.dart';
import 'package:project_name/presentation/core/widgets/background_widget.dart';

class AppScaffold extends Scaffold {
  AppScaffold({
    super.key,
    super.appBar,
    Widget? body,
    Widget? background,
    Widget? bottom,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset = true,
    super.primary = true,
    super.drawerDragStartBehavior,
    super.extendBody = false,
    super.extendBodyBehindAppBar = false,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture = true,
    super.endDrawerEnableOpenDragGesture = true,
    super.restorationId,
  }) : super(
          body: Stack(
            fit: StackFit.expand,
            children: [
              background ?? const BackgroundWidget(),
              if (body != null) body,
              if (bottom != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: bottom,
                ),
            ],
          ),
        );
}
