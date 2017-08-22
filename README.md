# L1ndaTest

This app is an assignment done for a code test for [L1nda](https://www.l1nda.nl/nl/horeca/). All the information about the asignment can be found in [here](https://bitbucket.org/Paolo999/mobile-test).

## Requirements
To run the app you will need:

* Xcode 8
* iOS 10.3

## How to run the code
1. Clone the repository:
```
$ git clone https://github.com/Suitsupply/Vandura.git
```

2. Go to the main folder.
3. Run `pod install`. If you do not have Cocoapods install, go [here](https://cocoapods.org/).
4. Open the `.xcworkspace` that has been generated with Xcode.
5. Run the app!

## Libraries used

* [Unbox](https://github.com/JohnSundell/Unbox): used to decode the JSON.
* [SwiftLint](https://github.com/realm/SwiftLint): a tool to enforce Swift style and conventions.
* [RxSwift](https://github.com/ReactiveX/RxSwift): reactive programming for communications between controllers and view model. And data binding.
* [Reusable](https://github.com/AliSoftware/Reusable): used to facilite the reuse of cell in a collection view.
* [Nimble](https://github.com/Quick/Nimble) and [Quick](https://github.com/Quick/Quick): testing framework.

## Unit test

For unit testing Quick and Nimble frameworks have been used. I have created unit test till the code coverage was above 80%

## Improvements
* Create a network call to retreive the calendar data.
* Improve binding between view properties and data.
* Increment unit test to full cover the code.
* Create style sheet.
* Include [Danger](https://github.com/danger/danger) to automate taks.