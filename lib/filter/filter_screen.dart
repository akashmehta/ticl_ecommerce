import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget  {
  // Category list and notifier for selection
  final ValueNotifier<String> selectedCategory = ValueNotifier('Category');

  // Checkbox states for "Category" filters
  final ValueNotifier<Map<String, bool>> categoryFilters = ValueNotifier({
    'Shoes': false,
    'Books': false,
    'Furniture': false,
    'Clothes': false,
  });

  final List<String> filterCategories = [
    'Category',
    'Brand',
    'Price',
    'Rating',
    'Delivery Time',
    'Color',
    'Size',
    'Sort By',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),),
      body: Row(
        children: [
          // Filter category list
          Container(
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
          ),

          // Options for selected category
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ValueListenableBuilder<String>(
                valueListenable: selectedCategory,
                builder: (_, value, __) {
                  if (value == 'Category') {
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
                  } else {
                    return Center(child: Text('No options available'));
                  }
                },
              ),
            ),
          ),
        ],
      ),

      // Apply button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Apply logic here
          },
          child: Text('Apply Filters'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(48),
          ),
        ),
      ),
    );
  }
}
