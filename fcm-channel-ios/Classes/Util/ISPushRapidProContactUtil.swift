//
//  ISPushRapidProContactUtil.swift
//  ureport
//
//  Created by Daniel Amaral on 15/01/16.
//  Copyright © 2016 ilhasoft. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ISPushRapidProContactUtil: NSObject {
    
    static var rapidProContact = NSMutableDictionary()
    static var groupList:[String] = []
    
    class func putValueIfExists(_ value:String?,countryProgramContactFields:[String],possibleFields:[String]) {
        if value == nil || value!.characters.count == 0{
            return
        }
        
        for possibleField in possibleFields {
            let index = countryProgramContactFields.index(of: possibleField)
            if index != nil && index != -1{
                let field = countryProgramContactFields[index!]
                ISPushRapidProContactUtil.rapidProContact.setValue(value, forKey: field)
                break
            }
        }
    }
    
    class func buildRapidProContactDictionaryWithContactFields(_ contact:ISPushContact,completion:@escaping (NSDictionary) -> Void) {
        
        ISPushManager.getContactFields { (contactFields:[String]?) in
            
            if let contactFields = contactFields , !contactFields.isEmpty {
                
                var age = 0
                
                if contact.birthday != nil {
                    age = (Calendar.current as NSCalendar).components(.year, from: Date(timeIntervalSince1970: NSNumber(value: (contact.birthday?.doubleValue)!/1000 as Double) as TimeInterval), to: Date(), options: []).year!
                    
                    ISPushRapidProContactUtil.putValueIfExists(ISPushDateUtil.birthDayFormatterRapidPro(Date(timeIntervalSince1970: NSNumber(value: (contact.birthday?.doubleValue)!/1000 as Double) as TimeInterval),brFormat: false), countryProgramContactFields: contactFields, possibleFields: ["birthday","birthdate","birth_day","date_of_birth"])
                    ISPushRapidProContactUtil.putValueIfExists(String(age), countryProgramContactFields: contactFields, possibleFields: ["age"])
                    ISPushRapidProContactUtil.putValueIfExists(String(ISPushDateUtil.getYear(Date(timeIntervalSince1970: NSNumber(value: (contact.birthday?.doubleValue)!/1000 as Double) as TimeInterval))), countryProgramContactFields: contactFields, possibleFields: ["year_of_birth","born"])
                }
                
                ISPushRapidProContactUtil.putValueIfExists(contact.email, countryProgramContactFields: contactFields, possibleFields: ["email","e_mail"])
                ISPushRapidProContactUtil.putValueIfExists(contact.name, countryProgramContactFields: contactFields, possibleFields: ["nickname","nick_name"])
                ISPushRapidProContactUtil.putValueIfExists(contact.gender, countryProgramContactFields: contactFields, possibleFields: ["gender"])
                ISPushRapidProContactUtil.putValueIfExists(contact.state, countryProgramContactFields: contactFields, possibleFields: ["state","region","province","county"])
                completion(ISPushRapidProContactUtil.rapidProContact)
            }
            
        }
    }
    
    class func buildRapidProContactRootDictionary(_ contact:ISPushContact,groups:[String],includeCustomFieldsAndValues:[[String:AnyObject]]?,completion:(_ rootDicionary:NSDictionary) -> Void) {

        let rootDictionary = NSMutableDictionary()

        rootDictionary.setValue(ISPushRapidProContactUtil.rapidProContact, forKey: "fields")
        rootDictionary.setValue(["gcm:\(contact.pushIdentity!)"], forKey: "urns")
        rootDictionary.setValue(contact.name, forKey:"name")

        if let includeCustomFieldsAndValues = includeCustomFieldsAndValues {
            for dictionary in includeCustomFieldsAndValues {
                for (index, (key: key, value: value)) in dictionary.enumerated() {
                    ISPushRapidProContactUtil.rapidProContact.setValue(String(describing: value), forKey: key)
                }
            }
        }

        if !groups.isEmpty {
            rootDictionary.setValue(groups, forKey: "groups")
        }

        completion(rootDictionary)
    }

    class func addGenderGroup(_ contact:ISPushContact) {
//        if contact.gender == "Male" {
//            groupList.append(GROUP_UREPORT_MALES)
//        }else {
//            groupList.append(GROUP_UREPORT_FEMALES)
//        }
    }

    class func addAgeGroup(_ contact:ISPushContact) {
//        if contact.birthday != nil {
//            if ISPushDateUtil.getYear(NSDate(timeIntervalSince1970: NSNumber(double: contact.birthday.doubleValue/1000) as NSTimeInterval)) >= YOUTH_MIN_BIRTHDAY_YEAR {
//                groupList.append(GROUP_UREPORT_YOUTH)
//            }else {
//                groupList.append(GROUP_UREPORT_ADULTS)
//            }
//        }
    }
}
