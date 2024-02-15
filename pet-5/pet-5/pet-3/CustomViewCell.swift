////
////  CustomViewCell.swift
////  pet-3
////
////  Created by Sailau Almaz Maratuly on 12.02.2024.
////
//
//import Foundation
//import UIKit
//
//final class CustomViewCell: UITableViewCell {
//    
//    lazy var numberLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    lazy var checkMarkImageView: UIImageView = {
//        let view = UIImageView()
//        view.image = UIImage(systemName: "checkmark.circle")
//        view.isHidden = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    func configure(isCheckMarked: Bool) {
//        checkMarkImageView.isHidden = isCheckMarked
//    }
//}
//
//private extension CustomViewCell {
//    func setupViews() {
//        contentView.addSubview(numberLabel)
//        contentView.addSubview(checkMarkImageView)
//        
//        NSLayoutConstraint.activate([
//            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            
//            checkMarkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            checkMarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
////            checkMarkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//        ])
//        
//    }
//    
//}
