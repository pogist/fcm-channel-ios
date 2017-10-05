//
//  URFlowManager.swift
//  ureport
//
//  Created by John Dalton Costa Cordeiro on 17/11/15.
//  Copyright © 2015 ilhasoft. All rights reserved.
//
import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class ISPushFlowManager {
    
    class func translateFields(_ contact:ISPushContact, message:String) -> String {
        return message.replacingOccurrences(of: "@contact", with: contact.name!)
    }
    
    class func isFlowActive(_ flowRun:ISPushFlowRun) -> Bool {
        return true
//        return (flowRun.completed == false && !ISPushFlowManager.isFlowExpired(flowRun))
    }
    
    class func isFlowExpired(_ flowRun:ISPushFlowRun) -> Bool {
        return false
//        return flowRun.expired_on != nil && (flowRun.expires_on.compare(Date()) == ComparisonResult.orderedDescending)
    }
    
    class func isLastActionSet(_ actionSet:ISPushFlowActionSet?) -> Bool {
        return actionSet == nil || actionSet?.destination == nil || actionSet!.destination!.isEmpty
    }
    
    class func hasRecursiveDestination(_ flowDefinition:ISPushFlowDefinition, ruleSet:ISPushFlowRuleset, rule:ISPushFlowRule) -> Bool {
        if rule.destination != nil {
            let actionSet = getFlowActionSetByUuid(flowDefinition,  destination: rule.destination!, currentActionSet: nil);
            return actionSet != nil && actionSet?.destination != nil
                && actionSet?.destination == ruleSet.uuid!
        }
        return false;
    }
    
    class func getFlowActionSetByUuid(_ flowDefinition: ISPushFlowDefinition, destination: String?, currentActionSet:ISPushFlowActionSet?) -> ISPushFlowActionSet? {
//        for actionSet in flowDefinition.actionSets! {
//            if destination != nil && destination == actionSet.uuid! {
//                return actionSet
//            }
//        }
        
//        if let currentActionSet = currentActionSet {
//            let i = flowDefinition.actionSets?.index(where: {$0.uuid == currentActionSet.uuid})
//
//            if flowDefinition.actionSets?.count >= i!+1 {
//                return flowDefinition.actionSets?[i!+1]
//            }else {
//                return nil
//            }
//
//        }else {
//            return nil
//        }
        return nil
    }
    
    class func getRulesetForAction(_ flowDefinition: ISPushFlowDefinition, actionSet: ISPushFlowActionSet?) -> ISPushFlowRuleset? {
//        for ruleSet in flowDefinition.ruleSets! {
//            if actionSet != nil && actionSet?.destination != nil
//                && actionSet?.destination == ruleSet.uuid {
//                    return ruleSet
//            }
//        }
        return nil
    }

}
