//
//  RedDragView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 10.11.2024.
//

import UIKit

final class RedDragView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red.withAlphaComponent(0.5)
        layer.cornerRadius = 12.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 200.0, height: 200.0)
    }
    
}
