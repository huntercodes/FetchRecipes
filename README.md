### Steps to Run the App
1. Clone the repository or download the project files.
2. Open the project in Xcode (requires Xcode 14+).
3. Ensure your environment supports iOS 16 or later.
4. Select an iOS Simulator or physical device with iOS 16+.
5. Build and run the project using Cmd + R.

### Focus Areas
1. Efficient Networking and Caching:
   - Optimized network calls using Swift Concurrency (async/await).
   - Implemented custom image caching to persist images to disk and avoid redundant network requests.

2. Search and Filtering Logic:
   - Added a debounced search feature to ensure smooth user experience and reduce unnecessary processing.
   - Provided sorting functionality for recipes by name or cuisine type.

3. UI/UX Design:
   - Designed a clean, intuitive interface using SwiftUI with modern APIs (NavigationStack).
   - Ensured the app feels responsive, with smooth scrolling and navigation.

4. Testability and Code Quality:
   - Prioritized writing modular, testable code.
   - Created unit tests to validate core functionality, including sorting data and model decoding.

### Time Spent
- Approximate Time: 5 hours
  - 2 hours: Setting up project structure, API integration, and caching.
  - 1.5 hours: Implementing UI/UX features (navigation, sorting, and searching).
  - 1 hour: Writing unit tests for the ViewModel and model decoding.
  - 30 minutes: Debugging, polishing, and documentation.

### Trade-offs and Decisions
1. Custom Image Caching vs. Third-Party Libraries:
   - I chose to implement a lightweight image caching system instead of using third-party libraries (as per the requirements). While functional, this approach could be less robust compared to a library like Kingfisher.

2. Debounced Search:
   - Implemented search debouncing to improve performance but added slight complexity to the ViewModel.

3. Focus on Core Features:
   - Skipped advanced animations or transitions to focus on core functionality and code quality.

### Weakest Part of the Project
- Error Handling: 
   - While basic error messages are displayed, more user-friendly alerts could enhance this application.

- UI Polish: 
   - Additional visual changes, such as animations for state transitions, could improve the user experience.

### Additional Information
- Testing: 
   - Unit tests validate core functionality.

- Limitations: 
   - The app currently does not include persistence for recipe data between app launches, focusing instead on runtime functionality.

- Learning Experience: 
   - This project helped solidify my understanding of Swift Concurrency and modern SwiftUI patterns, while practicing SOLID principles.
