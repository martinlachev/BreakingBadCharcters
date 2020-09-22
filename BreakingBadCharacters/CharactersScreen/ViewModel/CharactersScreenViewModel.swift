//
//  CharactersViewModel.swift
//  BreakingBadCharacters
//
//  Created by Martin Lachev on 22.09.20.
//  Copyright © 2020 Marto Lachev. All rights reserved.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa


class CharactersScreenViewModel {
    
    public enum CharactersScreenError {
        case internetError(String)
        case serverMessage(String)
    }
    
    public let characters : PublishSubject<[Character]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<CharactersScreenError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    public func requestData(){
        
        self.loading.onNext(true)
        
        APIManager.requestData(url: "characters", method: .get, parameters: nil, completion: { (result) in
            self.loading.onNext(false)
            switch result {
            case .success(let returnJson) :
                let characters = returnJson.arrayValue.compactMap {return Character(data: try! $0.rawData())}
                self.characters.onNext(characters)
            case .failure(let failure) :
                switch failure {
                case .connectionError:
                    self.error.onNext(.internetError("Check your Internet connection."))
                case .authorizationError(let errorJson):
                    self.error.onNext(.serverMessage(errorJson["message"].stringValue))
                default:
                    self.error.onNext(.serverMessage("Unknown Error"))
                }
            }
        })
        
    }
}
