# Easify-iOS

[![Github Actions Status](https://github.com/s/Easify-iOS/workflows/CI/badge.svg)](https://github.com/s/Easify-iOS/actions)

Easify-iOS is an iOS application to discover new songs based on your preferences. Mainly, it uses modularization to have the project scalable for future developments and it takes advantage of latest frameworks such as Combine and SwiftUI.

It uses [SpotifyLogin SDK](https://github.com/spotify/SpotifyLogin) to handle the login process with Spotify. This app only relies on `Alamofire` module from `EasifyNetwork` module via `Swift Package Manager`. Make sure to fetch this package before running the application. 

Then you can register an application on [Spotify Developer Portal](https://developer.spotify.com/dashboard/applications) and add the following values to the `SpotifyCredentials.plist` in `EasifyCore` module:

```
<key>client_id</key>
<string>YOUR_CLIENT_ID</string>
<key>client_secret</key>
<string>YOUR_CLIENT_SECRET</string>
<key>redirect_url</key>
<string>YOUR_REDIRECT_URL</string>
```