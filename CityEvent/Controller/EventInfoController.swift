//
//  EventInfoController.swift
//  CityEvent
//
//  Created by Elizeu RS on 25/07/22.
//

import UIKit
import SDWebImage

class EventInfoController: UIViewController {
  
  // MARK: - Properties
  
  var event: Event?  {
    didSet {
      navigationItem.title = event?.title?.capitalized
      imageView.sd_setImage(with: URL(string: event?.image ?? ""), placeholderImage: UIImage(named: "calendarIcon.jpg"))
      titleLabel.text = event?.title
      descriptionLabel.text = event?.description
      
      
      guard let date = event?.date?.formattedDate else { return }
      guard let price = event?.price else { return }
      
      configureLabel(label: dateLabel, title: "Data", details: "\(date)")
      configureLabel(label: priceLabel, title: "Preço", details: "\(price)")
    }
  }
  
  let scrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.showsVerticalScrollIndicator = false
    return sv
  }()
  
  let scrollStackViewContainer: UIStackView = {
    let view = UIStackView()
    view.axis = .vertical
    view.spacing = 32
//    view.alignment = .
    return view
  }()
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.heightAnchor.constraint(equalToConstant: 300).isActive =  true
    iv.contentMode = .scaleAspectFill
    iv.layer.cornerRadius = 10
    iv.clipsToBounds = true
    return iv
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .title1)
//    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textColor = .systemBrown
    label.numberOfLines = 0
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.numberOfLines = 0
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .right
    label.numberOfLines = 0
    return label
  }()
  
  let scrollStackHorizontalViewContainer: UIStackView = {
    let view = UIStackView()
    view.axis = .horizontal
//    view.spacing = 32
    view.alignment = .fill
    return view
  }()
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .body)
    label.numberOfLines = 0
    return label
  }()
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewComponents()
  }
  
  // MARK: - Helper Functions
  
  func configureViewComponents() {
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = false
    
    let margins = view.layoutMarginsGuide
    
//    let width = (view.frame.width)
    
    view.addSubview(scrollView)
    scrollView.addSubview(scrollStackViewContainer)
    
    scrollStackHorizontalViewContainer.addArrangedSubview(dateLabel)
    scrollStackHorizontalViewContainer.addArrangedSubview(priceLabel)
    
    scrollView.anchor(top: margins.topAnchor, left: view.leftAnchor, bottom: margins.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
    
    scrollStackViewContainer.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    
    scrollStackViewContainer.addArrangedSubview(imageView)
    scrollStackViewContainer.addArrangedSubview(titleLabel)
    scrollStackViewContainer.addArrangedSubview(scrollStackHorizontalViewContainer)
    scrollStackViewContainer.addArrangedSubview(descriptionLabel)
    descriptionLabel.bottomAnchor.constraint(equalTo: scrollStackViewContainer.bottomAnchor).isActive = true
  }
  
  func configureLabel(label: UILabel, title: String, details: String) {
    let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title): ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.systemBrown]))
    attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
      label.attributedText = attributedText

  }
}
