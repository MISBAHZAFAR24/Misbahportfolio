import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

// Web-only import
import 'resume_pdf_web.dart' if (dart.library.io) 'resume_pdf_io.dart';

class ResumePdfService {
  static Future<void> generateAndDownload() async {
    final Uint8List pdfBytes = await _buildPdf();
    await saveOrDownloadPdf(pdfBytes, 'Misbah_Zafar_Resume.pdf');
  }

  static Future<Uint8List> _buildPdf() async {
    final PdfDocument document = PdfDocument();

    // Page settings
    document.pageSettings.margins.all = 40;
    document.pageSettings.size = PdfPageSize.a4;

    // Colors
    final PdfColor primaryColor = PdfColor(108, 99, 255); // purple
    final PdfColor accentColor = PdfColor(0, 212, 255); // cyan
    final PdfColor darkColor = PdfColor(15, 23, 42);
    final PdfColor grayColor = PdfColor(100, 116, 139);
    final PdfColor lightGray = PdfColor(241, 245, 249);
    final PdfColor white = PdfColor(255, 255, 255);

    // Fonts
    final PdfFont titleFont = PdfStandardFont(
      PdfFontFamily.helvetica,
      26,
      style: PdfFontStyle.bold,
    );
    final PdfFont subtitleFont = PdfStandardFont(
      PdfFontFamily.helvetica,
      13,
      style: PdfFontStyle.bold,
    );
    final PdfFont sectionFont = PdfStandardFont(
      PdfFontFamily.helvetica,
      11,
      style: PdfFontStyle.bold,
    );
    final PdfFont bodyFont = PdfStandardFont(PdfFontFamily.helvetica, 10);
    final PdfFont smallFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    final PdfFont boldBodyFont = PdfStandardFont(
      PdfFontFamily.helvetica,
      10,
      style: PdfFontStyle.bold,
    );

    final PdfPage page = document.pages.add();
    final PdfGraphics g = page.graphics;
    final double pageWidth = page.getClientSize().width;
    final double pageHeight = page.getClientSize().height;

    double y = 0;

    // ── HEADER BACKGROUND ──
    g.drawRectangle(
      brush: PdfSolidBrush(primaryColor),
      bounds: Rect.fromLTWH(0, 0, pageWidth, 110),
    );

    // Accent bar
    g.drawRectangle(
      brush: PdfSolidBrush(accentColor),
      bounds: Rect.fromLTWH(0, 108, pageWidth, 3),
    );

    // Name
    g.drawString(
      'MISBAH ZAFAR',
      titleFont,
      brush: PdfSolidBrush(white),
      bounds: Rect.fromLTWH(0, 18, pageWidth, 35),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    // Title
    g.drawString(
      'Flutter Developer  |  AI/ML Enthusiast  |  Software Engineer',
      subtitleFont,
      brush: PdfSolidBrush(PdfColor(200, 195, 255)),
      bounds: Rect.fromLTWH(0, 52, pageWidth, 20),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    // Contact line
    g.drawString(
      '+91 9990809852   •   zafarhassan3748@gmail.com   •   New Delhi, India',
      smallFont,
      brush: PdfSolidBrush(PdfColor(220, 220, 255)),
      bounds: Rect.fromLTWH(0, 76, pageWidth, 16),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    // Links line
    g.drawString(
      'github.com/MISBAH-ZAFAR24   •   linkedin.com/in/misbah   •   leetcode.com/u/MISBAHZAFAR24',
      smallFont,
      brush: PdfSolidBrush(accentColor),
      bounds: Rect.fromLTWH(0, 92, pageWidth, 14),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    y = 122;

    // ── ABOUT / OBJECTIVE ──
    y = _drawSection(
      g,
      'PROFESSIONAL SUMMARY',
      sectionFont,
      bodyFont,
      primaryColor,
      lightGray,
      darkColor,
      grayColor,
      pageWidth,
      y,
      'Passionate Flutter Developer and AI/ML Enthusiast pursuing B.Tech in Computer Science at Jamia Hamdard, New Delhi. Experienced in building cross-platform mobile applications with hands-on internship experience at Microsoft AI Azure. Proficient in Java, Python, Flutter, and web technologies with a strong foundation in Data Structures & Algorithms and Object-Oriented Programming.',
    );

    // ── EDUCATION ──
    y = _drawSectionHeader(
      g,
      'EDUCATION',
      sectionFont,
      primaryColor,
      lightGray,
      pageWidth,
      y,
    );

    final List<Map<String, String>> education = [
      {
        'institution': 'Jamia Hamdard — B.Tech Computer Science',
        'detail': '2022 – 2026  |  New Delhi  |  Pursuing',
      },
      {
        'institution': 'Victoria Public SR Sec School — 12th Class (CBSE)',
        'detail': '2021 – 2022  |  76.8%',
      },
      {
        'institution': 'Victoria Public SR Sec School — 10th Class (CBSE)',
        'detail': '2019 – 2020  |  70%',
      },
    ];

    for (final edu in education) {
      g.drawString(
        '▸  ${edu['institution']!}',
        boldBodyFont,
        brush: PdfSolidBrush(darkColor),
        bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
      );
      y += 14;
      g.drawString(
        '    ${edu['detail']!}',
        smallFont,
        brush: PdfSolidBrush(grayColor),
        bounds: Rect.fromLTWH(10, y, pageWidth - 10, 13),
      );
      y += 16;
    }
    y += 4;

    // ── SKILLS ──
    y = _drawSectionHeader(
      g,
      'TECHNICAL SKILLS',
      sectionFont,
      primaryColor,
      lightGray,
      pageWidth,
      y,
    );

    final Map<String, String> skills = {
      'Languages': 'Java, Python, Dart',
      'Mobile Development': 'Flutter (Cross-platform)',
      'Web Technologies': 'HTML, CSS, JavaScript',
      'Core CS': 'OOPs, Data Structures & Algorithms (DSA)',
      'Database': 'SQL',
      'AI / ML': 'Machine Learning (Beginner), AI Concepts',
      'Version Control': 'Git, GitHub',
      'APIs': 'REST APIs, API Integration',
    };

    for (final entry in skills.entries) {
      final String line = '${entry.key}:  ${entry.value}';
      g.drawString(
        '▸  $line',
        bodyFont,
        brush: PdfSolidBrush(darkColor),
        bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
      );
      y += 15;
    }
    y += 4;

    // ── INTERNSHIP ──
    y = _drawSectionHeader(
      g,
      'INTERNSHIP EXPERIENCE',
      sectionFont,
      primaryColor,
      lightGray,
      pageWidth,
      y,
    );

    g.drawString(
      'Microsoft AI Azure — AI Intern',
      boldBodyFont,
      brush: PdfSolidBrush(darkColor),
      bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
    );
    y += 14;
    g.drawString(
      '2025  |  Remote / Virtual',
      smallFont,
      brush: PdfSolidBrush(grayColor),
      bounds: Rect.fromLTWH(10, y, pageWidth - 10, 13),
    );
    y += 14;
    g.drawString(
      'Worked on AI and cloud-based solutions using Microsoft Azure AI services. Gained hands-on',
      bodyFont,
      brush: PdfSolidBrush(darkColor),
      bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
    );
    y += 13;
    g.drawString(
      'experience with Azure Cognitive Services, machine learning pipelines, and cloud deployment.',
      bodyFont,
      brush: PdfSolidBrush(darkColor),
      bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
    );
    y += 18;

    // ── PROJECTS ──
    y = _drawSectionHeader(
      g,
      'PROJECTS',
      sectionFont,
      primaryColor,
      lightGray,
      pageWidth,
      y,
    );

    final List<Map<String, String>> projects = [
      {
        'name': 'MEDCARE PLUS — Healthcare Mobile App',
        'desc':
        'A comprehensive Flutter-based healthcare application enabling patients to book appointments,\n    access medical records, and consult doctors remotely. Built with real-time data sync.',
      },
      {
        'name': 'EMOTION DETECTION SYSTEM — AI/ML Project',
        'desc':
        'A Python-based emotion recognition system using computer vision and machine learning to\n    detect and classify human emotions from facial expressions in real-time.',
      },
    ];

    for (final proj in projects) {
      g.drawString(
        '▸  ${proj['name']!}',
        boldBodyFont,
        brush: PdfSolidBrush(darkColor),
        bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
      );
      y += 14;
      for (final line in proj['desc']!.split('\n')) {
        g.drawString(
          line,
          bodyFont,
          brush: PdfSolidBrush(grayColor),
          bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
        );
        y += 13;
      }
      y += 6;
    }

    // ── CERTIFICATIONS ──
    y = _drawSectionHeader(
      g,
      'CERTIFICATIONS',
      sectionFont,
      primaryColor,
      lightGray,
      pageWidth,
      y,
    );

    final List<Map<String, String>> certs = [
      {'name': 'Computer Training Certificate', 'year': '2025'},
      {
        'name': 'Hacksphere by Copy Code — Hackathon Certificate',
        'year': '2025',
      },
      {
        'name': 'Snapchat AR Lenses — Augmented Reality Certificate',
        'year': '2025',
      },
    ];

    for (final cert in certs) {
      g.drawString(
        '▸  ${cert['name']!}  (${cert['year']!})',
        bodyFont,
        brush: PdfSolidBrush(darkColor),
        bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
      );
      y += 15;
    }
    y += 4;

    // ── INTERESTS ──
    y = _drawSectionHeader(
      g,
      'INTERESTS',
      sectionFont,
      primaryColor,
      lightGray,
      pageWidth,
      y,
    );

    g.drawString(
      'Gaming   •   Travelling   •   Competitive Programming   •   Problem Solving   •   Open Source',
      bodyFont,
      brush: PdfSolidBrush(darkColor),
      bounds: Rect.fromLTWH(10, y, pageWidth - 10, 14),
    );
    y += 20;

    // ── FOOTER ──
    g.drawRectangle(
      brush: PdfSolidBrush(lightGray),
      bounds: Rect.fromLTWH(0, pageHeight - 28, pageWidth, 28),
    );
    g.drawString(
      'Generated from Misbah Zafar\'s Portfolio App  •  2025',
      smallFont,
      brush: PdfSolidBrush(grayColor),
      bounds: Rect.fromLTWH(0, pageHeight - 18, pageWidth, 14),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    final Uint8List bytes = Uint8List.fromList(await document.save());
    document.dispose();
    return bytes;
  }

  static double _drawSectionHeader(
      PdfGraphics g,
      String title,
      PdfFont font,
      PdfColor primaryColor,
      PdfColor bgColor,
      double pageWidth,
      double y,
      ) {
    g.drawRectangle(
      brush: PdfSolidBrush(bgColor),
      bounds: Rect.fromLTWH(0, y, pageWidth, 20),
    );
    g.drawRectangle(
      brush: PdfSolidBrush(primaryColor),
      bounds: Rect.fromLTWH(0, y, 4, 20),
    );
    g.drawString(
      title,
      font,
      brush: PdfSolidBrush(primaryColor),
      bounds: Rect.fromLTWH(10, y + 4, pageWidth - 10, 16),
    );
    return y + 26;
  }

  static double _drawSection(
      PdfGraphics g,
      String title,
      PdfFont sectionFont,
      PdfFont bodyFont,
      PdfColor primaryColor,
      PdfColor bgColor,
      PdfColor darkColor,
      PdfColor grayColor,
      double pageWidth,
      double y,
      String content,
      ) {
    y = _drawSectionHeader(
      g,
      title,
      sectionFont,
      primaryColor,
      bgColor,
      pageWidth,
      y,
    );
    g.drawString(
      content,
      bodyFont,
      brush: PdfSolidBrush(darkColor),
      bounds: Rect.fromLTWH(10, y, pageWidth - 10, 40),
      format: PdfStringFormat(wordWrap: PdfWordWrapType.word),
    );
    y += 42;
    return y;
  }
}