import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/redux/dashboard/dashboard_actions.dart';

import 'app_drawer_vm.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {@required this.appBar,
      @required this.body,
      @required this.bottomNavigationBar,
      @required this.floatingActionButton});

  final Widget appBar;
  final Widget body;
  final Widget bottomNavigationBar;
  final Widget floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    return WillPopScope(
        onWillPop: () async {
          store.dispatch(ViewDashboard(context: context));
          return false;
        },
        child: Scaffold(
          drawer: AppDrawerBuilder(),
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ));
  }
}