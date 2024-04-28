//
//  ViewController.swift
//  lec-tabviews
//
//  Created by Angelina Chen on 4/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties (view)

    private let titleLabel = UILabel()
    private var collectionView: UICollectionView!

    
    
    // MARK: - Properties (data)
    private let refreshControl = UIRefreshControl()
    // private var posts: [Post] = [name: "Anonymous"]
    
    //    private var posts: [Post] = [
    //        Post(id: "7m03J198pyXFBvCOLNbw", likes: ["vdb23", "rs929"], message: "Test 1", time: "2023-06-12T22:03:23Z")
    //        ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "munch"
        view.backgroundColor = .white
        
//        setupTitleLabel()
        setupCollectionView()
    }
    
//    private func setupTitleLabel() {
//        titleLabel.text = "munch"
//        titleLabel.font = .systemFont(ofSize: 24)
//        titleLabel.textColor = UIColor.black
//
//        view.addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        // 5. Set Up Constraints
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
//
    private func setupCollectionView() {
        
        let padding: CGFloat = 24   // Use this constant when configuring constraints
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
//        layout.minimumInteritemSpacing = 16
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        
        
        // REGISTER POST CELLS
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.reuse)
        
        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor
                                                  )
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        ])
        
//        refreshControl.addTarget(self, action: #selector(fetchPosts), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        refreshControl.endRefreshing()
    }

}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Return the cells for each section
        // HINT: Use `indexPath.section` with an if statement
        
        // For Create Post.
        
        // For already made posts.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.reuse, for: indexPath) as? UserCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // cell.configure(with:posts[indexPath.row])
        return cell
    }
    
    // !! DONE !!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Return the number of rows for each section
        // HINT: Use `section` with an if statement
        
        return 5
        // return posts.count
    }
    
    // !! DONE !!
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: Return the number of sections in this table view

        return 1
    }
    
    // !! NOT DONE, CHECK !!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections

        return UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0) // Replace this line
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Return the size for each cell per section
        // HINT: Use `indexPath.section` with an if statement
        if (indexPath.section == 0) {
            let size = collectionView.frame.width
            return CGSize(width: size, height: 131)
        }
        
        let size = collectionView.frame.width
        return CGSize(width:size, height: collectionView.frame.height / 5.5) // Replace this line
    }

}

