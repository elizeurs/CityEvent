//
//  EventCell.swift
//  CityEvent
//
//  Created by Elizeu RS on 23/07/22.
//

import UIKit
import SDWebImage

class EventCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  var event: Event! {
    didSet {
      imageView.sd_setImage(with: URL(string: event.image ?? ""), placeholderImage: UIImage(named: "calendarIcon.jpg"))
      nameLabel.text = event?.title
    }
  }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
//    iv.backgroundColor = .systemGray5
//    iv.contentMode = .scaleAspectFit
    iv.contentMode = .scaleAspectFill

//    iv.layer.cornerRadius = 10
//    iv.clipsToBounds = true
    return iv
  }()
  
  lazy var nameContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBrown
//    self.layer.cornerRadius = 10
//    self.clipsToBounds = true
    
    view.addSubview(nameLabel)
    nameLabel.center(inView: view)
    
    return view
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font =  UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.text = "Feira de Produtos Naturais e Orgânicos"
    return label
  }()
  
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureViewComponents()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helper Functions
  
  func configureViewComponents() {
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
    
    addSubview(imageView)
    imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 50)
    
    addSubview(nameContainerView)
    nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
  }
}

