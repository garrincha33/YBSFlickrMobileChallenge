# YBS Mobile Challenge - Flickr Photo Explorer

This iOS application is built with Swift and SwiftUI, to provide an engaging and dynamic 
way to explore photos from Flickr. Adhering to MVVM architecture and using 
Combine for reactive programming and dataflow management, the app delivers a clean, efficient, and responsive user experience.

# Features
Explore Photos by Tags: Users can search for photos using tags, with options to match all tags or just some.
User Galleries: Tapping on a user ID displays a collection of photos from that specific user.
Safe Content: Implementing Flickr's safe_search parameter.
Onboarding Experience: A welcoming onboarding flow introduces new users to the app's features.

# Architecture
## MVVM and Combine
Model-View-ViewModel (MVVM): This architecture was chosen because it syncs so well with SwiftUI's data-driven design. 
It enhances readability and maintainability by separating concerns effectively, which help when implementing testing.
Combine: Utilized for reactive data handling and networking, ensuring a smooth and responsive UI.

# SwiftUI 
Embracing SwiftUI for the user interface, Ive used its powerful declarative syntax for building dynamic and adaptive UI components.

# No Third-Party Dependencies
Deliberately avoiding third-party libraries to keep the app lightweight, ensuring optimal performance and reducing the app's footprint.
Caching of the photos was all handled internally.

# Testing
Comprehensive unit tests validate the functionality of the Flickr API integration and the ViewModel logic.
UI tests ensure a seamless user experience, verifying the onboarding flow and the core features of the app.

# Onboarding
The onboarding screens guide users through the app's primary features, creating an inviting and informative first impression.

# Future Enhancements
Implementing advanced content filtering to further refine safe search results.
Enabling social features like sharing and community-driven tagging.
Favourting photos also would be a fantastic feature.

# Usage
Explore Photos: Use the search bar to find photos by tags or view a user's gallery by tapping on their ID.
Onboarding Screens: Swipe through the onboarding screens to learn about the app.

# Screenshots
<p float="left">
  <img src="https://github.com/garrincha33/YBSFlickrMobileChallenge/assets/1871219/067448f1-da8e-4873-926f-42f2f97d6f78" width="300" />
  <img src="https://github.com/garrincha33/YBSFlickrMobileChallenge/assets/1871219/971bf217-a2d4-46a7-b04c-9b13ec796aaa" width="300" /> 
  <img src="https://github.com/garrincha33/YBSFlickrMobileChallenge/assets/1871219/bad80bb7-e3c9-487f-b9da-7b7f62a237bc" width="300" />
</p>
<p float="left">
  <img src="https://github.com/garrincha33/YBSFlickrMobileChallenge/assets/1871219/82e399eb-0261-4615-a0b4-37dd78addf3a" width="300" />
  <img src="https://github.com/garrincha33/YBSFlickrMobileChallenge/assets/1871219/46cd33a9-504d-46cb-8074-f4707aa10e73" width="300" />
  <img src="https://github.com/garrincha33/YBSFlickrMobileChallenge/assets/1871219/a3895daa-4918-448f-9893-20c1d3dd6088" width="300" />
</p>

