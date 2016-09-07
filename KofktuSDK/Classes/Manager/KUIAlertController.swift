//
//  KUIAlertManager.swift
//  KofktuSDK
//
//  Created by Kofktu on 2016. 9. 7..
//  Copyright © 2016년 Kofktu. All rights reserved.
//

import Foundation
import UIKit

public protocol KUIAlertControllerDefaultProtocol {
    var okTitle: String { get }
    var cancelTitle: String { get }
}

public struct KUIAlertControllerDefault: KUIAlertControllerDefaultProtocol {
    public var okTitle: String {
        return "확인"
    }
    public var cancelTitle: String {
        return "취소"
    }
}

public class KUIAlertController {
    
    public static var defaultValue = KUIAlertControllerDefault()
    
    public class func showAlert(title: String?, message: String?, okTitle: String? = nil, onOk: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: okTitle ?? defaultValue.okTitle, style: .Default, handler: { (action) in
            onOk?()
        }))
        UIApplication.sharedApplication().delegate?.window!?.rootViewController?.topMostViewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    public class func showOkCancelAlert(title: String?, message: String?, okTitle: String? = nil, onOk: (() -> Void)? = nil, cancelTitle: String? = nil, onCancel: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: okTitle ?? defaultValue.okTitle, style: .Default, handler: { (action) in
            onOk?()
        }))
        alertController.addAction(UIAlertAction(title: cancelTitle ?? defaultValue.cancelTitle, style: .Cancel, handler: { (action) in
            onCancel?()
        }))
        UIApplication.sharedApplication().delegate?.window!?.rootViewController?.topMostViewController.presentViewController(alertController, animated: true, completion: nil)
    }
}
