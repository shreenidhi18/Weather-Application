//
//  ButtonView.swift
//  Weather-Application
//
//  Created by shreenidhi vm on 22/10/23.
//

import SwiftUI

struct ButtonView: View {
    @State var text:String?
    @State var textColor:Color?
    @State var backgroundColor:Color?
    var body: some View {
        Button{
            print("tapped")
        }label: {
            Text("Change Day Time")
                .frame(width: 280,height: 50)
                .background(backgroundColor)
                .font(.system(size:20,weight: .bold,design: .default))
                .foregroundColor(textColor)
                .cornerRadius(10)
        }
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
