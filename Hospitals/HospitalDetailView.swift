//
//  HospitalDetailView.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/29/21.
//

import Foundation
import SwiftUI

enum HospitalFields{
    static let name = "Hospital Name"
    static let state = "State Abbreviation"
    static let city = "City"
    static let county = "County"
    static let bedCount = "Hospital Bed Count"
    static let hospitalId = "Hospital Id"
    static let streetAddress = "Street Address"
    static let zipCode = "Zip Code"
    
}

struct HospitalDetailView: View {
    var data: Hospital
    
    var body: some View{
        
        VStack{
            Spacer(minLength: 32)
            Spacer()
                .navigationTitle("Hospital Information")
                .navigationBarTitleDisplayMode(.inline)
            
            ScrollView{
                HospitalDetailRow(title: HospitalFields.name, description: data.name)
                HospitalDetailRow(title: HospitalFields.state, description: data.state)
                HospitalDetailRow(title: HospitalFields.city, description: data.city)
                HospitalDetailRow(title: HospitalFields.county, description: data.county)
                HospitalDetailRow(title: HospitalFields.bedCount, description: data.bedCount)
                HospitalDetailRow(title: HospitalFields.hospitalId, description: data.hospitalId)
                HospitalDetailRow(title: HospitalFields.streetAddress, description: data.streetAddress)
                HospitalDetailRow(title: HospitalFields.zipCode, description: data.zipCode)
            }
            Spacer()
            
        }
    }
}

