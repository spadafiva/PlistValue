# PlistValue

I've found it useful to store data such as tokens, urls for endpoints and other data in a Plist in order to make sure that it is easy to fix, accessible to the app and kept separate from the code. Using this class, it's really easy to get a value from a specific plist key.

# To Use
1. Create a new plist with your favorite editor (Look for property list when creating in Xcode) and name it "Keys.plist".  (Optionally, also add Key.plist to your `.gitignore` file if the data stored is sensitive and should not be committed to github.

2. Anywhere you want that value, you can create a reference to the plist by using this code snippet:
```
do {
  let baseUrl = try PlistValue<String>(key: "baseUrl")
} catch {
  // Handle the error
}
```
