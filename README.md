## Coding Challenge

Given a list of contact names (as `List<String>` for demo purposes), render an address book list where the names are grouped by their first character.

### Requirements

- Use a dedicate GroupedListView Widget
- Make it generic so it could work with new data types in the future
- Single scrollable list: CustomScrollView + Slivers
- Render only the visible items
- Only show groups that have entries
- Tapping on an entry takes you to a Details screen
- Search functionality
- Header and Footer

----

## Solution

### Architecture

I used the BLoC architectural pattern for making this project. Introduced by Google at Google I/O 2019, it's a good choice for many types of Flutter projects and it separates very well the business logic from the UI and Data layers.

![BLoC](https://miro.medium.com/max/831/1*Ih7zWqPcTwGkZXGoxJOH2A.png)

Besides this, there's a Repository layer that handles the operations on data (fetching, searching). I also implemented a dummy API that returns contacts with a delay, to simulate a network call.

On the UI side, the project has the two required screens:
- Contacts List
- Contact Details

### Navigation

Implemented with a dedicated AppRouter component that uses custom routes and handles dependency injection where needed. Dependency Injection is a crucial technique that enables testability and loose coupling.

### Project Structure

I followed the pattern of grouping by feature, not by type. So, the components related to the same feature (let's say Contacts List) are in the same package:
- Contacts List Screen
- BLoC
    - Contacts List Bloc
    - Contacts List Event
    - Contacts List State

The general project structure has the following big sections:
- `App` = the application class.
- `Core` = the core functionality of the app, the features.
- `Data` = Repository, API, Data Models.
- `Infrastructure` = extensions, custom reusable widgets.
- `Navigation` = the App Router and custom routes.
- `Theme` = colors, fonts, images

### Unit Testing

Another important part of a successful app. I created two files with unit tests:
- one for the Contacts Repository.
- one for the Contacts List Bloc (where's most of the business logic).

The number of tests can definitely be increased, but these are (hopefully) a good start.


## Explanations

1. The `grouped_list` package from `infrastructure` contains the core component of the app: the CustomScrollView with Slivers.
2. There's an abstract class `ListItem` that can be implemented by any custom data type (class) that we'd like to use in the Grouped List. `GroupedListView` works with a list of `ListItem` so we can have multiple types of elements at once (the classes that implement ListItem). 
3. The Header and Footer are passed as parameters as well (and they can also be null).
4. There's a delegate that handles two actions:
- fetching the full contacts list as a Refresh.
- searching for contacts via a query.
This is implemented in the Contacts List Screen which uses its BLoC to perform these actions.

5. Equatable is used for Data Models and Events/States to ensure a proper object comparison.
6. Several use-cases for special names are considered and displayed via the list that's returned from `ContactsAPI`.
7. The theme allows for further app customization.

#### Question from the requirements: 
Describe why a Scroll to index API is not as straightforward with normal ListView or Sliver widgets
- the items from a ListView are loaded lazily, so they are not rendered until they are close to be displayed on the screen. There were some discussions on this topic here: https://github.com/flutter/flutter/issues/12319 and an alternative would be to use the following package: https://pub.dev/packages/scrollable_positioned_list


## Additional Features

I added a few nice-to-haves that were not present in the requirements:
- Pull-to-Refresh on the contacts list.
- Loading indicator until the data is loaded (mocked network call).
- Empty state on the contacts list if there are no search results for a specific query.
- Expandable Nav Bar that shows/hides the title, but keeps the search bar visible.
- Error simulation once every 10 fetch requests + error handling and "try again" option.
- Unit Tests

Demo Video: https://drive.google.com/file/d/10_S6_82fhGEDUcxeIDIGafIrL_N-v7I_/view?usp=sharing

## Thank you!
Dan Ilies
