

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

   // var presentar = MovieListPresentar()
    var presentor: ViewToPresenterProtocol?
    var noticeArrayList = [MovieListData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MovieListTableViewCell2", bundle: nil), forCellReuseIdentifier: "MovieListTableViewCell2")

        presentor?.startFetchingMovieList()
    }

}



extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noticeArrayList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as? MovieListTableViewCell else {
            return  UITableViewCell()
        }
        cell.setData(dataSource: noticeArrayList[indexPath.item])
        
        return cell
       
    }
    
    
}


extension MovieListViewController:PresenterToViewProtocol{
    func showMovieList(MovieArray: [MovieListData]) {
        self.noticeArrayList = MovieArray
        tableView.reloadData()
    }
    
    
    func showMovieList(noticeArray: [MovieListData]) {

        self.noticeArrayList = noticeArray
        tableView.reloadData()
//        self.noticeArrayList = noticeArray
//        self.uiTableView.reloadData()
//        hideProgressIndicator(view: self.view)
        
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
