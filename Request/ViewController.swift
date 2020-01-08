//
//  ViewController.swift
//  Request
//
//  Created by Elluminati on 07/01/20.
//  Copyright © 2020 swiftui learn. All rights reserved.
//

import UIKit

class ViewController: VC {

    //MARK:- VARIABLE
    var url = "https://reqres.in/api/users"
    
    //MARK:- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        post()
    }
    
    
    deinit {
        print("deinit \(#function)")
    }
    
    //MARK:- UDF
    
    //GET REQUEST
    func get() {
        let req:Request = Request()
        let param = ["page":"2"]
        req.getResponse(url: url, parameters: param, method: req.get, completionHandler: { data,response,error in
            print(response)
        })
    }
    
    //POST REQUEST
    func post() {
        let param = ["name":"morpheus",
                     "job":"leader"]
        let req:Request = Request()
        req.getResponse(url: url, parameters: param, method: req.post, completionHandler: { data,response,error in
            print(response)
        })
    }
}

