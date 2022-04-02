//
//  VC.swift
//  socialsPage
//
//  Created by Chitrala Dhruv on 03/04/22.
//

import UIKit

class socialsVC: UIViewController {
    
    private let YouTubeLabel: UILabel = {
        let label = UILabel()
        label.text = "YouTube"
        label.textColor = .white
        
        return label
    }()
    
    private let IGLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = .white
        
        return label
    }()
    
    private let TwitterLabel: UILabel = {
        let label = UILabel()
        label.text = "Twitter"
        label.textColor = .white
        
        return label
    }()
    
    private let IGcollectionView: UICollectionView =  {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(InstagramPostCell.self, forCellWithReuseIdentifier: "IGPostCell")
        collectionView.backgroundColor = .black

        return collectionView
        
    }()
    
    private let TwitterCollectionView: UICollectionView =  {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: "TweetCell")
        collectionView.backgroundColor = .black

        return collectionView
        
    }()
    
    private let YTcollectionView: UICollectionView =  {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(YTCell.self, forCellWithReuseIdentifier: "YTCell")
        collectionView.backgroundColor = .black

        return collectionView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        YTcollectionView.delegate = self
        YTcollectionView.dataSource = self
        
        TwitterCollectionView.delegate = self
        TwitterCollectionView.dataSource = self
        
        IGcollectionView.delegate = self
        IGcollectionView.dataSource = self
        
        view.addSubview(YTcollectionView)
        view.addSubview(IGcollectionView)
        view.addSubview(TwitterCollectionView)
        setUpAutoLayout()

    }
    
    private func setUpAutoLayout() {
        
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: view.frame.width*2).isActive = true
        
        IGcollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        IGcollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        IGcollectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        IGcollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
        YTcollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        YTcollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        YTcollectionView.topAnchor.constraint(equalTo: IGcollectionView.bottomAnchor,constant: 30).isActive = true
        YTcollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
        TwitterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        TwitterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        TwitterCollectionView.topAnchor.constraint(equalTo: YTcollectionView.bottomAnchor,constant: 30).isActive = true
        TwitterCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }

}

extension socialsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == IGcollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IGPostCell", for: indexPath) as! InstagramPostCell
            
            return cell
        }
        else if collectionView == YTcollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YTCell", for: indexPath) as! YTCell
            
            return cell
        }
        else if collectionView == TwitterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TweetCell", for: indexPath) as! TweetCell
            
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
}

