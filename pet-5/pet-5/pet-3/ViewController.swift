//
//  ViewController.swift
//  pet-3
//
//  Created by Sailau Almaz Maratuly on 08.02.2024.
//

import UIKit

class InnerViewController: UIViewController {
    private var heightConstraint: NSLayoutConstraint?
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        let size: CGFloat = 20
        trianglePath.move(to: CGPoint(x: size/2, y: 0))
        trianglePath.addLine(to: CGPoint(x: 0, y: size))
        trianglePath.addLine(to: CGPoint(x: size, y: size))
        trianglePath.addLine(to: CGPoint(x: size/2, y: 0))
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor.secondarySystemBackground.cgColor
        triangleLayer.position = CGPoint(x: (300 - size)/2, y: -size)
        view.layer.addSublayer(triangleLayer)

        
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4

        let segmentedControl = UISegmentedControl(items: ["280", "150"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        

        let closeButton = UIButton(type: .system)
        closeButton.setTitle("X", for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        heightConstraint = view.heightAnchor.constraint(equalToConstant: 280)
        heightConstraint?.isActive = true
    }
    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 && !isExpanded {
            UIView.animate(withDuration: 0.3) {
                self.heightConstraint?.constant = 150
                self.view.superview?.layoutIfNeeded()
            }
            isExpanded = true
        } else if sender.selectedSegmentIndex == 0 && isExpanded {
            UIView.animate(withDuration: 0.3) {
                self.heightConstraint?.constant = 280
                self.view.superview?.layoutIfNeeded()
            }
            isExpanded = false
        }
    }
    
    @objc func closeButtonTapped() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 0
        }) { _ in
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
}

class ViewController2: UIViewController {
    weak var innerViewController: InnerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let openButton = UIButton(type: .system)
        openButton.setTitle("Open", for: .normal)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        view.addSubview(openButton)
        
        NSLayoutConstraint.activate([
            openButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openButton.widthAnchor.constraint(equalToConstant: 200),
            openButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func openButtonTapped() {
        guard innerViewController == nil else { return }
        
        let innerVC = InnerViewController()
        innerVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(innerVC)
        view.addSubview(innerVC.view)
        NSLayoutConstraint.activate([
            innerVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 270),
            innerVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            innerVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            innerVC.view.heightAnchor.constraint(equalToConstant: 280)
        ])
        innerVC.didMove(toParent: self)
        
        innerViewController = innerVC
    }
}

