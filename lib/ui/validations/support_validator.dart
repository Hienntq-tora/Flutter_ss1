import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/validations/validators.dart';
import 'package:time_tracker/utils/util.dart';

class SupportValidators {
  static FormFieldValidator<T> compose<T>(
      List<FormFieldValidator<T>> validators) {
    return (valueCandidate) {
      for (var validator in validators) {
        final validationResult = validator.call(valueCandidate);
        if (validationResult != null) {
          return validationResult;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> required<T>({
    required String fieldName,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate == null ||
          (valueCandidate is String && valueCandidate.trim().isEmpty) ||
          (valueCandidate is Iterable && valueCandidate.isEmpty) ||
          (valueCandidate is Map && valueCandidate.isEmpty)) {
        return errorText ?? LocaleKeys.validationEmpty.tr(args: [fieldName]);
      }
      return null;
    };
  }

  static FormFieldValidator<T> equal<T>(Object value,
          {required String fieldName, String? errorText}) =>
      (valueCandidate) =>
          valueCandidate != value ? errorText ?? LocaleKeys.appTitle : null;

  static FormFieldValidator<T> notEqual<T>(Object value, {String? errorText}) =>
      (valueCandidate) =>
          valueCandidate == value ? errorText ?? LocaleKeys.appTitle : null;

  static FormFieldValidator<T> min<T>(
    num min, {
    required String fieldName,
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num
            ? valueCandidate
            : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number < min : number <= min)) {
          return errorText ?? LocaleKeys.appTitle;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> max<T>(
    num max, {
    required String fieldName,
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num
            ? valueCandidate
            : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number > max : number >= max)) {
          return errorText ?? LocaleKeys.appTitle;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> minLength<T>(int minLength,
      {required String fieldName, bool allowEmpty = false, String? errorText}) {
    assert(minLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate == null);
      var valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return valueLength < minLength && (!allowEmpty || valueLength > 0)
          ? errorText ?? LocaleKeys.appTitle
          : null;
    };
  }

  static FormFieldValidator<T> maxLength<T>(
    int maxLength, {
    required String fieldName,
    String? errorText,
  }) {
    assert(maxLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate == null);
      int valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return null != valueCandidate && valueLength > maxLength
          ? errorText ??
              LocaleKeys.validationLength
                  .tr(args: [fieldName, maxLength.toString()])
          : null;
    };
  }

  static FormFieldValidator<T> inRangeLength<T>(
    int minLength,
    int maxLength, {
    required String fieldName,
    String? errorText,
  }) {
    assert(maxLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate == null);
      int valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return null != valueCandidate &&
              (valueLength > maxLength || valueLength < minLength)
          ? errorText ??
              LocaleKeys.validationLengthRange.tr(
                  args: [fieldName, minLength.toString(), maxLength.toString()])
          : null;
    };
  }

  static FormFieldValidator<T> equalLength<T>(
    int length, {
    required String fieldName,
    bool allowEmpty = false,
    String? errorText,
  }) {
    assert(length > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate is int ||
          valueCandidate == null);
      int valueLength = 0;

      if (valueCandidate is int) valueLength = valueCandidate.toString().length;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;

      return valueLength != length && (!allowEmpty || valueLength > 0)
          ? errorText ?? LocaleKeys.appTitle
          : null;
    };
  }

  static FormFieldValidator<String> email({
    required String fieldName,
    String? errorText,
  }) =>
      (valueCandidate) =>
          (valueCandidate?.isNotEmpty ?? false) && !isEmail(valueCandidate!)
              ? errorText ?? LocaleKeys.validationEmail.tr(args: [fieldName])
              : null;

  static FormFieldValidator<String> phone({
    String? errorText,
  }) =>
      (valueCandidate) =>
          (valueCandidate?.isNotEmpty ?? false) && !isPhone(valueCandidate!)
              ? errorText ?? LocaleKeys.appTitle
              : null;

  static FormFieldValidator<String> match(
    String pattern, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !RegExp(pattern).hasMatch(valueCandidate!)
          ? errorText ?? LocaleKeys.appTitle
          : null;

  static FormFieldValidator<String> numeric({
    required String fieldName,
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              null == num.tryParse(valueCandidate!)
          ? errorText ?? LocaleKeys.appTitle
          : null;

  static FormFieldValidator<String> integer(
          {required String fieldName, String? errorText, int? radix}) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              null == int.tryParse(valueCandidate!, radix: radix)
          ? errorText ?? LocaleKeys.appTitle
          : null;

  static FormFieldValidator<String> dateString({
    required String fieldName,
    String? errorText,
  }) =>
      (valueCandidate) =>
          true == valueCandidate?.isNotEmpty && !isDate(valueCandidate!)
              ? errorText ?? LocaleKeys.appTitle
              : null;

  static FormFieldValidator<File> file(
    int maxSize,
    FileCapacityUnit unit, {
    required String fieldName,
    String? errorText,
  }) {
    assert(maxSize > 0);
    return (valueCandidate) {
      const suffixes = [
        FileCapacityUnit.b,
        FileCapacityUnit.kb,
        FileCapacityUnit.mb,
        FileCapacityUnit.gb
      ];

      return (valueCandidate != null &&
              valueCandidate.lengthSync().toDouble() /
                      pow(1024, suffixes.indexOf(unit)) >
                  maxSize)
          ? errorText ?? LocaleKeys.appTitle
          : null;
    };
  }

  static FormFieldValidator<String> name({
    required String fieldName,
  }) {
    return match(
      spaceAlphanumerical.pattern,
      errorText: LocaleKeys.validationAs.tr(
        args: [
          fieldName.tr(),
          LocaleKeys.inputFormatSpaceAlphanumerical.tr(),
        ],
      ),
    );
  }

  static FormFieldValidator<String> password({String? field}) {
    return match(
      alphanumericalSpecialChars.pattern,
      errorText: LocaleKeys.validationAs.tr(
        args: [
          field ?? LocaleKeys.fieldPassword.tr(),
          LocaleKeys.inputFormatAlphanumericalSpecialChars1.tr(),
        ],
      ),
    );
  }

  static FormFieldValidator<String> confirmPassword(
      {required TextEditingController? controller}) {
    return (valueCandidate) {
      if (!valueCandidate.isEmptyOrNull) {
        if (valueCandidate != controller?.text) {
          return LocaleKeys.validationConfirmPasswordNotMatch.tr();
        }
      }
      return null;
    };
  }

  static FormFieldValidator<String> description({required String fieldName}) {
    return match(
      alphanumericalSpecialChars2.pattern,
      errorText: LocaleKeys.validationAs.tr(
        args: [
          fieldName,
          LocaleKeys.inputFormatSpaceAlphanumericalSpecialChars2.tr(),
        ],
      ),
    );
  }


  static FormFieldValidator<String> link({required String errorText}) {
    return match(linkRegex.pattern, errorText: errorText);
  }

  static FormFieldValidator<File> fileRequired({
    String? fileUrl,
    required String fieldName,
    String? errorText,
  }) =>
      (valueCandidate) => (valueCandidate == null && fileUrl == null)
          ? errorText ?? LocaleKeys.validationFileRequired.tr(args: [fieldName])
          : null;
}
enum FileCapacityUnit { gb, mb, kb, b }
