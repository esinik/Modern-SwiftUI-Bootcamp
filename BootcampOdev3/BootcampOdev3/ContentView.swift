//
//  ContentView.swift
//  BootcampOdev3
//
//  Created by Ertan Şinik on 27.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0 

    var body: some View {
        HStack(spacing: 16) {
            Button {
                count -= 1
            } label: {
                Image(systemName: "minus.circle.fill")
                    .frame(width: 50, height: 50)
                    .font(.system(size: 30))
                    
            }
            .buttonStyle(.bordered)

            Text("\(count)")
                .font(.system(size: 72, weight: .bold, design: .rounded))
            
            Button {
                count += 1
            } label: {
                Image(systemName: "plus.circle.fill")
                    .frame(width: 50, height: 50)
                    .font(.system(size: 30))
                    
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}
