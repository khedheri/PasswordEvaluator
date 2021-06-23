//
//  PasswordEvaluator.swift
//  PasswordEvaluator
//
//  Created by khedheri nader on 23.06.21.
//

import UIKit
import Foundation

public class PasswordEvaluator: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    public func updatePasswordEvaluatorView(password: String){
        self.updateProgresView(password: password)
    }
    
    private func setupViews() {
        labelsStackView.addArrangedSubview(strengthTitleLabel)
        progressStackView.addArrangedSubview(plainHorizontalProgressBar1)
        progressStackView.addArrangedSubview(plainHorizontalProgressBar2)
        progressStackView.addArrangedSubview(plainHorizontalProgressBar3)
        progressStackView.addArrangedSubview(plainHorizontalProgressBar4)
        
        parentStackView.addArrangedSubview(progressStackView)
        parentStackView.addArrangedSubview(labelsStackView)
        
        addSubview(parentStackView)
        parentStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        parentStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        parentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 2.0).isActive = true
        parentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.0).isActive = true

    }
    
    @IBInspectable public var passwordEvaluatorTitleText: String = "passwordStrength" {
        didSet {
            self.strengthTitleLabel.text = passwordEvaluatorTitleText
        }
    }
    
    @IBInspectable public var progressBarHeight: CGFloat = 3 {
        didSet {
            self.plainHorizontalProgressBar1.height = progressBarHeight
            self.plainHorizontalProgressBar2.height = progressBarHeight
            self.plainHorizontalProgressBar3.height = progressBarHeight
            self.plainHorizontalProgressBar4.height = progressBarHeight
        }
    }
    
    @IBInspectable public var progressViewSpacing: CGFloat = 4.0 {
        didSet {
            progressStackView.spacing = self.progressViewSpacing
        }
    }
    
    @IBInspectable public var progressViewAndTitleSpacing: CGFloat = 4.0 {
        didSet {
            parentStackView.spacing = self.progressViewSpacing
        }
    }
    
    public var font: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            strengthTitleLabel.font = font
        }
    }
    
    public var hideTitleLabel: Bool = false {
        didSet {
            self.strengthTitleLabel.isHidden = hideTitleLabel
        }
    }
    
    public var progressBackgroundColor: UIColor = Colors.progressBackgroundColor {
        didSet {
            self.plainHorizontalProgressBar1.backgroundColor = progressBackgroundColor
            self.plainHorizontalProgressBar2.backgroundColor = progressBackgroundColor
            self.plainHorizontalProgressBar3.backgroundColor = progressBackgroundColor
            self.plainHorizontalProgressBar4.backgroundColor = progressBackgroundColor
        }
    }
    
    public var veryWeakColor: UIColor = Colors.veryWeakColor {
        didSet {
            self.plainHorizontalProgressBar1.color = veryWeakColor
        }
    }
    
    public var weakColor: UIColor = Colors.weakColor {
        didSet {
            self.plainHorizontalProgressBar2.color = weakColor
        }
    }
    
    public var reasonableColor: UIColor = Colors.reasonableColor {
        didSet {
            self.plainHorizontalProgressBar3.color = reasonableColor
        }
    }
    
    public var strongColor: UIColor = Colors.strongColor {
        didSet {
            self.plainHorizontalProgressBar4.color = strongColor
        }
    }
    
    public var firstViewTitleString: String = Strings.firstViewString {
        didSet {
            self.firstViewString = firstViewTitleString
        }
    }
    
    public var secondViewTitleString: String = Strings.secondViewString {
        didSet {
            self.secondViewString = secondViewTitleString
        }
    }
    
    public var thirdViewTitleString: String = Strings.thirdViewString {
        didSet {
            self.thirdViewString = thirdViewTitleString
        }
    }
    
    public var fourthViewTitleString: String = Strings.fourthViewString {
        didSet {
            self.fourthViewString = fourthViewTitleString
        }
    }
    
    public var regexVeryWeak: String = PasswordStregthRegexs.firstViewRegex {
        didSet {
            PasswordStrengthManager.lowerCaseAndCharacterRegex = regexVeryWeak
        }
    }
    
    public var regexWeak: String = PasswordStregthRegexs.secondViewRegex {
        didSet {
            PasswordStrengthManager.upperCaseRegex = regexWeak
        }
    }
    
    public var regexReasonable: String = PasswordStregthRegexs.thirdViewRegex {
        didSet {
            PasswordStrengthManager.oneDigitRegex = regexReasonable
        }
    }
    
    public var regexStrong: String = PasswordStregthRegexs.fourthViewRegex {
        didSet {
            PasswordStrengthManager.specialCharacterRegex = regexStrong
        }
    }
        
    private var firstViewString: String = Strings.firstViewString
    private var secondViewString: String = Strings.secondViewString
    private var thirdViewString: String = Strings.thirdViewString
    private var fourthViewString: String = Strings.fourthViewString
    
    private lazy var progress1: UIProgressView = {
        var progressBar = UIProgressView()
        progressBar.progress = 0
        progressBar.backgroundColor = self.progressBackgroundColor
        
        return progressBar
    }()
    
    private lazy var plainHorizontalProgressBar1: PlainHorizontalProgressBar = {
        var progressBar = PlainHorizontalProgressBar()
        progressBar.progress = 0
        progressBar.color = self.veryWeakColor
        progressBar.backgroundColor = self.progressBackgroundColor
        
        return progressBar
    }()
    
    private lazy var plainHorizontalProgressBar2: PlainHorizontalProgressBar = {
        var progressBar = PlainHorizontalProgressBar()
        progressBar.progress = 0
        progressBar.color = self.weakColor
        progressBar.backgroundColor = self.progressBackgroundColor
        
        return progressBar
    }()
    
    private lazy var plainHorizontalProgressBar3: PlainHorizontalProgressBar = {
        var progressBar = PlainHorizontalProgressBar()
        progressBar.progress = 0
        progressBar.color = self.reasonableColor
        progressBar.backgroundColor = self.progressBackgroundColor
        
        return progressBar
    }()
    
    private lazy var plainHorizontalProgressBar4: PlainHorizontalProgressBar = {
        var progressBar = PlainHorizontalProgressBar()
        progressBar.progress = 0
        progressBar.color = self.strongColor
        progressBar.backgroundColor = self.progressBackgroundColor
        
        return progressBar
    }()
    
   private lazy var progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = self.progressViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var strengthTitleLabel: UILabel = {
        var label = UILabel()
        label.font = font
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var parentStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = self.progressViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func updateProgresView(password: String){
        
        let defaultPasswordEstimator = DefaultPasswordEstimator()
        let passwordStrength = defaultPasswordEstimator.estimatePassword(password)
        switch passwordStrength {
        case .empty:
            self.plainHorizontalProgressBar1.progress = 0.0
            self.plainHorizontalProgressBar2.progress = 0.0
            self.plainHorizontalProgressBar3.progress = 0.0
            self.plainHorizontalProgressBar4.progress = 0.0
            self.strengthTitleLabel.text = nil
        case .veryWeak:
            self.plainHorizontalProgressBar1.progress = 1.0
            self.plainHorizontalProgressBar2.progress = 0.0
            self.plainHorizontalProgressBar3.progress = 0.0
            self.plainHorizontalProgressBar4.progress = 0.0
            self.strengthTitleLabel.textColor = veryWeakColor
            self.plainHorizontalProgressBar1.color = veryWeakColor
            self.strengthTitleLabel.text = self.passwordSterngthString(forStrength: .veryWeak)
        case .weak:
            self.plainHorizontalProgressBar1.progress = 1.0
            self.plainHorizontalProgressBar2.progress = 1.0
            self.plainHorizontalProgressBar3.progress = 0.0
            self.plainHorizontalProgressBar4.progress = 0.0
            self.strengthTitleLabel.textColor = weakColor
            self.plainHorizontalProgressBar1.color = weakColor
            self.plainHorizontalProgressBar2.color = weakColor
            self.strengthTitleLabel.text = self.passwordSterngthString(forStrength: .weak)
        case .reasonable:
            self.plainHorizontalProgressBar1.progress = 1.0
            self.plainHorizontalProgressBar2.progress = 1.0
            self.plainHorizontalProgressBar3.progress = 1.0
            self.plainHorizontalProgressBar4.progress = 0.0
            self.strengthTitleLabel.textColor = reasonableColor
            self.plainHorizontalProgressBar1.color = reasonableColor
            self.plainHorizontalProgressBar2.color = reasonableColor
            self.plainHorizontalProgressBar3.color = reasonableColor
            self.strengthTitleLabel.text = self.passwordSterngthString(forStrength: .reasonable)
        case .strong:
            self.plainHorizontalProgressBar1.progress = 1.0
            self.plainHorizontalProgressBar2.progress = 1.0
            self.plainHorizontalProgressBar3.progress = 1.0
            self.plainHorizontalProgressBar4.progress = 1.0
            self.strengthTitleLabel.textColor = strongColor
            self.plainHorizontalProgressBar1.color = strongColor
            self.plainHorizontalProgressBar2.color = strongColor
            self.plainHorizontalProgressBar3.color = strongColor
            self.plainHorizontalProgressBar4.color = strongColor
            self.strengthTitleLabel.text = self.passwordSterngthString(forStrength: .strong)
        }
        
    }
    
    private func passwordSterngthString(forStrength strength: PasswordStrength) -> String {
        switch strength {
        case .empty:
            return "Empty"
        case .veryWeak:
            return "Very Weak"
        case .weak:
            return "Weak"
        case .reasonable:
            return "Reasonable"
        case .strong:
            return "Strong"
        }
    }
}


public protocol PasswordEstimator {
    func estimatePassword(_ password: String) -> PasswordStrength
}

struct DefaultPasswordEstimator: PasswordEstimator {
    func estimatePassword(_ password: String) -> PasswordStrength {

        if password.isEmpty {
            return .empty
        } else {
            let strength = PasswordStrengthManager.strength(ofPassword: password)
            switch strength {
            case .empty:
                return .empty
            case .veryWeak:
                return .veryWeak
            case .weak:
                return .weak
            case .reasonable:
                return .reasonable
            case .strong:
                return .strong
            }
        }
    }

}

