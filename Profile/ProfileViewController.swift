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
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        
            }
    
    private func setupTableViews(){
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(PostTableViewCell.self,
                               forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        feedTableView.register(ProfileTableHeaderView.self,
                               forHeaderFooterViewReuseIdentifier: String(describing: ProfileTableHeaderView.self))
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


}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = feedTableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        
        cell.post = posts[indexPath.row]


        return cell
    }
    
    
}

extension ProfileViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .zero
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = feedTableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileTableHeaderView.self)) as! ProfileTableHeaderView
        
     
        return headerView
    }
}

