//
//  PfofileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Тила on 19.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


class ProfileHeaderView: UIView {
    
    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileStatus: UILabel!
    @IBOutlet weak var textFieldStatus: UITextField!
    @IBOutlet weak var buttonStatus: UIButton!
    
  
    private var statusText: String?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
//        addSubview(imageProfile)
//        addSubview(profileName)
//        addSubview(profileStatus)
//        addSubview(textFieldStatus)
//        addSubview(buttonStatus)
        
        setupImageProfile()
        setupProfileName()
        setupProfileStatus()
        setupTextFieldStatus()
        setupButtonStatus()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)


      fatalError("init(coder:) has not been implemented")
    }

    private func setupImageProfile(){
        imageProfile = UIImageView(image: #imageLiteral(resourceName: "hipster cat"))
        imageProfile.contentMode = .scaleAspectFill
        imageProfile.clipsToBounds = true
        imageProfile.layer.cornerRadius = 100/2
        imageProfile.layer.borderWidth = 3
        imageProfile.layer.borderColor = UIColor.white.cgColor
    }

    private func setupProfileName(){
        profileName.text = "Hipster Cat"
        profileName.textColor = .black
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    private func setupProfileStatus(){
        profileStatus.text = "Waiting for something..."
        profileStatus.textColor = .gray
        profileStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    private func setupButtonStatus(){
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

    @objc private func buttonStatusTapped(){
        profileStatus.text = statusText
        textFieldStatus.text = nil
    }

    private func setupTextFieldStatus(){

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

    @objc private func statusTextChanged(){
        statusText = textFieldStatus.text
    }

    
}
