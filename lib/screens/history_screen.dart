import 'package:flutter/material.dart';

import '../data/sample_store.dart';
import '../models/sample_status.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  SampleStatus? filter;

  @override
  Widget build(BuildContext context) {
    final samples = SampleStore.samples.where((sample) {
      if (filter == null) {
        return true;
      }

      return sample.status == filter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('RIWAYAT'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('SEMUA'),
                  selected: filter == null,
                  onSelected: (_) {
                    setState(() {
                      filter = null;
                    });
                  },
                ),
                const SizedBox(width: 8),

                ...SampleStatus.values.map(
                  (status) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(status.label),
                      selected: filter == status,
                      onSelected: (_) {
                        setState(() {
                          filter = status;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: samples.isEmpty
                ? const Center(
                    child: Text('Belum ada sampel'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: samples.length,
                    itemBuilder: (context, index) {
                      final sample = samples[index];

                      return Card(
                        child: ListTile(
                          title: Text(sample.style),
                          subtitle: Text(
                            'Batch ${sample.batchNumber}'
                            ' · Roll ${sample.rollMachine}'
                            ' · Press ${sample.pressLine}',
                          ),
                          trailing: Text(
                            sample.status.label,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}