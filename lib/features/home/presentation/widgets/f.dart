import 'package:flutter/material.dart';

class SearchExample extends StatefulWidget {
  const SearchExample({super.key});

  @override
  State<SearchExample> createState() => _SearchExampleState();
}

class _SearchExampleState extends State<SearchExample> {
  // Create your own SearchController instance.
  final SearchController _searchController = SearchController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The generic type <String> defines the type of the selected item.
          SearchAnchor.bar(
            // Provide your custom controller here.
            isFullScreen: true,
            searchController: _searchController,
            viewHintText: 'Search for a fruit...',
            // onSubmitted is called when the user submits the search.
            onSubmitted: (String fruit) {
              FocusScope.of(context).unfocus();
              // Optionally update your state based on the submission.
            },
            // The suggestionsBuilder now receives a SearchController.
            // Use controller.text to get the current search input.
            suggestionsBuilder:
                (BuildContext context, SearchController controller) async {
              final String query = controller.text;
              // Sample list of fruit suggestions.
              final List<String> fruits = [
                'Apple',
                'Banana',
                'Cherry',
                'Date',
                'Elderberry'
              ];
              // Filter the fruits list based on the input query (case-insensitive).
              final List<String> filteredFruits = fruits
                  .where((fruit) =>
                      fruit.toLowerCase().contains(query.toLowerCase()))
                  .toList();
              // Return each suggestion as a ListTile.
              return filteredFruits.map((fruit) {
                return ListTile(
                  title: Text(fruit),
                  onTap: () {
                    // When a suggestion is tapped, close the search view.
                    controller.closeView(fruit);
                  },
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
