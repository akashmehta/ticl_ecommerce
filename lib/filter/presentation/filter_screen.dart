import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/providers/product_provider.dart';
import '../providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  // Category list and notifier for selection
  final Function(int) _onPageChange;
  FilterScreen(this._onPageChange, {super.key});

  final ValueNotifier<String> selectedFilter = ValueNotifier(filterCategories[0]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterListNotifierProvider);
    final filterNotifier = ref.watch(filterListNotifierProvider.notifier);
    final productStateNotifier = ref.watch(productListNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),),
      body: filterState.when(
        data: (data) => Row(
          children: [
            // Filter category list
            filterTypeList(),

            // Options for selected category
            filterSubTypeList(filterNotifier, data),
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
            _onPageChange(0);
            productStateNotifier.filterProducts(filterNotifier.filterTypes.value);
          },
          style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(48)),
          child: Text('Apply Filters'),
        ),
      ),
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
          valueListenable: selectedFilter,
          builder: (_, value, __) {
            final isSelected = value == cat;
            return ListTile(
              title: Text(cat),
              selected: isSelected,
              selectedTileColor: Colors.white,
              onTap: () => selectedFilter.value = cat,
            );
          },
        );
      },
    ),
  );

  Expanded filterSubTypeList(FilterListNotifier filterNotifier, Map<String, List<String?>> data) => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: ValueListenableBuilder<String>(
        valueListenable: selectedFilter,
        builder: (_, value, __) {
          Map<String, bool> categoryFilters = {};
          data.removeWhere((key, value) { return value.isEmpty;});
          if (value == 'Category' || value == 'Brand') {
            data[value]?.removeWhere((item) { return item == null ||
                item.toString().isEmpty;});
          }
          data[value]?.forEach((item) {
            categoryFilters[item ?? ''] = false;
          });
          return categoryFilterValues(filterNotifier, value, categoryFilters);
        },
      ),
    ),
  );

  ValueListenableBuilder<Map<String, bool>> categoryFilterValues(FilterListNotifier filterNotifier, String category,
      Map<String, bool> subCategories,) {
    ValueNotifier<Map<String, bool>> localFilter = ValueNotifier(subCategories);
    localFilter.value.addAll({ for (var item in filterNotifier.filterTypes.value[category] ?? []) item : true });
    return ValueListenableBuilder<Map<String, bool>>(
      valueListenable: localFilter,
      builder: (_, filters, __) {
        return ListView(
          children: filters.entries.map((entry) {
            return CheckboxListTile(
              title: Text(toCamelCase(entry.key.toString())),
              value: entry.value,
              onChanged: (newValue) {
                localFilter.value = {...filters, entry.key: newValue ?? false,};
                List<String?> subCat = filterNotifier.filterTypes.value[category] ?? [];
                if (newValue == true) {
                  subCat.add(entry.key);
                } else {
                  subCat.remove(entry.key);
                }
                filterNotifier.filterTypes.value = {...filterNotifier.filterTypes.value, category : subCat};
              },
            );
          }).toList(),
        );
      },
    );
  }
  
  String toCamelCase(String input) {
    String output = '';
    List<String> items = input.split(' ');
    for (var item in items) {
      output = '$output${item.replaceFirst(item[0], item[0].toUpperCase())} ';
    }
    return output;
  }

}
