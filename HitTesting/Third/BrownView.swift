//
//  BrownView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class BrownView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
        layer.cornerRadius = 12.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sizing
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 300.0, height: 300.0)
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("BrownView touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("BrownView touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("BrownView touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("BrownView touchesCancelled")
    }
    
    // Здесь можно попробовать распознавание нажатий на различные вью
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let subView = viewWhichContainsTouchesPoint(parentView: self, point: point, event: event) {
            return subView
        }
        
        if self.point(inside: point, with: event) {
            return self
        }
        
        return nil
    }
    
    private func viewWhichContainsTouchesPoint(parentView: UIView, point: CGPoint, event: UIEvent?) -> UIView? {
        let subViews = parentView.subviews
        guard !subViews.isEmpty else { return nil }
        
        for subView in subViews.reversed() {
            let convertedPointToSubView = parentView.convert(point, to: subView)
            if subView.point(inside: convertedPointToSubView, with: event) {
                if let subViewInSubView = viewWhichContainsTouchesPoint(parentView: subView, point: convertedPointToSubView, event: event) {
                    return subViewInSubView // only for blueView
                } else {
                    return subView // for others
                }
            }
        }
        return nil // ThirdViewController.view
    }
    
}
