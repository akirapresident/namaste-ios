//
//  CourseCollectionVewCell.swift
//  namaste
//
//  Created by akira tsukamoto on 01/05/21.
//

import UIKit

class CourseCollectionCell: UICollectionViewCell {
    static let identifier: String = "CourseCell"
    var playImageName = "Play Buttom Empty"
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "You earned"
        label.font = UIFont(name: "Apercu Pro Bold", size: 12)
        label.textColor = UIColor.Theme.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Play Buttom Empty")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(container)
        
        container.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        container.addSubview(label)
        container.addSubview(scoreImage)
        
        scoreImage.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        scoreImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        
        label.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: scoreImage.topAnchor, constant: 35).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
