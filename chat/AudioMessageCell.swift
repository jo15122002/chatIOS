//
//  AudioMessageCell.swift
//  chat
//
//  Created by digital on 12/12/2022.
//

import SwiftUI

struct AudioMessageCell: View {
    var sound:Data
    var body: some View {
        Button("play"){
            AudioPlayer.getInstance().playSound(data: self.sound)
        }
    }
}

struct AudioMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        AudioMessageCell(sound: Data())
    }
}
