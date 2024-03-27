//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Tom Reilly on 3/27/24.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int

    var body: some View {
        switch rating {
        case 1:
            Text("😭")
        case 2:
            Text("😢")
        case 3:
            Text("🫤")
        case 4:
            Text("🙂")
        case 5:
            Text("😄")        
        case 6:
            Text("🤩")        
        case 7:
            Text("😍")
        default:
            Text("🤯")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
