class MyCourse {
  MyCourse({
    required this.courseName,
    required this.description,
    required this.amount,
    required this.discount,
    required this.introVideo,
    required this.introImageLink,
    this.levelsNumber = 0,
  });
  final String courseName;
  final String description;
  final int amount;
  final int discount;
  final String introVideo;
  final String introImageLink;
  int levelsNumber;
}

class MyLevel {
  MyLevel({
    this.partsNum = 0,
    required this.levelNumber,
    required this.levelName,
    required this.courseName,
  });
  final String courseName;
  final String levelNumber;
  final String levelName;
  final int partsNum;
}

enum PartType {
  video,
  exam,
  pdf,
}

class MyParts {
  MyParts({
    required this.partName,
    required this.partType,
  });
  final int partName;
  final PartType partType;
}

class Part {
  Part({
    required this.partName,
    required this.description,
    required this.partNo,
  });
  final String partName;
  final String description;
  final String partNo;
}

class VideoPart extends Part {
  VideoPart({
    required this.videoUrl,
    required super.partName,
    required super.description,
    required super.partNo,
  });
  final String videoUrl;
}

class Quiz extends Part {
  Quiz({
    required super.partName,
    required this.totalMark,
    required super.description,
    required super.partNo,
  });
  final int totalMark;
}

class Question {
  Question({
    required this.question,
    required this.ans1,
    required this.ans2,
    required this.ans3,
    required this.ans4,
    required this.correctAns,
    required this.mark,
  });
  final String question;
  final String ans1;
  final String ans2;
  final String ans3;
  final String ans4;
  final int correctAns;
  final int mark;
}

class PDFPart extends Part {
  PDFPart({
    required this.pdfUrl,
    required super.partName,
    required super.description,
    required super.partNo,
  });
  final String pdfUrl;
}
