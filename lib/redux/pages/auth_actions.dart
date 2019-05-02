import 'dart:ui';
import 'package:flulabs/models/loading_status.dart';
import 'screen_state.dart';

class ChangeScreenStateAction {
  final ScreenState type;
  ChangeScreenStateAction(this.type);
}

class ChangeLoadingStatusAction {
  final LoadingStatus status;
  ChangeLoadingStatusAction(this.status);
}

class SaveTokenAction {
  final String token;
  SaveTokenAction(this.token);
}

class CheckTokenAction {
  final VoidCallback hasTokenCallback;
  final VoidCallback noTokenCallback;

  CheckTokenAction({this.hasTokenCallback, this.noTokenCallback});
}

class NavigateToProductAction {}
