enum SampleStatus {
  processing,
  ok,
  notOk,
}

extension SampleStatusLabel on SampleStatus {
  String get label {
    switch (this) {
      case SampleStatus.processing:
        return 'PROCESSING';
      case SampleStatus.ok:
        return 'OK';
      case SampleStatus.notOk:
        return 'NOT OK';
    }
  }
}