//
//  CharactersViewController.swift
//  BreakingBadCharacters
//
//  Created by Martin Lachev on 22.09.20.
//  Copyright © 2020 Marto Lachev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharactersViewController: UIViewController {
    
    
    @IBOutlet private weak var charactersCollectionView: UICollectionView!
    
    public var characters = PublishSubject<[Character]>()
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        charactersCollectionView.backgroundColor = .clear
    }
    
    private func setupBinding(){
        
        charactersCollectionView.register(UINib(nibName: "CharactersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: CharactersCollectionViewCell.self))
        
        characters.bind(to: charactersCollectionView.rx.items(cellIdentifier: "CharactersCollectionViewCell", cellType: CharactersCollectionViewCell.self)) {  (row,character,cell) in
            cell.character = character
//            cell.withBackView = true
            }.disposed(by: disposeBag)
        
        charactersCollectionView.rx.willDisplayCell
            .subscribe(onNext: ({ (cell,indexPath) in
                cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -250, 0)
                cell.layer.transform = transform
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
            })).disposed(by: disposeBag)
    }
    
}
