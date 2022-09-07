//
//  DetailsViewController.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 7.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    public var model:ResultsViewModel?
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let artistNameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    private let releaseDateLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let artworkView100:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let playButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "playbutton"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configuremodel()
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(artistNameLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(artworkView100)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width-20
        artworkView100.frame = CGRect(x:10, y:view.width/3 , width:size, height:size) //square
        nameLabel.frame = CGRect(x: 10, y: artworkView100.bottom+20, width: size, height: 40)
        artistNameLabel.frame = CGRect(x: 10, y: nameLabel.bottom+20, width: size, height: 30)
        releaseDateLabel.frame = CGRect(x: 10, y: artistNameLabel.bottom+15, width: size, height: 20)
    }
    
    private func configuremodel() {
        guard let model = model else {
            return
        }
        nameLabel.text = model.collectionName
        releaseDateLabel.text = model.releaseDate
        artistNameLabel.text = model.artistName
        artworkView100.sd_setImage(with: model.artworkUrl100)
    }



}
