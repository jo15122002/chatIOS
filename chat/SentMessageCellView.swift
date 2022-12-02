//
//  sentMessageCellView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct SentMessageCellView: View {
    
    var text:String
    var minSpacerLength:CGFloat
    
    var body: some View {
        HStack{
            Spacer(minLength: minSpacerLength)
            Text(text)
        }
    }
}

struct SentMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        SentMessageCellView(text: "message envoyé", minSpacerLength: CGFloat(0.5))
    }
}
