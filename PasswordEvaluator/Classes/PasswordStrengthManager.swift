//
//  PasswordStrengthManager.swift
//  PasswordEvaluator
//
//  Created by khedheri nader on 23.06.21.
//

import UIKit
import Foundation

public enum PasswordStrength {
    // value is empty
    case empty
    // value is smaller than 28
    case veryWeak
    // value is between 28 and 35
    case weak
    // value is between 36 and 59
    case reasonable
    // value is between 60 and 127
    case strong
}

class PasswordStrengthManager {
    
    /// Gets strength of a password.
    ///
    /// - parameter password: Password string to be calculated
    ///
    /// - returns: Level of strength in PasswordStrengthManager
    public static func strength(ofPassword password: String) -> PasswordStrength {
        return passwordStrengthValidator(forEntropy: entropy(of: password))
    }
    
    private static var regexVeryWeak: String = PasswordStregthRegexs.firstViewRegex
    private static var regexWeak: String = PasswordStregthRegexs.secondViewRegex
    private static var regexReasonable: String = PasswordStregthRegexs.thirdViewRegex
    private static var regexStrong: String = PasswordStregthRegexs.fourthViewRegex
    
    // At least 6 characters + At least one lowercase letter
    public static var lowerCaseAndCharacterRegex: String = PasswordStregthRegexs.firstViewRegex{
        didSet {
            self.regexVeryWeak = lowerCaseAndCharacterRegex
        }
    }
    
    // At least one uppercase letter
    public static var upperCaseRegex: String = PasswordStregthRegexs.secondViewRegex {
        didSet {
            self.regexWeak = upperCaseRegex
        }
    }
    
    // At least one digit
    public static var oneDigitRegex: String = PasswordStregthRegexs.thirdViewRegex {
        didSet {
            self.regexReasonable = oneDigitRegex
        }
    }
    
    // At least 6 characters + At least one lowercase letter
    public static var specialCharacterRegex: String = PasswordStregthRegexs.fourthViewRegex {
        didSet {
            self.regexStrong = specialCharacterRegex
        }
    }
    
    private static func entropy(of string: String) -> Float {
        guard string.count > 0 else {
            return 0
        }
        
        var sizeOfCharacterSet: Float = 0
        
        let resultRegexVeryWeak = string.range( of: regexVeryWeak, options: .regularExpression)
        if resultRegexVeryWeak != nil {
            sizeOfCharacterSet += 1
        }
        
        let resultRegexWeak = string.range( of: regexWeak, options: .regularExpression)
        if resultRegexWeak != nil {
            sizeOfCharacterSet += 1
        }
        
        let resultRegexReasonable = string.range( of: regexReasonable, options: .regularExpression)
        if resultRegexReasonable != nil {
            sizeOfCharacterSet += 1
        }
        
        let resultRegexStrong = string.range( of: regexStrong, options: .regularExpression)
        if resultRegexStrong != nil {
            sizeOfCharacterSet += 1
        }
        
        return sizeOfCharacterSet
    }
    
    private static func passwordStrengthValidator(forEntropy entropy: Float) -> PasswordStrength {
        if entropy == 0 {
            return .empty
        }else if entropy == 1 {
            return .veryWeak
        } else if entropy == 2 {
            return .weak
        } else if entropy == 3 {
            return .reasonable
        } else {
            return .strong
        }
    }
}


struct PasswordStregthRegexs {
    static  let firstViewRegex: String = #"(?=.{6,})"# + #"(?=.*[a-z])"#
    static  let secondViewRegex: String = #"(?=.*[A-Z])"#
    static  let thirdViewRegex: String = #"(?=.*\d)"#
    static  let fourthViewRegex: String = #"(?=.*[ !$%&?._-])"#
}

struct Strings {
    static  let firstViewString: String = "Very Weak"
    static  let secondViewString: String = "Weak"
    static  let thirdViewString: String = "Reasonable"
    static  let fourthViewString: String = "Strong"
}

struct Colors {
    
    static  let progressBackgroundColor: UIColor = UIColor(red: 227 / 255, green: 227 / 255, blue: 229 / 255, alpha: 1)
    static  let veryWeakColor: UIColor = UIColor(red: 212 / 255, green: 2 / 255, blue: 29 / 255, alpha: 1)
    static  let weakColor: UIColor = UIColor(red: 245 / 255, green: 155 / 255, blue: 35 / 255, alpha: 1)
    static  let reasonableColor: UIColor = UIColor(red: 112 / 255, green: 282 / 255, blue: 3 / 255, alpha: 1)
    static  let strongColor: UIColor = UIColor(red: 39 / 255, green: 195 / 255, blue: 26 / 255, alpha: 1)
}

