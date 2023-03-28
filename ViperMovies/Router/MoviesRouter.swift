//
//  MoviesRouter.swift
//  ViperMovies
//
//  Created by NeoSOFT on 28/03/23.
//

import Foundation

import Foundation
import UIKit

class MoviesRouter:PresenterToRouterProtocol{
    
    static func createModule() -> MovieListViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! MovieListViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = MovieListPresentar()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = MoviesRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
        
        let movieModue = MoviesRouter.createModule()
        navigationController.pushViewController(movieModue,animated: true)
        
    }
    
}
