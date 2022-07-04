//
//  ApiViewController.swift
//  MVVM
//
//  Created by Saurabhnegi on 24/06/22.
//

import UIKit

class ApiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func feth(_ sender: Any) {
        
        let URLResponse = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!) { data, response, error in
            if(data != nil && error == nil) {
                let responseData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                let result = responseData as! Dictionary<String,Any>
                 print(result["id"])
            }
           
            
            
        }.resume()
        
        
        
        
        
    }


}
