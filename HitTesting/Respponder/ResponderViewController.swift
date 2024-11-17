//
//  ResponderViewController.swift
//  HitTesting
//
//  Created by Александр Рахимов on 08.11.2024.
//

import UIKit

// Здесь можно попрактиковаться с выводом следующих ответчиков
// Мщжно посмотреть как реагируют следующие ответчики на нажатие кнопки, комментируя расширения ResponderChainAction по очереди.
// Остановив выполнение по брейкпоинту в том или ином ресширении можно посмотреть следующего ответчика вызывая po self.next?.next?.next ...

final class ResponderViewController: UIViewController {
    
    private let firstView = FirstView()
    private let secondView = SecondView()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        //print(self.responderChain())
        //print(view.responderChain())
        print(button.responderChain())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutViews()
    }
    
    private func setupViews() {
        view.addSubview(firstView)
        
        view.addSubview(secondView)
        
        view.addSubview(button)
        //button.addTarget(firstView, action: #selector(firstView.tap), for: .touchUpInside)
        button.addTarget(nil, action: #selector(action), for: .touchUpInside)
    }
    
    @objc
    func action() {
        UIApplication.shared.sendAction(#selector(ResponderChainAction.handleAction), to: nil, from: self, for: nil)
    }
    
    private func layoutViews() {
        let firstViewSize = firstView.sizeThatFits(view.bounds.size)
        let firstViewOrigin = CGPoint(x: view.center.x - firstViewSize.width / 2.0, y: view.center.y - firstViewSize.height / 2.0)
        firstView.frame = CGRect(origin: firstViewOrigin, size: firstViewSize)
        
        let secondViewSize = secondView.sizeThatFits(view.bounds.size)
        let secondViewOrigin = CGPoint(x: view.center.x - secondViewSize.width / 2.0, y: view.center.y - secondViewSize.height / 2.0)
        secondView.frame = CGRect(origin: secondViewOrigin, size: secondViewSize)
        
        let buttonSize = CGSize(width: 100.0, height: 100.0)
        let buttonOrigin = CGPoint(x: view.center.x - buttonSize.width / 2.0, y: view.center.y - buttonSize.height / 2.0)
        button.frame = CGRect(origin: buttonOrigin, size: buttonSize)
        button.backgroundColor = .cyan
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ResponderViewController.View touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ResponderViewController.View touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ResponderViewController.View touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ResponderViewController.View touchesCancelled")
    }

}

@objc
protocol ResponderChainAction: AnyObject {
    
    func handleAction()
    
}

// MARK: - ResponderChainAction

extension ResponderViewController: ResponderChainAction {
    
    func handleAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss dd:MM:yyyy"
        let alert = UIAlertController(title: "Date", message: dateFormatter.string(from: Date()), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("OK")
        }))
        self.present(alert, animated: true)
    }
    
}

extension UIWindow: ResponderChainAction {
    
    func handleAction() {
        print("UIWindow \(Date())")
        let colors: [UIColor] = [.red, .black, .green]
        guard let subviews = self.rootViewController?.view.subviews else { return }
        for (index, subview) in subviews.enumerated() {
            subview.backgroundColor = colors[index]
        }
    }
    
}

extension UIApplication: ResponderChainAction {
    
    func handleAction() {
        print("UIApplication \(Date())")
    }
    
}

extension AppDelegate: ResponderChainAction {
    
    func handleAction() {
        print("AppDelegate \(Date())")
    }
    
}

extension  UIResponder {
    
    func responderChain() -> String {
        guard let next else { return String(describing: self) }
        return String(describing: self) + "  ->  \n" + next.responderChain()
    }
    
}
