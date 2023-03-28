//
//  MovieListInteractor.swift
//  ViperMovies
//
//  Created by NeoSOFT on 21/03/23.
//



import Foundation

class NoticeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=fad5b78120f977d5b9a0468f4f6ff44e")!
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = response else { return }
                do {
                    let jSonData = try JSONDecoder().decode(MovieList.self, from: data)
                    print("json data \(String(describing: jSonData))")
                   // self.movies = jSonData.results
                   // self.presenter?.noticeFetchedSuccess(self.movies! )
                    self.presenter?.movieListSuccess(noticeModelArray: jSonData.results ?? [MovieListData]())
                } catch let er {
                    self.presenter?.MovieListFetchingFailed()
                    debugPrint(er)
                    print(er.localizedDescription)
                }
            }
        }.resume()
        
    }
    
//    func fetchNotice() {
//        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
//
//            if(response.response?.statusCode == 200){
//                if let json = response.result.value as AnyObject? {
//                    let arrayResponse = json["notice_list"] as! NSArray
//                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
//                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
//                }
//            }else {
//                self.presenter?.noticeFetchFailed()
//            }
//        }
//    }
    
    
    
    
}











//import Foundation
//import Alamofire
//import ObjectMapper
//
//class NoticeInteractor: PresenterToInteractorProtocol{
//    var presenter: InteractorToPresenterProtocol?
//
//    func fetchNotice() {
//        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
//
//            if(response.response?.statusCode == 200){
//                if let json = response.result.value as AnyObject? {
//                    let arrayResponse = json["notice_list"] as! NSArray
//                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
//                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
//                }
//            }else {
//                self.presenter?.noticeFetchFailed()
//            }
//        }
//    }
//
//
//
//
//}
