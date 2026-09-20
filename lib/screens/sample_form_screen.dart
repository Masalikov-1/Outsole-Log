import '../data/sample_store.dart';
import '../models/sample.dart';
import 'package:flutter/material.dart';

import '../models/sample_status.dart';

class SampleFormScreen extends StatefulWidget {
  const SampleFormScreen({super.key});

  @override
  State<SampleFormScreen> createState() => _SampleFormScreenState();
}

class _SampleFormScreenState extends State<SampleFormScreen> {
  final styleController = TextEditingController();
  final batchController = TextEditingController();

  int rollMachine = 1;
  int pressLine = 1;
  String colorCategory = 'White';
  bool isRegrind = false;

  @override
  void dispose() {
    styleController.dispose();
    batchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('01 · SAMPEL'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: styleController,
            decoration: const InputDecoration(
              labelText: 'Style',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: batchController,
            decoration: const InputDecoration(
              labelText: 'Nomor Batch',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          const Text('Mesin Roll'),

          DropdownButton<int>(
            value: rollMachine,
            isExpanded: true,
            items: List.generate(
              4,
              (index) => DropdownMenuItem(
                value: index + 1,
                child: Text('Roll ${index + 1}'),
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  rollMachine = value;
                });
              }
            },
          ),

          const SizedBox(height: 24),

          const Text('Kategori Warna'),

          DropdownButton<String>(
            value: colorCategory,
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 'White',
                child: Text('White'),
              ),
              DropdownMenuItem(
                value: 'Gum',
                child: Text('Gum'),
              ),
              DropdownMenuItem(
                value: 'Colored',
                child: Text('Colored'),
              ),
              DropdownMenuItem(
                value: 'Black',
                child: Text('Black'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  colorCategory = value;
                });
              }
            },
          ),

          SwitchListTile(
            title: const Text('Regrind'),
            value: isRegrind,
            onChanged: (value) {
              setState(() {
                isRegrind = value;
              });
            },
          ),

          const SizedBox(height: 16),

          const Text('Line Press'),

          DropdownButton<int>(
            value: pressLine,
            isExpanded: true,
            items: List.generate(
              14,
              (index) => DropdownMenuItem(
                value: index + 1,
                child: Text('Press ${index + 1}'),
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  pressLine = value;
                });
              }
            },
          ),

          const SizedBox(height: 32),

          Card(
            child: ListTile(
              title: const Text('Status Awal'),
              trailing: Text(
                SampleStatus.processing.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          FilledButton(
            onPressed: () {
  if (styleController.text.trim().isEmpty ||
      batchController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Style dan Nomor Batch wajib diisi'),
      ),
    );
    return;
  }

  final sample = Sample(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    style: styleController.text.trim(),
    batchNumber: batchController.text.trim(),
    rollMachine: rollMachine,
    colorCategory: ColorCategory.values.firstWhere(
      (category) =>
          category.name.toLowerCase() ==
          colorCategory.toLowerCase(),
    ),
    isRegrind: isRegrind,
    pressLine: pressLine,
    rollExitTime: DateTime.now(),
  );

  SampleStore.samples.add(sample);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Sampel berhasil dicatat'),
    ),
  );

  Navigator.pop(context, sample);
},
            },
            child: const Text('SIMPAN SAMPEL'),
          ),
        ],
      ),
    );
  }
}