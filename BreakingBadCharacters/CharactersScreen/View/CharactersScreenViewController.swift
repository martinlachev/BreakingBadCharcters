//
//  ViewController.swift
//  BreakingBadCharecters
//
//  Created by Marto Lachev on 29.07.20.
//  Copyright © 2020 Marto Lachev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharactersScreenViewController: UIViewController, Storyboarded {
    
    weak var coordinator: CharactersScreenCoordinator?
    @IBOutlet weak var charactersView: UIView!
    
    private lazy var charactersViewController: CharactersViewController = {
        let storyboard = UIStoryboard(name: "Characters", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
        self.add(asChildViewController: viewController, to: charactersView)
        
        return viewController
    }()

    var charactersScreenViewModel = CharactersScreenViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        charactersScreenViewModel.requestData()
    }
    
    private func setupBindings() {
        charactersScreenViewModel.loading
            .bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        
        charactersScreenViewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                switch error {
                case .internetError(let message):
                    print(message)
//                    MessageView.sharedInstance.showOnView(message: message, theme: .error)
                case .serverMessage(let message):
                    print(message)
//                    MessageView.sharedInstance.showOnView(message: message, theme: .warning)
                }
            })
            .disposed(by: disposeBag)
        
        charactersScreenViewModel
            .characters
            .observeOn(MainScheduler.instance)
            .bind(to: charactersViewController.characters)
            .disposed(by: disposeBag)
    }
}
