# Test App for AppsFactory

A music management app with Flutter (iOS and Android) based on the LastFM API. With the help of the app the user should be able to search for artists, pick one of their top albums and save it locally. 

## The App contains the following:

- Main Screen: 
    - [x] a. All locally stored albums are shown here.
    - [x] b. A tap on one of these albums opens a detail-page. 
    - [x] c. These screens (Main and Detail) should work without having an internet connection. 
    - [x] d. It's possible to open the search screen from this view. 
- Search Page: 
    - [x] a. On this page it should be possible to search for an artist on the LastFMApi. 
    - [x] b. Furthermore there should be a button next to a text field which starts the search. 
    - [x] c. The results of the search (found artists) should be shown in a list. 
    - [x] d. A selection of one list-item opens the Top Albums screen. 
- Top Albums: 
    - [x] a. The best albums of an artist are shown here. 
    - [x] b. It should be possible to store (and delete stored) albums locally. 
    - [x] c. Tap on an album opens the detail-page and at least the following information should be stored:<br>
        i. Name <br>
        ii. Artist <br>
        iii. Image (size does not matter) <br>
        iv. Tracks <br>

# How to Start
+ `flutter run`

# Tested on:
- Honor 9X
- Iphone 11

# Knowing issues
- [Some album detail pages can't be found](https://support.last.fm/t/404-album-getinfo/62023)
- [Broken artist images](https://support.last.fm/t/api-announcement-usage-of-audio-audiovisual-images-or-artwork/202/2)