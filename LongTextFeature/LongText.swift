//
//  LongText.swift
//  LongTextFeature
//
//  Created by abbasi on 6.1.2021.
//  Copyright © 2021 abbasi. All rights reserved.
//

import SwiftUI
struct LongText: View {

    /* Indicates whether the user want to see all the text or not. */
    @State private var expanded: Bool = false

    /* Indicates whether the text has been truncated in its display. */
    @State private var truncated: Bool = false

    private var text: String

    var lineLimit = 3

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Render the real text (which might or might not be limited)
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)

                .background(

                    // Render the limited text and measure its size
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { displayedGeometry in

                            // Create a ZStack with unbounded height to allow the inner Text as much
                            // height as it likes, but no extra width.
                            ZStack {

                                // Render the text without restrictions and measure its size
                                Text(self.text)
                                    .background(GeometryReader { fullGeometry in

                                        // And compare the two
                                        Color.clear.onAppear {
                                            self.truncated = fullGeometry.size.height > displayedGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden() // Hide the background
            )

            if truncated && !expanded { toggleButton }
        }
    }

    var toggleButton: some View {
        Button(action: { self.expanded.toggle() }) {
            Text(self.expanded ? "Show less" : "Show more")
                .font(.caption)
            
        }
    }
}

struct LongText_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
