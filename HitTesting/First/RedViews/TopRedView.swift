//
//  TopRedView.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class TopRedView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red.withAlphaComponent(0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sizing
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width - 30, height: size.width - 30)
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TopRedView touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TopRedView touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TopRedView touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TopRedView touchesCancelled")
    }
    
}
