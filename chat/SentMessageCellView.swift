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
            Spacer(minLength: minSpacerLength)
            HStack{
                VStack{
                    Text(self.message.content)
                    if let img = self.message.image {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                    }else if let sound = self.message.sound{
                        AudioMessageCell(sound: sound)
                    }
                }.padding(.all)
            }.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
        }
    }
}

struct SentMessageCellView_Previews: PreviewProvider {
    static var message = Message.defaultSentMessage()
    static var previews: some View {
        SentMessageCellView(message: message, minSpacerLength: CGFloat(0.5))
    }
}
