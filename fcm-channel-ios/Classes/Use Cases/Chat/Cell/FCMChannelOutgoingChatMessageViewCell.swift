//
//  F2NChatMessageCell1.swift
//  Fight2Night
//
//  Created by Dielson Sales on 21/10/16.
//  Copyright © 2016 Ilhasoft. All rights reserved.
//

import UIKit
import Atributika

open class FCMChannelOutgoingChatMessageViewCell: FCMChannelChatMessageViewCell {
    static let nibName = "FCMChannelOutgoingChatMessageViewCell"

    override open func awakeFromNib() {
        super.awakeFromNib()
        contentMediaView.layer.borderColor = baloonView.backgroundColor?.cgColor
        contentMediaView.layer.borderWidth = 3
    }
}
