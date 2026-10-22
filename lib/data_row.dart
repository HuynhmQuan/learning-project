import 'package:flutter/material.dart';
import 'package:flutter_test_project_1/all_json.dart';
import 'package:flutter_test_project_1/single_data_row.dart';

class DataColor extends StatelessWidget {
  const DataColor({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: dataColors.asMap().entries.map(
          (singleData) {
            return SingleDataRow(
              singleData: singleData.value,
              dataRowIndex: singleData.key,
            );
          },
        ).toList(),
      ),
    );
  }
}
