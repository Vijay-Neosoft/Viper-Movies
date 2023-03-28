//
//  ListMoviesProtocols.swift
//  ViperMovies
//
//  Created by NeoSOFT on 24/03/23.
//

import UIKit

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingMovieList()
    func showMovieController(navigationController:UINavigationController)

}

protocol PresenterToViewProtocol: class{
    func showMovieList(noticeArray: [MovieListData])
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> MovieListViewController
    func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol: class {
    func movieListSuccess(noticeModelArray: [MovieListData])
    func MovieListFetchingFailed()
}
