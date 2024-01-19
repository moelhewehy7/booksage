import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchurl(context, String url) async {
  Uri uri = Uri.parse(url);

  try {
    await launchUrl(uri);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error launching URL: $e'),
      ),
    );
  }
}
