import 'package:flutter/material.dart';

import '../../common/custom_appbar.dart';
import '../../common/custom_widgets.dart';

class PhysiotherapyScreen extends StatefulWidget {
  const PhysiotherapyScreen({super.key});

  @override
  State<PhysiotherapyScreen> createState() => _PhysiotherapyScreenState();
}

class _PhysiotherapyScreenState extends State<PhysiotherapyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 10),
          child: const PhysiotheraphyInfo()),
    );
  }
}
