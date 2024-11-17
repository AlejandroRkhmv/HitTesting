//
//  CyanView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class CyanView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
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
        print("CyanView touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("CyanView touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("CyanView touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("CyanView touchesCancelled")
    }
    
    // Нажатие на BlueLayer
    
    // Вызывается дважды.
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let layers = self.layer.sublayers else { return self }
        
        for layer in layers {
            if layer.frame.contains(point), layer is BlueLayer {
                print("BlueLayer can")
                return nil
            }
        }
        
        return super.hitTest(point, with: event)
    }
}
