//
//  receivedMessageCellView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct ReceivedMessageCellView: View {
    var message:Message
    var minSpacerLength:CGFloat
    var body: some View {
        HStack{
            Text(message.content)
            Spacer(minLength: minSpacerLength)
        }
    }
}

struct ReceivedMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedMessageCellView(message: Message.defaultSentMessage(), minSpacerLength: CGFloat(0.5))
    }
}
