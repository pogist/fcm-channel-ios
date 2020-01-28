//
//  FCMClient.swift
//  ureport
//
//  Created by Daniel Amaral on 10/09/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

@objc public class FCMClient: NSObject {

    static var sendingAnswers: Bool = false
    static var dataSource: RestServices = RestServices()

    @objc open class func setup(_ token: String,
                          channel: String,
                          url: String = "https://new.push.al/api/",
                          handler: String = "https://new.push.al/c/fcm/") {
        FCMChannelSettings.setup(token, channel: channel, url: url, handler: handler)
    }

    // MARK: - Flow

    // Fetches and returns asynchronously the detailed definition of the Push flow with id flowUuid
    @objc open class func getFlowDefinition(flowUuid: String, completion: @escaping (FCMChannelFlowDefinition?, _ error: Error?) -> Void) {
        dataSource.getFlowDefinition(flowUuid: flowUuid, completion: completion)
    }

    // Fetches and returns asynchronously all Push flows from contact from no longer than one month prior
    @objc open class func getFlowRuns(contactId: String, completion: @escaping ([FCMChannelFlowRun]?, _ error: Error?) -> Void) {
        dataSource.getFlowRuns(contactId: contactId, completion: completion)
    }

    // MARK: - Messages

    // Sends a message through the handler url from the user with the urn sent
    @objc open class func sendReceivedMessage(urn: String, token: String, message: String, completion: @escaping (_ error: Error?) -> Void) {
        dataSource.sendReceivedMessage(urn: urn, token: token, message: message, completion: completion)
    }

    public typealias FCMChannelMessageAPIResponse = (_ messages: APIResponse<FCMChannelMessage>?, _ error: Error?) -> Void

    // Fetches and returns asynchronously messsages between the user with contactId and the channel, paginated with pageToken
    open class func loadMessages(contactId: String, pageToken: String? = nil, completion: @escaping FCMChannelMessageAPIResponse) {
        dataSource.loadMessages(contactId: contactId, pageToken: pageToken, completion: completion)
    }

    // Fetches and returns asynchronously the message with the specified messageId
    @objc open class func loadMessageByID(_ messageID: Int, completion: @escaping (_ message: FCMChannelMessage?, _ error: Error?) -> Void) {
        dataSource.loadMessageByID(messageID, completion: completion)
    }

    // MARK: - Contact

    // Fetches and returns asynchronously the message with the specified messageId
    @objc open class func loadContact(fromUrn urn: String, completion: @escaping (_ contact: FCMChannelContact?, _ error: Error?) -> Void) {
        dataSource.loadContact(fromUrn: urn, completion: completion)
    }

    // Fetches and returns asynchronously the contact with the specified uuid
    @objc open class func loadContact(fromUUID uuid: String, completion: @escaping (_ contact: FCMChannelContact?, _ error: Error?) -> Void) {
        dataSource.loadContact(fromUUID: uuid, completion: completion)
    }

    // Fetches and updates the current contact saved
    @objc open class func fetchContact(completion: @escaping (_ error: Error?) -> Void) {
       dataSource.fetchContact(completion: completion)
    }

    // Updates the contact with the especified contactUuid with the given information, or creates a new contact with the information if contactUuid is nil
    @objc open class func registerFCMContact(urn: String, name: String, fcmToken: String, contactUuid: String? = nil, completion: @escaping (_ uuid: String?, _ error: Error?) -> Void) {
        dataSource.registerFCMContact(urn: urn, name: name, fcmToken: fcmToken, contactUuid: contactUuid, completion: completion)
    }

    @objc open class func saveContact(_ contact: FCMChannelContact, completion: @escaping (FCMChannelContact?, Error?) -> ()) {
        dataSource.saveContact(contact, completion: completion)
    }

    // MARK: - Language

    // Updates the preferred language in the settings
    @objc open class func savePreferredLanguage(_ language: String) {
        FCMChannelSettings.shared.savePreferedLanguage(language)
    }

    // Returns the language currently set in the settings
    @objc open class func getPreferredLanguage() -> String {
        return FCMChannelSettings.shared.getPreferedLanguage()
    }
}
