//
//  sentMessageCellView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct sentMessageCellView: View {
    
    var text:String
    
    var body: some View {
        HStack{
            Spacer()
            Text(text)
        }
    }
}

struct sentMessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        sentMessageCellView(text: "message envoyé")
    }
}
