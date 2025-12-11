import 'package:akahu_mobile/features/foundation/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueExtension<T> on AsyncValue<T> {
  Widget? load() {
    if(isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if(hasError) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            error.toString(),
            style: AppText.subtitle.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return null;
  }
}

extension AsyncSnapshotExtension<T> on AsyncSnapshot<T> {
  Widget? load() {
    if (connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (hasError) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            error.toString(),
            style: AppText.subtitle.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return null;
  }
}