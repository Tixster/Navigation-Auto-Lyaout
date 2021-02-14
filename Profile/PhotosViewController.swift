//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Кирилл Тила on 14.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

 class PhotosViewController: UIViewController {
    
    
    private lazy var colletcionView: UICollectionView = {
       let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
     //   collectionView.dataSource = self
   //     collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: )

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"

        setupView()
    }
    
    private func setupView(){
        view.addSubview(colletcionView)
        
        
        let constraints = [
            colletcionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colletcionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colletcionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            colletcionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

//extension PhotosViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//        cell.backgroundColor = .red
//        return cell
//    }
    
    

