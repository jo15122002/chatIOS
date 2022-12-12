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
            HStack{
                VStack{
                    Text(message.content)
                    if let img = self.message.image {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                    }else if let sound = self.message.sound{
                        AudioMessageCell(sound: sound)
                    }
                }.padding(.all)
            }.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            Spacer(minLength: minSpacerLength)
        }
    }
}

struct ReceivedMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedMessageCellView(message: Message.defaultSentMessage(), minSpacerLength: CGFloat(0.5))
    }
}
