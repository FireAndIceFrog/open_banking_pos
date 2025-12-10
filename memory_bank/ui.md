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

# Routing (go_router) integration

- Dependency
  - pubspec.yaml: add `go_router`.
- Router location
  - `lib/features/foundation/routes/router.dart`.
- Route paths
  - `RoutePaths.accounts = '/accounts'`.
- GoRouter config
  - `final GoRouter appRouter = GoRouter(initialLocation: RoutePaths.accounts, routes: [...])`.
  - Default route: `/accounts`.
  - Error handler: simple `errorBuilder` that renders a message using shared typography.
- Screen composition
  - Wrap screens with shared layout: `AppScaffold(title: 'Accounts', body: AccountsScreen())`.
  - This preserves global theming and consistent UI.
- App entry
  - `MaterialApp.router` in `lib/main.dart` with `routerConfig: appRouter`.
  - Keep `ProviderScope` in `main()` to use Riverpod across routes.

## Navigation usage

- Navigate to default route:
  - Dart
    ```dart
    // Dart
    context.go(RoutePaths.accounts);
    ```
- Push a new screen (when added later):
  - Dart
    ```dart
    // Dart
    context.push('/payments'); // example future route
    ```

## File references

- Main: `lib/main.dart` uses `MaterialApp.router` with `appRouter`.
- Router: `lib/features/foundation/routes/router.dart`.
- Shared UI: `lib/features/foundation/components/app_scaffold.dart`, `lib/features/foundation/app_text.dart`, `lib/features/foundation/app_colors.dart`.
- Accounts screen: `lib/features/accounts/screens/accounts_screen.dart`.

## Guidelines

- Keep feature-first structure; all new screens register routes in `router.dart`.
- Use shared components (AppScaffold, AppText, color theme) rather than per-widget styling.
- Prefer `context.go` for top-level navigation and `context.push` for stack navigation.
- Maintain Riverpod providers; screens read via `ref.watch(...)` as usual across routes.
