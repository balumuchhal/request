//
//  Request.swift
//  Request
//
//  Created by Balu Muchhal on 07/01/20.
//  Copyright © 2020 swiftui learn. All rights reserved.
//

import Foundation


class Request {
    let get = "GET"
    let post = "POST"
    func getResponse(url:String,parameters:[String:Any],method:String,completionHandler: @escaping (Data?, [String:Any], Error?) -> Void) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            
            //SET REQUEST FOR GET
            if method.uppercased() == get {
                let parameterString = parameters.stringFromHttpParameters()
                let url = URL(string: "\(url)?\(parameterString)")!
                request = URLRequest(url: url)
                request.httpMethod = get
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            }
            
            //SET REQUEST FOR POST
            else if method.uppercased() == post {
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                request.httpMethod = post
                request.httpBody = parameters.percentEncoded()
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                    // check for fundamental networking error
                    print("error", error ?? "Unknown error")
                    completionHandler(Data(),[:],error)
                    return
                }
                
                guard (200 ... 299) ~= response.statusCode else {
                    // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    completionHandler(data,[:],error)
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let dictinary = responseJSON as? [String: Any] {
                    completionHandler(data,dictinary,error)
                }
                completionHandler(data,[:],error)
            }
            task.resume()
        }
    }
    init() {
        print("init \(#function)")
    }
    deinit {
        print("deinit \(#function)")
    }
}
