import 'package:crud_api/core/theme/src/colors.dart';
import 'package:crud_api/core/theme/src/spacing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Extension for [Theme]
extension ThemeExt on BuildContext {
  AppColorScheme get colors {
    return Theme.of(this).extension<AppColorScheme>()!;
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }
}

/// Extension for all type of modals
extension ModalExt on BuildContext {
  void showBottomModal({
    required Widget Function(BuildContext context) builder,
    String? title,
  }) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: colors.pureWhite,
      context: this,
      builder: (modalContext) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewPaddingOf(this).bottom / 2,
        ),
        // padding: const EdgeInsets.only(left: Spacing.normal, right: Spacing.normal),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Spacing.normal),
                    child: Text(
                      title,
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // const SizedBox(
                  //   height: Spacing.normal,
                  // ),
                  Divider(
                    height: 1,
                    color: colors.lightShadeGrey30,
                  ),
                ],
              ),
            Container(
              padding: const EdgeInsets.all(
                Spacing.normal,
              ),
              child: builder(modalContext),
            ),
          ],
        ),
      ),
    );
  }

  void showLoadingDialog() {
    showDialog<bool>(
      context: this,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void hideLoadingDialog({bool forceUnfocus = true}) {
    if (forceUnfocus) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
    Navigator.of(this).pop();
  }
}

extension DateTimeExtension on DateTime {
  String timeAgo({
    bool numericDates = true,
    DateTime? date,
    //  Locale locale = Locales.en,
  }) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if (difference.inDays == 7) {
      return numericDates ? '1w' : 'Last week';
    } else if (difference.inDays > 7) {
      return DateFormat('dd MMM yyyy').format(date ?? date2);
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1d ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1h ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} m ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1m ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s ago';
    } else {
      return 'Just now';
    }

    // if (locale == Locales.km) {
    //   if (difference.inDays == 7) {
    //     return (numericDates) ? '1 អាទិត្យ' : 'អាទិត្យមុន';
    //   } else if (difference.inDays > 7) {
    //     return DateFormat(
    //             'dd MMM yyyy', locale.toStringWithSeparator(separator: '_'))
    //         .format(date ?? date2);
    //   } else if (difference.inDays >= 2) {
    //     return '${difference.inDays} ថ្ងៃមុន';
    //   } else if (difference.inDays >= 1) {
    //     return (numericDates) ? '1 ថ្ងៃមុន' : 'ម្សិលមិញ';
    //   } else if (difference.inHours >= 2) {
    //     return '${difference.inHours} ម៉ោងមុន';
    //   } else if (difference.inHours >= 1) {
    //     return (numericDates) ? '1 ម៉ោងមុន' : '1 ម៉ោងមុន';
    //   } else if (difference.inMinutes >= 2) {
    //     return '${difference.inMinutes} នាទីមុន';
    //   } else if (difference.inMinutes >= 1) {
    //     return (numericDates) ? '1 នាទីមុន' : '1 នាទីមុន';
    //   } else if (difference.inSeconds >= 3) {
    //     return '${difference.inSeconds} វិនាទីមុន';
    //   } else {
    //     return 'ឥឡូវនេះ';
    //   }
    // } else {
    //   if (difference.inDays == 7) {
    //     return (numericDates) ? '1 week' : 'Last week';
    //   } else if (difference.inDays > 7) {
    //     return DateFormat('dd MMM yyyy').format(date ?? date2);
    //   } else if (difference.inDays >= 2) {
    //     return '${difference.inDays} days ago';
    //   } else if (difference.inDays >= 1) {
    //     return (numericDates) ? '1 day ago' : 'Yesterday';
    //   } else if (difference.inHours >= 2) {
    //     return '${difference.inHours} hours ago';
    //   } else if (difference.inHours >= 1) {
    //     return (numericDates) ? '1 hour ago' : 'An hour ago';
    //   } else if (difference.inMinutes >= 2) {
    //     return '${difference.inMinutes} minutes ago';
    //   } else if (difference.inMinutes >= 1) {
    //     return (numericDates) ? '1 minute ago' : 'A minute ago';
    //   } else if (difference.inSeconds >= 3) {
    //     return '${difference.inSeconds} seconds ago';
    //   } else {
    //     return 'Just now';
    //   }
    // }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(
    RegExp(' +'),
    ' ',
  ).split(' ').map((str) => str.toCapitalized()).join(' ');

  int countChar(String char) => char.allMatches(this).length;
}
