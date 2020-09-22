//
//  AlbumsCollectionViewCell.swift
//  Storm
//
//  Created by Mohammad Zakizadeh on 7/21/18.
//  Copyright © 2018 Storm. All rights reserved.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var cahracterTitle: UILabel!
    @IBOutlet weak var characterSeason: UILabel!
    
    var withBackView : Bool! {
        didSet {
            self.backViewGenrator()
        }
    }
    private lazy var backView: UIImageView = {
        let backView = UIImageView(frame: characterImage.frame)
        backView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backView)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: characterImage.topAnchor, constant: -10),
            backView.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: characterImage.bottomAnchor)
        ])
        
        backView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        backView.alpha = 0.5
        contentView.bringSubviewToFront(characterImage)
        return backView
    }()
    
    public var character: Character! {
        didSet {
            self.characterImage.loadImage(fromURL: character.img)
            self.cahracterTitle.text = character.name
        }
    }
    
    private func backViewGenrator(){
        backView.loadImage(fromURL: "")
    }
    
    override func prepareForReuse() {
        characterImage.image = UIImage()
        backView.image = UIImage()
    }
}
