//
//  MVMacros.swift
//  MVMacros
//
//  Created by Michael on 25/6/14.
//  Copyright (c) 2014 Michael Vu. All rights reserved.
//

import Foundation
import UIKit

let MVDeviceIphone = "iPhone"
let MVDeviceIpad = "iPad"
let MVDeviceIpod = "iPod"
let MVDeviceSimulator = "Simulator"
let MVCurrentDevice = UIDevice.currentDevice()
let MVDeviceMode = MVCurrentDevice.model
let MVDeviceModeLocalized = MVCurrentDevice.localizedModel
let MVDeviceName = MVCurrentDevice.name
let MVDeviceOrientation = MVCurrentDevice.orientation
let MVDeviceOrientationIsPortrait = UIInterfaceOrientationIsPortrait(MVSharedApplication.statusBarOrientation)
let MVDeviceOrientationIsLandscape = UIInterfaceOrientationIsLandscape(MVSharedApplication.statusBarOrientation)
let MVIsSimulator = TARGET_IPHONE_SIMULATOR
let MVIsIPad = MVCurrentDevice.userInterfaceIdiom == .Pad
let MVIsIPhone = MVCurrentDevice.userInterfaceIdiom == .Phone
let MVIsIPhone5 = MVIsIPhone && CGSizeEqualToSize(MVMainScreen.preferredMode.size, CGSizeMake(640, 1136))
let MVIsRetina = MVMainScreen?.scale && MVMainScreen.scale == 2
let MVSystemVersionEqualTo: (String) -> (Bool) = {(version:String) -> Bool in MVCurrentDevice.systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch, range: nil, locale: nil) == NSComparisonResult.OrderedSame}
let MVSystemVersionGreaterThan: (String) -> (Bool) = {(version:String) -> Bool in MVCurrentDevice.systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch, range: nil, locale: nil) == NSComparisonResult.OrderedDescending}
let MVSystemVersionGreaterThanOrEqualTo: (String) -> (Bool) = {(version:String) -> Bool in MVCurrentDevice.systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch, range: nil, locale: nil) != NSComparisonResult.OrderedAscending}
let MVSystemVersionLessThan: (String) -> (Bool) = {(version:String) -> Bool in MVCurrentDevice.systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch, range: nil, locale: nil) == NSComparisonResult.OrderedAscending}
let MVSystemVersionLessThanOrEqualTo: (String) -> (Bool) = {(version:String) -> Bool in MVCurrentDevice.systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch, range: nil, locale: nil) != NSComparisonResult.OrderedDescending}
let MVSharedApplication = UIApplication.sharedApplication()
let MVApplicationDelegate = MVSharedApplication.delegate as AppDelegate
let MVUserDefaults = NSUserDefaults.standardUserDefaults()
let MVNotificationCenter = NSNotificationCenter.defaultCenter()
let MVBundle = NSBundle.mainBundle()
let MVMainScreen = UIScreen.mainScreen()
let MVWindow = MVApplicationDelegate.window!
let MVNetworkActivityIndicatorVisible: (Bool) -> () = {(isVisible:Bool) -> Void in MVSharedApplication.networkActivityIndicatorVisible = isVisible }
let MVShowNetworkActivityIndicator = { MVNetworkActivityIndicatorVisible(true) }
let MVHideNetworkActivityIndicator = { MVNetworkActivityIndicatorVisible(false) }
let MVNavigationController = MVWindow.rootViewController ? (MVWindow.rootViewController.isKindOfClass(UINavigationController.classForCoder()) ? MVWindow.rootViewController as UINavigationController : MVWindow.rootViewController.navigationController) : nil
let MVNavigationBar = MVNavigationController!.navigationBar
let MVNavigationBarHeight = MVNavigationBar!.bounds.size.height
let MVTabBarController = MVWindow.rootViewController ? (MVWindow.rootViewController.isKindOfClass(UITabBarController.classForCoder()) ? MVWindow.rootViewController as UITabBarController : MVWindow.rootViewController.tabBarController) : nil
let MVTabBar = MVTabBarController!.tabBar
let MVTabBarHeight = MVTabBar!.bounds.size.height
let MVScreenWidth = MVMainScreen.bounds.size.width
let MVScreenHeight = MVMainScreen.bounds.size.height
let MVTouchHeightDefault = 44
let MVTouchHeightSmall = 32
let MVRectX: (CGRect) -> (CFloat) = {(frame:CGRect) -> CFloat in frame.origin.x }
let MVRectY: (CGRect) -> (CFloat) = {(frame:CGRect) -> CFloat in frame.origin.y }
let MVRectWidth: (CGRect) -> (CFloat) = {(frame:CGRect) -> CFloat in frame.size.width }
let MVRectHeight: (CGRect) -> (CFloat) = {(frame:CGRect) -> CFloat in frame.size.height }
let MVWidthOfView: (UIView) -> (CFloat) = {(view:UIView) -> CFloat in MVRectWidth(view.frame) }
let MVHeightOfView: (UIView) -> (CFloat) = {(view:UIView) -> CFloat in MVRectHeight(view.frame) }
let MVXOfView: (UIView) -> (CFloat) = {(view:UIView) -> CFloat in MVRectX(view.frame) }
let MVYOfView: (UIView) -> (CFloat) = {(view:UIView) -> CFloat in MVRectY(view.frame) }
let MVRectSetWidth: (CGRect, CFloat) -> (CGRect) = {(frame:CGRect, width:CFloat) -> CGRect in CGRectMake(MVRectX(frame), MVRectY(frame), width, MVRectHeight(frame))}
let MVRectSetHeight: (CGRect, CFloat) -> (CGRect) = {(frame:CGRect, height:CFloat) -> CGRect in CGRectMake(MVRectX(frame), MVRectY(frame), MVRectWidth(frame), height)}
let MVRectSetX: (CGRect, CFloat) -> (CGRect) = {(frame:CGRect, x:CFloat) -> CGRect in CGRectMake(x, MVRectY(frame), MVRectWidth(frame), MVRectHeight(frame))}
let MVRectSetY: (CGRect, CFloat) -> (CGRect) = {(frame:CGRect, y:CFloat) -> CGRect in CGRectMake(MVRectX(frame), y, MVRectWidth(frame), MVRectHeight(frame))}
let MVDate_Components:NSCalendarUnit = .YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit
let MVTime_Components:NSCalendarUnit = .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit
let MVDegreesToRadians: (CFloat) -> (CFloat) = {(angle:CFloat) -> CFloat in (angle / 180.0 * CFloat(M_PI))}
let MVRGBA:(CFloat, CFloat, CFloat, CFloat) -> (UIColor) = {(red:CFloat, green:CFloat, blue:CFloat, alpha:CFloat) -> UIColor in UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha:alpha)}
let MVRGB:(CFloat, CFloat, CFloat) -> (UIColor) = {(red:CFloat, green:CFloat, blue:CFloat) -> UIColor in MVRGBA(red, green, blue, 1.0)}
let MVHexColor: (UInt32) -> (UIColor) = {(hex:UInt32) -> UIColor in MVRGBA(Float(Float((hex >> 16) & 0xFF)/255.0), Float(Float((hex >> 8) & 0xFF)/255.0), Float(Float(hex & 0xFF)/255.0), 1.0)}
let MVAddObserver: (AnyObject?, Selector, String?, AnyObject?) -> () = {(observer:AnyObject?, selector:Selector, name:String?, object:AnyObject?) -> Void in MVNotificationCenter.addObserver(observer!, selector: selector, name: name!, object: object!)}
let MVRemoveObserver: (AnyObject?) -> () = {(observer:AnyObject?) -> Void in MVNotificationCenter.removeObserver(observer!)}
let MVNotify:(String?, AnyObject?, NSDictionary?) -> () = {(name:String?, object:AnyObject?, dictionary:NSDictionary?) -> Void in MVNotificationCenter.postNotificationName(name!, object: object!, userInfo: dictionary!)}
let MVRunOnMainThread: (()?) -> () = {(block:()?) -> Void in if NSThread.isMainThread() { block! } else { dispatch_async(dispatch_get_main_queue(), { block! }) } }
let MVInvalidateTimer: (NSTimer) -> () = {(var timer:NSTimer) -> Void in timer.invalidate();timer=NSTimer()}
let MVQuickError: (Int, String, String?) -> (NSError) = {(code:Int, description:String, domain:String?) -> NSError in NSError(domain: domain!, code: code, userInfo: NSDictionary(object: description, forKey: NSLocalizedDescriptionKey))}
func MVLogger(object:AnyObject, name:String = __FUNCTION__) {println("\(name) \(object.description)")}