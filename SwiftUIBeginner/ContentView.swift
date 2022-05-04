//
//  ContentView.swift
//  SwiftUIBeginner
//
//  Created by Pablo Martinez Lopez on 4/5/22.
//

import SwiftUI

struct CustomData: Identifiable {
    var id = UUID()
    let title: String
    let imageName: String
    let imageDescription: String
    let imageDate: String
}

struct ContentView: View {
    
    var items: [CustomData] = []
    
    var body: some View {
        NavigationView {
            List(items) { data in
                NavigationLink(destination: DataView(data: data)) {
                    HStack {
                        Image(data.imageName)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10)
                        Text(data.title)
                            .padding()
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationBarTitle("Photos")
        }
    }
}

struct DataView: View {
    
    var data: CustomData
    
    var body: some View {
        VStack {
            Image(data.imageName)
                .resizable()
                .frame(width: 500, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .padding(5)
            Text(data.imageDescription)
                .padding(5)
                .font(.title)
            Spacer()
            Text(data.imageDate)
        }
        .navigationBarTitle(data.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(items: [
                CustomData(title: "Beach", imageName: "beach", imageDescription: "A beach", imageDate: "01-01-2000"),
                CustomData(title: "Mountain", imageName: "mountain", imageDescription: "A mountain", imageDate: "01-01-2010")
            ])
                .environment(\.colorScheme, .light)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            ContentView(items: [
                CustomData(title: "Beach", imageName: "beach", imageDescription: "A beach", imageDate: "01-01-2000"),
                CustomData(title: "Mountain", imageName: "mountain", imageDescription: "A mountain", imageDate: "01-01-2010")
            ])
                .environment(\.colorScheme, .dark)
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        }
        
    }
}
