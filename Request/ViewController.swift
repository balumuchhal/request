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
        upload()
    }
    
    
    deinit {
        print("deinit \(#function)")
    }
    
    //MARK:- UDF
    
    //GET REQUEST
    func get() {
        let req:Request = Request()
        let param = ["page":"2"]
        req.getResponse(url: url, parameters: param, httpMethod: .get, completionHandler: { data,response,error in
            print(response)
        })
    }
    
    //POST REQUEST
    func post() {
        let param = ["name":"morpheus",
                     "type":"leader"]
        let req:Request = Request()
        req.getResponse(url: url, parameters: param, httpMethod: .post, completionHandler: { data,response,error in
            print(response)
        })
    }
    //post using multipart
    func upload() {
        let data = UIImage(named: "01")!.jpegData(compressionQuality: 1.0)!
        let params:[String:Any]=["first_name": "Bm","picture_data":data]
        let req:Request = Request()
        req.POST(url: url, parameters: params, completionHandler: { data,response,error in
            print(response)
        })
    }
}

