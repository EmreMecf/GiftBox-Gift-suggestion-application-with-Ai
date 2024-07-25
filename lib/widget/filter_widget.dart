import 'package:flutter/material.dart';
import 'package:mindbox/assest/renk/color.dart';
import 'package:mindbox/widget/appbar.dart'; // Renk dosyanızın yolu

class FilterScreen extends StatefulWidget {

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> categories = [
    'Bütçe',
    'Yaş',
    'Cinsiyet',
    'İlgi Alanları',
    'Özel Günler',
  ];

  final Map<String, List<String>> categoryChips = {
    'Bütçe': ['0-50 TL', '50-100 TL', '100+ TL'],
    'Yaş': ['0-12', '13-18', '19-25', '26+'],
    'Cinsiyet': ['Erkek', 'Kadın', 'Unisex'],
    'İlgi Alanları': ['Teknoloji', 'Moda', 'Spor', 'Kitap', 'Oyun'],
    'Özel Günler': ['Doğum Günü', 'Yılbaşı', 'Sevgililer Günü'],
  };

  List<String> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarWidget(
          title: 'Kategoriler',
          subtitle: 'Kategorileri Seç Hediyeni Bul',
        ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, categoryIndex) {
                final category = categories[categoryIndex];
                final chips = categoryChips[category]!;

                return _buildCategorySection(category, chips);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
                foregroundColor: MaterialStateProperty.all<Color>(AppColors.backgroundColor),
              ),
              onPressed: () {
                Navigator.pop(context, selectedChips);
              },
              child: const Text('Tamam'),
            ),

          ),
        ],
      ),
    );
  }

  // Kategori bölümü oluşturan özel fonksiyon
  Widget _buildCategorySection(String category, List<String> chips) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ChipTheme(
            data: ChipThemeData(
              backgroundColor: AppColors.secondaryColor,
              labelStyle: TextStyle(color: AppColors.backgroundColor),
              selectedColor: AppColors.primaryColor,
              checkmarkColor: AppColors.accentColor,
            ),
            child: Wrap(
              spacing: 8.0,
              children: chips.map((chipLabel) {
                return FilterChip(
                  label: Text(chipLabel),
                  selected: selectedChips.contains(chipLabel),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedChips.add(chipLabel);
                      } else {
                        selectedChips.remove(chipLabel);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
