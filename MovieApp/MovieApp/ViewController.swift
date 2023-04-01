//
//  ViewController.swift
//  MovieApp
//
//  Created by Lora on 01.04.2023..
//

import UIKit
import MovieAppData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let details = MovieUseCase().getDetails(id: 111161)
        print(details)
    }


}

