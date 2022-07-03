# Test App for AppsFactory

A music management app with Flutter (iOS and Android) based on the LastFM API. With the help of the app the user should be able to search for artists, pick one of their top albums and save it locally. 

## The App contains the following:

- Main Screen: <br>
    a. All locally stored albums are shown here.<br>
    b. A tap on one of these albums opens a detail-page. <br>
    c. These screens (Main and Detail) should work without having an internet connection. <br>
    d. It's possible to open the search screen from this view. <br>
- Search Page: <br>
    a. On this page it should be possible to search for an artist on the LastFMApi. <br>
    b. Furthermore there should be a button next to a text field which starts the search. <br>
    c. The results of the search (found artists) should be shown in a list. <br>
    d. A selection of one list-item opens the Top Albums screen. <br>
- Top Albums: <br>
    a. The best albums of an artist are shown here. <br>
    b. It should be possible to store (and delete stored) albums locally. <br>
    c. Tap on an album opens the detail-page and at least the following information should be stored:<br>
    - Name <br>
    - Artist <br>
    - Image <br>
    - Tracks <br>
- Tests: <br>
    - Unit Tests,
    - Widget Tests

# How to Start
+ Check that flutter version 3 and above
+ `flutter run` or `flutter build apk`

# Tested on:
- Honor 9X
- Iphone 11

# Knowing issues
- [Some album detail pages can't be found](https://support.last.fm/t/404-album-getinfo/62023)
- [Broken artist images](https://support.last.fm/t/api-announcement-usage-of-audio-audiovisual-images-or-artwork/202/2)

# Screens
<img src="https://raw.githubusercontent.com/Goolpe/appsfactory_test/main/assets/github_images/main_page.jpeg" width="200" /> |
<img src="https://raw.githubusercontent.com/Goolpe/appsfactory_test/main/assets/github_images/search_page.jpeg" width="200" /> |
<img src="https://raw.githubusercontent.com/Goolpe/appsfactory_test/main/assets/github_images/top_albums_page.jpeg" width="200" /> |
<img src="https://raw.githubusercontent.com/Goolpe/appsfactory_test/main/assets/github_images/detail_page.jpeg" width="200" /> |