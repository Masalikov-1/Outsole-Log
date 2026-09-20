import 'sample_status.dart';

enum ColorCategory {
  white,
  gum,
  colored,
  black,
}

class Sample {
  const Sample({
    required this.id,
    required this.style,
    required this.batchNumber,
    required this.rollMachine,
    required this.colorCategory,
    required this.isRegrind,
    required this.pressLine,
    required this.rollExitTime,
    this.pressExitTime,
    this.status = SampleStatus.processing,
  });

  final String id;
  final String style;
  final String batchNumber;

  // Mesin Roll 1–4
  final int rollMachine;

  final ColorCategory colorCategory;
  final bool isRegrind;

  // Line Press 1–14
  final int pressLine;

  final DateTime rollExitTime;
  final DateTime? pressExitTime;

  final SampleStatus status;

  Duration? get waitingTime {
    if (pressExitTime == null) {
      return null;
    }

    return pressExitTime!.difference(rollExitTime);
  }
}