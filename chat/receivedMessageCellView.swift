//
//  receivedMessageCellView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct receivedMessageCellView: View {
    var text:String
    var body: some View {
        HStack{
            Text(text)
            Spacer()
        }
    }
}

struct receivedMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        receivedMessageCellView(text: "Message recu")
    }
}
