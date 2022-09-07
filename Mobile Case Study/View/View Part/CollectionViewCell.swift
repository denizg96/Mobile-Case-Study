//
//  CollectionViewCell.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 2.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    public var model:ResultsViewModel?
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let artistNameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    private let releaseDateLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let artworkView100:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 0.5
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(artworkView100)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.width-20
        artworkView100.frame = CGRect(x: 10, y:10 , width:size, height:size) //square
        nameLabel.frame = CGRect(x: 10, y: artworkView100.bottom+10, width: size, height: 40)
        artistNameLabel.frame = CGRect(x: 10, y: nameLabel.bottom+10, width: size, height: 20)
        releaseDateLabel.frame = CGRect(x: 10, y: artistNameLabel.bottom+5, width: size, height: 20)
    }
    
    public func configure (with model:ResultsViewModel) {
        self.model = model
        nameLabel.text = model.collectionName
        artistNameLabel.text = model.artistName
        releaseDateLabel.text = model.releaseDate
        artworkView100.sd_setImage(with:model.artworkUrl100)
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        artistNameLabel.text = nil
        releaseDateLabel.text = nil
        artworkView100.image = nil
        
    }
}
