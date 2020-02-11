//
//  Created by matheus.feola on 30/06/19.
//

import Foundation

struct EnvironmentSetting {
    
    var environment: [String:AnyObject]? {
        get {
            return Bundle.main.infoDictionary?["EnvironmentSetting"] as? [String:AnyObject]
        }
    }
    
    var baseUrl: String! {
        get {
            return environment?["BASE_URL"] as? String
        }
    }
}
