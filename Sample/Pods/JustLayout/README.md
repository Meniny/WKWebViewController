
<p align="center">
  <img src="https://i.loli.net/2018/01/05/5a4f153d36a21.png" alt="JustLayout">
  <br/><a href="https://cocoapods.org/pods/JustLayout">
  <img alt="Version" src="https://img.shields.io/badge/version-1.3.0-brightgreen.svg">
  <img alt="Author" src="https://img.shields.io/badge/author-Meniny-blue.svg">
  <img alt="Build Passing" src="https://img.shields.io/badge/build-passing-brightgreen.svg">
  <img alt="Swift" src="https://img.shields.io/badge/swift-4.0%2B-orange.svg">
  <br/>
  <img alt="Platforms" src="https://img.shields.io/badge/platform-iOS%20%7C%20tvOS-lightgrey.svg">
  <img alt="MIT" src="https://img.shields.io/badge/license-MIT-blue.svg">
  <br/>
  <img alt="Cocoapods" src="https://img.shields.io/badge/cocoapods-compatible-brightgreen.svg">
  <img alt="Carthage" src="https://img.shields.io/badge/carthage-working%20on-red.svg">
  <img alt="SPM" src="https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg">
  </a>
</p>

# Introduction

## What's this?

`JustLayout` is an elegant Auto Layout sugar for iOS.

## Requirements

* iOS 8.0+
* tvOS 9.0+
* Xcode 9 with Swift 4

## Installation

#### CocoaPods

```ruby
pod 'JustLayout'
```

## Contribution

You are welcome to fork and submit pull requests.

## License

`JustLayout` is open-sourced software, licensed under the `MIT` license.

## Usage

```swift
import JustLayout
```

#### Visual

```swift
func visual() {
    view.layout(
        100,
        |-topView-| ~ 80,
        8,
        |-centerView-(>=100)-| ~ 80,
        "",
        |bottomView| ~ 80,
        0
    )
}
```

#### Chainable

```swift
func chainable() {
    bottomView.left(100).top(100).width(100).aspect(ofWidth: 100)
    centerView.left(120).top(120).width(100).aspect(ofWidth: 100)
    topView.left(140).top(140).width(100).aspect(ofWidth: 100%)
}
```

#### Operator-Based

```swift
func operatorBased() {
    bottomView.centerXAttribute == view.centerXAttribute
    bottomView.centerYAttribute == view.centerYAttribute
    bottomView.widthAttribute == 80
    bottomView.heightAttribute == bottomView.widthAttribute

    centerView.rightAttribute == bottomView.centerXAttribute
    centerView.topAttribute == bottomView.centerYAttribute
    centerView.widthAttribute == bottomView.widthAttribute
    centerView.heightAttribute == bottomView.heightAttribute

    topView.leftAttribute == centerView.rightAttribute
    topView.topAttribute == centerView.topAttribute
    topView.widthAttribute == 50 % centerView.widthAttribute
    topView.heightAttribute == centerView.heightAttribute
}
```
