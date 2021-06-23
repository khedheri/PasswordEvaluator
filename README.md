# PasswordEvaluator

[![CI Status](https://img.shields.io/travis/khedheri/PasswordEvaluator.svg?style=flat)](https://travis-ci.org/khedheri/PasswordEvaluator)
[![Version](https://img.shields.io/cocoapods/v/PasswordEvaluator.svg?style=flat)](https://cocoapods.org/pods/PasswordEvaluator)
[![License](https://img.shields.io/cocoapods/l/PasswordEvaluator.svg?style=flat)](https://cocoapods.org/pods/PasswordEvaluator)
[![Platform](https://img.shields.io/cocoapods/p/PasswordEvaluator.svg?style=flat)](https://cocoapods.org/pods/PasswordEvaluator)

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/86120731/123117411-031b8f80-d442-11eb-9bd6-5df2005c8059.gif)

## short Integration steps

1 - add container view just in the bottom of the textfield

<img width="304" alt="1" src="https://user-images.githubusercontent.com/86120731/123118920-593d0280-d443-11eb-8ff2-3f435ef9bde4.png">

2 - assign PasswordEvaluator to your container view 

<img width="691" alt="2" src="https://user-images.githubusercontent.com/86120731/123119330-b638b880-d443-11eb-9732-5f46c4456f3b.png">

3 - link your container view to your parent view controller (# just in case if you need to customise your password evaluator)

<img width="1316" alt="3" src="https://user-images.githubusercontent.com/86120731/123119526-e6805700-d443-11eb-8228-556da281b98b.png">

4 - add text field did change action (to catch the tect field changes)


<img width="1324" alt="4" src="https://user-images.githubusercontent.com/86120731/123119799-20e9f400-d444-11eb-88bd-36bc987d52b8.png">


5 - or in case you use RxSwift

 textField.rx.text.changed.subscribe(onNext: { (password) in
            self.containerView.updatePasswordEvaluatorView(password: password)
        }).disposed(by: disposeBag)
        
## Customization:

You can customise:

1 - progress Bar Height

2 - progress View Spacing

3 - progress View And Title Spacing
4 - title font
5 - hide Title Label (Hide the strength title)
6 - progress Background Color
7 - very Weak Color
8 - weak color
9 - reasonable Color
10 - strong color
11 - strength title strings
12 - regex for each strength level

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PasswordEvaluator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PasswordEvaluator'
```

## Author

khedheri, khedheri.nader@gmail.com

## License

PasswordEvaluator is available under the MIT license. See the LICENSE file for more info.
