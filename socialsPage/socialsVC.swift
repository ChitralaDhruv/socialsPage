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
        label.font = UIFont.boldSystemFont(ofSize: 23)
        
        return label
    }()
    
    private let IGLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 23)
        
        return label
    }()
    
    private let TwitterLabel: UILabel = {
        let label = UILabel()
        label.text = "Twitter"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 23)
        
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
        view.addSubview(YouTubeLabel)
        view.addSubview(TwitterLabel)
        view.addSubview(IGLabel)
        
        setUpAutoLayout()

    }
    
    private func setUpAutoLayout() {
        
        IGLabel.translatesAutoresizingMaskIntoConstraints = false
        IGLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40).isActive = true
        IGLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        IGLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        IGcollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        IGcollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        IGcollectionView.topAnchor.constraint(equalTo: IGLabel.bottomAnchor).isActive = true
        IGcollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
        YouTubeLabel.translatesAutoresizingMaskIntoConstraints = false
        YouTubeLabel.topAnchor.constraint(equalTo: IGcollectionView.bottomAnchor, constant: 10).isActive = true
        YouTubeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        YouTubeLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        YTcollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        YTcollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        YTcollectionView.topAnchor.constraint(equalTo: YouTubeLabel.bottomAnchor).isActive = true
        YTcollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
        
        TwitterLabel.translatesAutoresizingMaskIntoConstraints = false
        TwitterLabel.topAnchor.constraint(equalTo: YTcollectionView.bottomAnchor, constant: 10).isActive = true
        TwitterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        TwitterLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        TwitterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        TwitterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        TwitterCollectionView.topAnchor.constraint(equalTo: TwitterLabel.bottomAnchor).isActive = true
        TwitterCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
    }

}

extension socialsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == IGcollectionView {
            return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
        }
        else if collectionView == YTcollectionView {
            return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.width/2)
        }
        else if collectionView == TwitterCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
        }
        else {
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        }
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

