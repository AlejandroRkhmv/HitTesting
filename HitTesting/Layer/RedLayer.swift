//
//  RedLayer.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

final class RedLayer: CALayer {
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.red.cgColor
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        if let layer = layer as? RedLayer {
            self.backgroundColor = layer.backgroundColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // В слоях hitTest не вызывается при нажатиях, так как они не участвуют в цепочке обработки касаний, если не находятся в иерархии UIView.
    // Теперь добавили в иерархию
    
    override func hitTest(_ p: CGPoint) -> CALayer? {
        let layer = super.hitTest(p)
        if layer == self {
            print("RedLayer")
        }
        return self
    }
}
