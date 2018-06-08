//
//  AdMobSettings.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/08.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

struct AdMobSettings {
    static let filePath = Bundle.main.path(forResource: String(describing: AdMobSettings.self), ofType: "plist")
    static let plist = NSDictionary(contentsOfFile: filePath!) ?? [:]
    
    static var appId: String {
        return plist.object(forKey: "AppId") as? String ?? ""
    }
    
    static var bannerId: String {
        return plist.object(forKey: "BannerId") as? String ?? ""
    }
    
    static var bannerTestId: String {
        return plist.object(forKey: "BannerTestId") as? String ?? ""
    }
    
    static var interstitialId: String {
        return plist.object(forKey: "InterstitialId") as? String ?? ""
    }
    
    static var interstitialTestId: String {
        return plist.object(forKey: "InterstitialTestId") as? String ?? ""
    }
}
