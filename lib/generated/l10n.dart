// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tabbar_home {
    return Intl.message(
      'Home',
      name: 'tabbar_home',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get tabbar_favorite {
    return Intl.message(
      'Favorite',
      name: 'tabbar_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get tabbar_mine {
    return Intl.message(
      'Mine',
      name: 'tabbar_mine',
      desc: '',
      args: [],
    );
  }

  /// `Module`
  String get tabbar_module {
    return Intl.message(
      'Module',
      name: 'tabbar_module',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get tabbar_more {
    return Intl.message(
      'More',
      name: 'tabbar_more',
      desc: '',
      args: [],
    );
  }

  /// `Rolling Banner`
  String get home_banner {
    return Intl.message(
      'Rolling Banner',
      name: 'home_banner',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get mine_title {
    return Intl.message(
      'Service',
      name: 'mine_title',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get mine_favorite {
    return Intl.message(
      'Favorite',
      name: 'mine_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Template`
  String get mine_template {
    return Intl.message(
      'Template',
      name: 'mine_template',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting_setting {
    return Intl.message(
      'Setting',
      name: 'setting_setting',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get setting_reset {
    return Intl.message(
      'Reset',
      name: 'setting_reset',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to reset?`
  String get setting_reset_or_not {
    return Intl.message(
      'Do you want to reset?',
      name: 'setting_reset_or_not',
      desc: '',
      args: [],
    );
  }

  /// `Note: After resetting (Clearing user information and initializing the local database and will clear all saved data), preview the default content`
  String get setting_reset_description {
    return Intl.message(
      'Note: After resetting (Clearing user information and initializing the local database and will clear all saved data), preview the default content',
      name: 'setting_reset_description',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get setting_language {
    return Intl.message(
      'Change Language',
      name: 'setting_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get setting_theme {
    return Intl.message(
      'Change Theme',
      name: 'setting_theme',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get setting_default_system {
    return Intl.message(
      'System',
      name: 'setting_default_system',
      desc: '',
      args: [],
    );
  }

  /// `After it is enabled, it will follow the system to turn on or off the dark mode`
  String get setting_system_description {
    return Intl.message(
      'After it is enabled, it will follow the system to turn on or off the dark mode',
      name: 'setting_system_description',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get setting_handle_select {
    return Intl.message(
      'Manual',
      name: 'setting_handle_select',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get setting_normal_type {
    return Intl.message(
      'Normal',
      name: 'setting_normal_type',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get setting_dark_type {
    return Intl.message(
      'Dark',
      name: 'setting_dark_type',
      desc: '',
      args: [],
    );
  }

  /// `Current Language`
  String get setting_current_language {
    return Intl.message(
      'Current Language',
      name: 'setting_current_language',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Setting`
  String get setting_auth {
    return Intl.message(
      'Authentication Setting',
      name: 'setting_auth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter...`
  String get home_edit_placeholder {
    return Intl.message(
      'Please enter...',
      name: 'home_edit_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get home_edit_preview {
    return Intl.message(
      'Preview',
      name: 'home_edit_preview',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get edit_draft {
    return Intl.message(
      'Draft',
      name: 'edit_draft',
      desc: '',
      args: [],
    );
  }

  /// `Save draft`
  String get edit_save_draft {
    return Intl.message(
      'Save draft',
      name: 'edit_save_draft',
      desc: '',
      args: [],
    );
  }

  /// `Edit Template`
  String get home_edit_template {
    return Intl.message(
      'Edit Template',
      name: 'home_edit_template',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get setting_about {
    return Intl.message(
      'About',
      name: 'setting_about',
      desc: '',
      args: [],
    );
  }

  /// `Function introduced`
  String get setting_about_function_introduced {
    return Intl.message(
      'Function introduced',
      name: 'setting_about_function_introduced',
      desc: '',
      args: [],
    );
  }

  /// `Comments or Suggestions`
  String get setting_about_comments_suggestions {
    return Intl.message(
      'Comments or Suggestions',
      name: 'setting_about_comments_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Checking the new version`
  String get setting_about_check_new_version {
    return Intl.message(
      'Checking the new version',
      name: 'setting_about_check_new_version',
      desc: '',
      args: [],
    );
  }

  /// `All rights reserved`
  String get setting_about_all_rights_reserved {
    return Intl.message(
      'All rights reserved',
      name: 'setting_about_all_rights_reserved',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get general_edit {
    return Intl.message(
      'Edit',
      name: 'general_edit',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get general_save {
    return Intl.message(
      'save',
      name: 'general_save',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get general_submit {
    return Intl.message(
      'Submit',
      name: 'general_submit',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get general_confirm {
    return Intl.message(
      'Confirm',
      name: 'general_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get general_close {
    return Intl.message(
      'Close',
      name: 'general_close',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get general_cancel {
    return Intl.message(
      'Cancel',
      name: 'general_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get general_add {
    return Intl.message(
      'Add',
      name: 'general_add',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get general_clear {
    return Intl.message(
      'Clear',
      name: 'general_clear',
      desc: '',
      args: [],
    );
  }

  /// `Pull up load`
  String get general_pull_up_load {
    return Intl.message(
      'Pull up load',
      name: 'general_pull_up_load',
      desc: '',
      args: [],
    );
  }

  /// `Load Failed!Click retry!`
  String get general_Load_Failed_Click_retry {
    return Intl.message(
      'Load Failed!Click retry!',
      name: 'general_Load_Failed_Click_retry',
      desc: '',
      args: [],
    );
  }

  /// `Release to load more`
  String get general_release_to_load_more {
    return Intl.message(
      'Release to load more',
      name: 'general_release_to_load_more',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get general_no_more_data {
    return Intl.message(
      'No more data',
      name: 'general_no_more_data',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get product_stock {
    return Intl.message(
      'Stock',
      name: 'product_stock',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
