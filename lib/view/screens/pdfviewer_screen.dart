import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  PdfViewerScreen({required this.url});

  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.network(Uri.parse(url).toString()));
}
}