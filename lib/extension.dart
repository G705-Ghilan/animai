import 'package:animai/opsai/opsai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ContextPlus on BuildContext {
  OpsAiProvider get wOpsai => watch<OpsAiProvider>();
  OpsAiProvider get rOpsai => read<OpsAiProvider>();

  
}
