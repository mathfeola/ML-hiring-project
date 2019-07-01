//
//  ApiClient.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Alamofire

class ApiClient {
    
    static let sharedApliClient = ApiClient()
    
    public func execute(router: Router,
                        completion: @escaping (Data) -> Void) {
        
        Alamofire.request(router, method: router.method).responseJSON { response in
            
            guard let data = response.data else { return }
            
            completion(data)
        }
    }
}
