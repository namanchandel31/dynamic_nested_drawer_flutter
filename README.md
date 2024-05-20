# **Project Overview**

This project demonstrates how to create and manage nested, dynamic lists for visualizing hierarchical data structures.

Flutter version: 3.22.0
Dart version: 3.4.0

## Core Files

**input_json.dart**: Contains sample map data defining the nested list structure. Modify this for testing.

**item_model.dart**: Defines a class (ItemClass) to represent list items, simplifying JSON conversion.

**drawer_view.dart**: Implements a recursive algorithm to transform the input map into a nested drawer structure.

## Testing

0. Make sure to run "flutter pub get" in the terminal.
1. Modify the map data in input_json.dart.
2. Run the application to see the rendered list.
