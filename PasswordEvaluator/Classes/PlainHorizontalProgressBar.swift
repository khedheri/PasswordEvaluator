//
//  PlainHorizontalProgressBar.swift
//  PasswordEvaluator
//
//  Created by khedheri nader on 23.06.21.
//

import UIKit
import Foundation

class PlainHorizontalProgressBar: UIView {
    @IBInspectable var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    
    var height: CGFloat = 3 {
        didSet { setNeedsDisplay() }
    }
    
    var roundedCorner: Bool = false {
        didSet { setNeedsDisplay() }
    }

    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        layer.addSublayer(progressLayer)
    }

    override func draw(_ rect: CGRect) {
        if roundedCorner {
            backgroundMask.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: height), cornerRadius: height * 0.4).cgPath
        }else{
            backgroundMask.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: height), cornerRadius: height * 0.1).cgPath
        }
        layer.mask = backgroundMask

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: height))

        progressLayer.frame = progressRect
        progressLayer.backgroundColor = color.cgColor
    }
}

