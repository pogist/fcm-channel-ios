//
//  URFlowRun.swift
//  ureport
//
//  Created by John Dalton Costa Cordeiro on 17/11/15.
//  Copyright © 2015 ilhasoft. All rights reserved.
//

import UIKit
import ObjectMapper

open class ISPushFlowRun: NSObject, Mappable {

    open var flow: ISPushFlow!
    open var contact: ISPushContact!
    open var path: [ISPushFlowStep]!
    open var responded: Bool!
    open var createdOn: Date!
    open var modifiedOn: Date!
    open var exitType: String!

    required public init?(map: Map){}

    open func mapping(map: Map) {
        self.flow       <- map["flow"]
        self.contact    <- map["contact"]
        self.path       <- map["path"]
        self.responded  <- map["responded"]
        self.createdOn  <- (map["created_on"], ISPushRapidPRODateTransform())
        self.modifiedOn <- (map["modified_on"], ISPushRapidPRODateTransform())
        self.exitType   <- map["exit_type"]
    }
}
