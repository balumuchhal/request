//
//  BMHelper.swift
//  Request
//
//  Created by Elluminati on 08/01/20.
//  Copyright © 2020 swiftui learn. All rights reserved.
//

import UIKit

class VC:UIViewController {
    deinit {
        print("deinit \(#function)")
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
