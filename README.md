# Country Lister App - Explore
Country Lister (Explore) is a mobile app that helps show its users the details and descriptions of countries around the world.
In this app, users can choose from the list of countries available or search the app to get the details and description of any country's choice.

The details shown on the app details page include: the name of the country, flag, independence date, driving side, map, currency, country capital, languages, coat of arms, and postal codes, among other details.


## Getting Started with the App
Below is a descriptive overview of the app; this overview will give you a sense of direction while navigating the app and its codebase.


### Description of the App and its features.
Sometimes it can be frustrating that simple details of a country are difficult to remember until you go online and search for the details of the country.

This app was created with the intention of providing its users with information about every country in the world without the need to go online and search for country information in an unorganized or random manner.

If you want to learn about a country quickly, this app serves as a country explorer, allowing you to learn about a country in a few clicks. The feature details of the app include:
- search
- country list
- details page
- dark mode option
- filter option


### Description of the Codebase and how it works.
It's noteworthy to understand the codebase structure before diving. For this reason, I'll be doing a quick rundown of the codebase structure. Important files and folders to take note of in this code base include:
- main.dart file
- screen folder
- utils folder
- assets folder
- custom widget folder
- const folder
- model folder
- services folder
- pubspec.YAML file
- README file

It is also important to have a quick rundown of how these files and folders are structured to work and interact with one another.
A glance below:
- main.dart file: This file serves as the engine room of my app, as this is where the app starts running when launched.
- screen folder: this folder contains all the code files for the app's UI.
- utils folder: this is the parent folder of the custom widget and constant folders.
- custom widget folder: This folder contains all extracted widgets that have been customized to be reusable throughout the app. These widgets serve the purpose of reducing my lines of code while still maintaining quality across a file and easing navigation across the codebase in case there's a need for debugging when bugs or issues are encountered.
- const folder: in this folder, you'll find the provider_dart file, in which I declared riverpod as a data management service from my API.
- assets folder: this folder serves as a parent folder for all the assets used in the app. The assets folder contains the font folder(this is the folder where all the custom fonts used in the app are stored for easy access across the codebase. This folder houses the different typefaces of the font family, which can be used across the app).
  Model folder: This folder contains the file containing the data collected from the API in JSON format and converted to a DART file.
- services folder: this folder houses the file that contains the configuration to call/access the URL where the API data will be gotten from. Also, it contains the configuration of the API provider.
- pubspec.YAML file - this is where custom assets such as font, and libraries are declared for them to be usable in the app.
- README file - this is the file you're reading at the moment.


### Description of the Libraries used and why.
At this point in the app, only one library is used. Below are the details of the library used and why;
- Riverpod: Riverpod is a state management library that I use because I want the data that'll be passed across the app to interact flawlessly with the features and provide the user with a seamless experience.


### Description of features I'd like to add if I had more time.
If I had enough time, features I'll like to incorporate into the app include;
- implement the search function on the app.
- Create a details page that displays information about a selected or searched country.
  Add a dark mode to my app.
- Include a filter function in the app's country list.
- do a quick unit and widget test for the app.


### Description of the challenges I faced and how I solved them.
It is inevitable to always come across challenges while building an app. For this app, I faced some challenges when building it, and those challenges include:
- I faced some implementation errors when declaring riverpod as my state manager because this is my first time using it.
- I'm running a flutter build on my project to generate the.apk file; this command is still new to me, but I'm only using it for the second time.
- A data handling error when creating country names appears as a list on the home page because I am getting the data from a map and riverpod is used to handle the data when it is collected from the API.
- An undocumented error occurred when I attempted to create my Countries model from the API (converting JSON to Dart code).


I was able to solve them as listed below:
- I checked the official documentation of RiverPod.
- I search StackOverflow for potential solutions.
- I watched some YouTube tutorials on how to use some widgets in Flutter and how some features I needed in my app were implemented in other apps.
- I contacted some other members of the HNG mobile track for help, and we were able to debug some bugs while looking at my codebase together.


### Link to the APK file
[Link to my APK file]()


### Link to my app on Appetize.io
[Link to my Appetizer](https://www.example.com)


