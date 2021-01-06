//
//  ContentView.swift
//  LongTextFeature
//
//  Created by abbasi on 6.1.2021.
//  Copyright © 2021 abbasi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            LongText("This is very long text designed to create enough wrapping to force a More button to appear. Just a little more should push it over the edge and get us to one more line.")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
