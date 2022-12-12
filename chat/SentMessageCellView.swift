//
//  sentMessageCellView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct SentMessageCellView: View {
    
    var message:Message
    var minSpacerLength:CGFloat
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text(self.message.content)
                if let img = self.message.image {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }else if let sound = self.message.sound{
                    AudioMessageCell(sound: sound)
                }
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            .padding(.all)
        }
    }
}

struct SentMessageCellView_Previews: PreviewProvider {
    static var message = Message.defaultSentMessage()
    static var previews: some View {
        SentMessageCellView(message: message, minSpacerLength: CGFloat(0.5))
    }
}
