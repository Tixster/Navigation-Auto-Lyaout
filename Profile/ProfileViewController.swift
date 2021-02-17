//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Кирилл Тила on 19.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


struct PostProfile {
    var autor: String
    var image: String
    var likes: Int
    var views: Int
    var description: String
}



class ProfileViewController: UIViewController {
    
    let image = ProfileTableHeaderView().imageProfile

    private lazy var bgAvatarView: UIView = {
        let bgAvatarView = UIView()
        bgAvatarView.layer.opacity = 0
        bgAvatarView.backgroundColor = .black
        bgAvatarView.translatesAutoresizingMaskIntoConstraints = false
        return bgAvatarView
    }()
    
    private lazy var bgAvatarViewButton: UIButton = {
        let bgAvatarViewButton = UIButton()
        bgAvatarViewButton.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
        bgAvatarViewButton.backgroundColor = .white
        bgAvatarViewButton.translatesAutoresizingMaskIntoConstraints = false
        return bgAvatarViewButton
    }()
    
    

    private var feedTableView = UITableView(frame: .zero, style: .grouped)
    
    private let posts = [
        PostProfile(autor: "Autor One", image: "feedOne", likes: 100, views: 500, description: "Описание 1"),
        PostProfile(autor: "Autor Two", image: "feedTwo", likes: 200, views: 250, description: "Описание 2"),
        PostProfile(autor: "Autor Three", image: "feedThree", likes: 453, views: 1203, description: "Описание 3"),
        PostProfile(autor: "Autor Four", image: "feedFour", likes: 33, views: 123, description: "Описание 4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableViews()
        setupViews()
        
    }

    
    @objc func tapImageVIew(){
        let imageView: UIImageView = {
             let imageView = UIImageView()
            imageView.image = UIImage(named: "hipster cat")
             imageView.contentMode = .scaleAspectFill
             imageView.clipsToBounds = true
             imageView.layer.cornerRadius = 80 / 2
             imageView.layer.borderWidth = 3
             imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.isUserInteractionEnabled = true
             return imageView
         }()
        
        self.setupBgAvatarView()
        self.view.addSubview(imageView)
        imageView.frame = .init(x: self.view.frame.minX + 16, y: self.view.frame.minY + 16, width: 80, height: 80)

        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {

            imageView.frame = .init(x: self.view.frame.midX, y: self.view.frame.midY, width: self.view.frame.width, height: self.view.frame.width)
            self.bgAvatarView.layer.opacity = 0.5
            self.view.layoutIfNeeded()

        }
        animator.startAnimation()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        
    }
    
    private func setupTableViews(){
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(PostTableViewCell.self,
                               forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        feedTableView.register(ProfileTableHeaderView.self,
                               forHeaderFooterViewReuseIdentifier: String(describing: ProfileTableHeaderView.self))
        feedTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        
    }
    
    private func setupViews(){
        view.addSubview(feedTableView)

        let constraints = [
            feedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            feedTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func setupBgAvatarView(){
        
        view.addSubview(bgAvatarView)
        setupBgAvatarViewButton()
        let constraints = [
            bgAvatarView.heightAnchor.constraint(equalTo: view.heightAnchor),
            bgAvatarView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupBgAvatarViewButton(){
        
        bgAvatarView.addSubview(bgAvatarViewButton)
        let constraints = [
            bgAvatarViewButton.topAnchor.constraint(equalTo: bgAvatarView.topAnchor, constant: 20),
            bgAvatarViewButton.trailingAnchor.constraint(equalTo: bgAvatarView.trailingAnchor, constant:  -20),
            bgAvatarViewButton.heightAnchor.constraint(equalToConstant: 20),
            bgAvatarViewButton.widthAnchor.constraint(equalToConstant: 20),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return posts.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell: PhotosTableViewCell = feedTableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            
            return cell
            
        default:
            let cell: PostTableViewCell = feedTableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            
            cell.post = posts[indexPath.row]
            
            return cell
            
        }
        
    }
    
    
}


extension ProfileViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .zero
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = feedTableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileTableHeaderView.self)) as! ProfileTableHeaderView
        
        switch section {
        case 0:
            return headerView
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
            
        default:
            break
        }
        
    }
    
    
    
}

