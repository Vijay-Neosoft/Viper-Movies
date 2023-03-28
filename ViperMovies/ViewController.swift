//
//  ViewController.swift
//  ViperMovies
//
//  Created by NeoSOFT on 21/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let notice = MoviesRouter.createModule()
        
        self.navigationController?.pushViewController(notice, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }


}

