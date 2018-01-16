//
//  contViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 16/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class contViewController: UIViewController {

    let service = GetRequestFactory.make()
    override func viewDidLoad() {
        super.viewDidLoad()
        service.get(url: "https://api.themoviedb.org/3/genre/tv/list?api_key=5537f1e43fe3693b3365549d0a5cd5e4") { (data, error) in
            
            print("DEU BOM \(String(describing: data))")
            print("DEU RUIM \(String(describing: error))")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
