import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  // Category list and notifier for selection
  final ValueNotifier<String> selectedCategory = ValueNotifier('Category');

  FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterListNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: filterState.when(
        data: (data) => Row(
          children: [
            // Filter category list
            filterTypeList(),

            // Options for selected category
            filterSubTypeList(data),
          ],
        ),
        error: (e, _) => Center(child: Text('Error : $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),

      // Apply button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Apply logic here
          },
          style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(48)),
          child: Text('Apply Filters'),
        ),
      ),
    );
  }

  Expanded filterSubTypeList(Map<String, List<String?>> data) => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: ValueListenableBuilder<String>(
        valueListenable: selectedCategory,
        builder: (_, value, __) {
          Map<String, bool> categoryFilters = {};
          data[value]?.forEach((value) {
            categoryFilters[value ?? ''] = false;
          });
          return categoryFilterValues(categoryFilters);
        },
      ),
    ),
  );

  ValueListenableBuilder<Map<String, bool>> categoryFilterValues(
    Map<String, bool> categories,
  ) {
    ValueNotifier<Map<String, bool>> categoryFilters = ValueNotifier(categories);
    return ValueListenableBuilder<Map<String, bool>>(
      valueListenable: categoryFilters,
      builder: (_, filters, __) {
        return ListView(
          children: filters.entries.map((entry) {
            return CheckboxListTile(
              title: Text(entry.key),
              value: entry.value,
              onChanged: (newValue) {
                categoryFilters.value = {
                  ...filters,
                  entry.key: newValue ?? false,
                };
              },
            );
          }).toList(),
        );
      },
    );
  }

  Container filterTypeList() => Container(
    width: 120,
    color: Colors.grey.shade200,
    child: ListView.builder(
      itemCount: filterCategories.length,
      itemBuilder: (context, index) {
        final cat = filterCategories[index];
        return ValueListenableBuilder<String>(
          valueListenable: selectedCategory,
          builder: (_, value, __) {
            final isSelected = value == cat;
            return ListTile(
              title: Text(cat),
              selected: isSelected,
              selectedTileColor: Colors.white,
              onTap: () => selectedCategory.value = cat,
            );
          },
        );
      },
    ),
  );
}
