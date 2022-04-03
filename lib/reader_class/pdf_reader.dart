import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReader extends StatefulWidget {
  final String url;
  final String name;

  PdfReader({Key key, this.name, this.url}) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  PDFDocument pdfDocument;

  loadPdf() async {
    pdfDocument = await PDFDocument.fromURL(widget.url);
    // int pageCount = pdfDocument.count;

    // PDFPage pageOne = await pdfDocument.get(page:);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  operatingPdf() async {
    PdfDocument document =
        PdfDocument(inputBytes: File(widget.url).readAsBytesSync());

//Gets the pages count
    int pageCount = document.pages.count;
    print('This is the count $pageCount');

//Disposes the document
   document.dispose();
  }

  @override
  void initState() {
 //   operatingPdf();
    loadPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child:
            // isLoading
            //     ? Center(
            //         child: SpinKitSpinningLines(lineWidth: 5,
            //           color: Colors.black,
            //           size: 50.0,
            //           controller: AnimationController(
            //             vsync: this,
            //             duration: const Duration(milliseconds: 1200),
            //           ),
            //         ),
            //       )
            //     :
            SfPdfViewer.network(
          widget.url,
          scrollDirection: PdfScrollDirection.vertical,
        ),
      ),
    );
  }
}
