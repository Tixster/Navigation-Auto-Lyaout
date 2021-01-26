//
//  PfofileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Тила on 19.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


class ProfileHeaderView: UIView {
    
    @IBOutlet private var imageProfile: UIImageView! {
        didSet {
            imageProfile.contentMode = .scaleAspectFill
            imageProfile.clipsToBounds = true
            imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
            imageProfile.layer.borderWidth = 3
            imageProfile.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet private weak var profileName: UILabel! {
        didSet {
            profileName.text = "Hipster Cat"
            profileName.textColor = .black
            profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }
    }
    @IBOutlet private weak var profileStatus: UILabel! {
        didSet {
            profileStatus.text = "Waiting for something..."
            profileStatus.textColor = .gray
            profileStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }
    }
    @IBOutlet private weak var textFieldStatus: UITextField! {
        didSet {
            let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
            
            textFieldStatus.attributedPlaceholder = NSAttributedString(string: "Введите новый статус", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            textFieldStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textFieldStatus.textColor = .black
            textFieldStatus.backgroundColor = .white
            
            textFieldStatus.leftView = paddingView
            textFieldStatus.leftViewMode = .always
            
            textFieldStatus.layer.borderWidth = 1
            textFieldStatus.layer.borderColor = UIColor.black.cgColor
            textFieldStatus.layer.cornerRadius = 12
            
            textFieldStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        }
    }
    @IBOutlet private weak var buttonStatus: UIButton! {
        didSet {
            buttonStatus.backgroundColor = .systemBlue
            buttonStatus.setTitle("Show status", for: .normal)
            buttonStatus.setTitleColor(.white, for: .normal)
            buttonStatus.layer.cornerRadius = 4
            
            buttonStatus.layer.shadowOffset = .init(width: 4, height: 4)
            buttonStatus.layer.shadowRadius = 4
            buttonStatus.layer.shadowColor = UIColor.black.cgColor
            buttonStatus.layer.shadowOpacity = 0.7
            
            buttonStatus.addTarget(self, action: #selector(buttonStatusTapped), for: .touchUpInside)
            
        }
    }
    
    private var showStatusButton = UIButton(type: .system)
    
    
    
    private var statusText: String?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        addSubview(showStatusButton)
        setupStatusButton()
        
        
    }
    
    
    private func setupStatusButton(){
        
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            showStatusButton.heightAnchor.constraint(equalToConstant: 20)        
        ])

        
        
        showStatusButton.setTitle("Открыть статус", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitleColor(.white, for: .normal)
        
    }
    
    
    @objc private func buttonStatusTapped(){
        profileStatus.text = statusText
        textFieldStatus.text = nil
    }
    
    @objc private func statusTextChanged(){
        statusText = textFieldStatus.text
    }
    
    
}
