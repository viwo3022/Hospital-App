//
//  HospitalDetailRow.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/29/21.
//

import Foundation
import SwiftUI

struct HospitalDetailRow: View {
    var title: String = ""
    var description: String? 
    
    var body: some View{
        HStack{
            Spacer().frame(width: 16)
            VStack(alignment: .leading, spacing: 5){
                Text(title)
                    .foregroundColor(Color("teal"))
                    .bold()
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                Text(description ?? "Unknown")
                    .foregroundColor(Color("gray"))
                    .italic()
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Spacer().frame(height: 16)
            }
            Spacer()
        }
        
    }
}

struct HospitalDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        HospitalDetailRow()
    }
}
