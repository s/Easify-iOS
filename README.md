# Easify-iOS

Easify-iOS is an iOS application to discover new songs based on your preferences. Mainly, it uses modularization to have the project scalable for future developments and it takes advantage of latest frameworks such as Combine and SwiftUI.

It uses [SpotifyLogin SDK](https://github.com/spotify/SpotifyLogin) to handle the login process with Spotify.

To be able to run the application, register an application on [Spotify Developer Portal](https://developer.spotify.com/dashboard/applications) and please add following values to the `SpotifyCredentials.plist` in `EasifyCore` module:

```
	<key>client_id</key>
	<string>YOUR_CLIENT_ID</string>
	<key>client_secret</key>
	<string>YOUR_CLIENT_SECRET</string>
	<key>redirect_url</key>
	<string>YOUR_REDIRECT_URL</string>
```