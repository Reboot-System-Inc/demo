part of 'extensions.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get local => AppLocalizations.of(this);
}
