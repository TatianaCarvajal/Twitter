//
//  HomeViewModel.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 5/12/23.
//

import Foundation

protocol HomeDelegate: AnyObject {
    func load()
    func stopLoad()
    func onFailure(message: String)
    func onSuccess()
}

class HomeViewModel {
    
    weak var delegate: HomeDelegate?
}
