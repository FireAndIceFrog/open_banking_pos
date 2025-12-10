# Description
We are using flutter hooks and hooks_riverpod for state management, as a smart engineer we know that the more code we write the more we have to maintain.

All features for the UI will be contained under akahu_mobile/lib/features/[featureName]
-services
-types
-components
-screens
-translations

Please also update the main file to use riverpod & have actual styling. 

our style for this application is a white primary color with a deep blue secondary, sky blue for tertiary.

Add a folder under features called features/foundation which will contain the shared UI rendering components. 

DO NOT style each text/button/component independantly
DO create a shared component we re-use
