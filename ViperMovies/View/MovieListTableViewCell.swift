//
//  MovieListTableViewCell.swift
//  ViperMovies
//
//  Created by NeoSOFT on 27/03/23.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var likeRatingLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(dataSource: MovieListData){
        movieName.text = dataSource.title
    }
    

}
