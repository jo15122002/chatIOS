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
            VStack{
                Text(message.content)
                if let img = self.message.image {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }else if let sound = self.message.sound{
                    AudioMessageCell(sound: sound)
                }
            }
            Spacer(minLength: minSpacerLength)
        }
    }
}

struct ReceivedMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedMessageCellView(message: Message.defaultSentMessage(), minSpacerLength: CGFloat(0.5))
    }
}
