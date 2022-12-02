//
//  receivedMessageCellView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct ReceivedMessageCellView: View {
    var text:String
    var minSpacerLength:CGFloat
    var body: some View {
        HStack{
            Text(text)
            Spacer(minLength: minSpacerLength)
        }
    }
}

struct ReceivedMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedMessageCellView(text: "Message recu", minSpacerLength: CGFloat(0.5))
    }
}
