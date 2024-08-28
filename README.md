# Provider Statemanagement

Provider is a state management package for Flutter that simplifies the way you manage and access state throughout your application. It provides a way to inject and consume objects (like state, services, or other dependencies) into the widget tree, making them accessible to the widgets that need them.

## Core Concepts of Provider
### 1. State:
- State refers to the data that can change over time and affects the UI. For example, the count in a counter application or the items in a shopping cart.

### 2. ChangeNotifier:
- ChangeNotifier is a class that provides change notification to listeners. When the state changes, it notifies the listeners to rebuild with the updated state. You typically extend ChangeNotifier to create your own state classes.

### 3. ChangeNotifierProvider:
- ChangeNotifierProvider is a widget that provides an instance of a ChangeNotifier to its descendants. It listens to the ChangeNotifier and rebuilds the widget tree when the state changes.

### 4. Consumer:
- Consumer is a widget that listens to changes in the provided state and rebuilds itself when the state changes. It allows you to access the state and update the UI accordingly.

### 5. Provider.of:
Provider.of is a method used to access the provided state or objects directly. It is typically used inside widgets to get the current state.


## Integrating Provider
To integrate Provider into your Flutter project, you need to wrap the MaterialApp with either Provider or MultiProvider. In this example, I’ve used MultiProvider to accommodate multiple providers, which is common in real-world scenarios where you often need more than one provider.

### main.dart
Here’s how you can set up the MultiProvider in your main.dart file:

```
return ScreenUtilInit(
  builder: (context, child) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NumbersListProvider(),
      ),
    ],
    child: const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ),
);
```

### home_screen.dart
In your HomeScreen, wrap the Scaffold with a Consumer to listen to changes in your provider:
```
return Consumer<NumbersListProvider>(
  builder: (context, numbersProviderModel, child) => Scaffold(
    // Your Scaffold code here
  ),
);
```

### Updating the UI
To update the UI when your data changes, you need to use the notifyListeners() method within your provider class. This method triggers a rebuild of any widget listening to this provider, ensuring the UI stays in sync with the data.

Here’s an example of a provider class that manages a list of numbers:
```
import 'package:flutter/material.dart';

// Using inheritance with 'extends' to call ChangeNotifier
class NumbersListProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4, 5];

  void add() {
    int last = numbers.last;
    numbers.add(last + 1);
    // Without this, the screen will not be updated or show the results
    notifyListeners();
  }
}
```

### Example Use Case: Cart Screen
Consider a cart screen where you add items to a cart using a provider. If you navigate back to the home screen and then return to the cart screen, the items will still be there, thanks to the provider maintaining the state across the app.

