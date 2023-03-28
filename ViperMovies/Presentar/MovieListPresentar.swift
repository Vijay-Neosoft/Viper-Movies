//
//  MovieListPresentar.swift
//  ViperMovies
//
//  Created by NeoSOFT on 27/03/23.
//

import Foundation
import UIKit

//class MovieListPresentar: ViewToPresentarMovieListProtocol {
//    var interactor: PresenterToInteractorMovieListProtocol? = MovieListInteractor()
//
//
//    var view: PresenterToViewMovieListProtocol?
//    var movies = [MovieListData]()
//
//    func viewDidLoad() {
//        interactor?.fetchMovieList()
//    }
//    func numberOfRowsInSection() -> Int {
//       return  interactor?.movies?.count ?? 0
//    }
//
//    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell
//        let moviedata = interactor?.movies?[indexPath.row]
//        cell.movieName.text = moviedata?.title
//        cell.dateTimeLabel.text = moviedata?.releaseDate
//
//       return cell
//    }
//
//    func tableViewCellHeight() -> CGFloat {
//        return 150
//    }
//}


import Foundation
import UIKit

class MovieListPresentar:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingMovieList() {
        interactor?.fetchNotice()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller:navigationController)
    }

}

extension MovieListPresentar: InteractorToPresenterProtocol{
    
    func movieListSuccess(noticeModelArray: [MovieListData]) {
        view?.showMovieList(noticeArray: noticeModelArray)
    }
    
    func MovieListFetchingFailed() {
        view?.showError()
    }
    
    
}
