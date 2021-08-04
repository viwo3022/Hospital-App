//
//  HospitalModel.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/28/21.
//

import Foundation

struct Hospital: Decodable, Identifiable {
    var id: UUID
    var hospitalId: String?
    var name: String?
    var state: String?
    var city: String?
    var county: String?
    var bedCount: String?
    var streetAddress: String?
    var zipCode: String?
    
    enum hospitalKey: String, CodingKey {
        case name
        case state
        case city
        case county
        case bedCount = "hospital_bed_count"
        case hospitalId = "hospital_id"
        case streetAddress = "street_address"
        case zipCode = "zip_code"
     
    }
    
    init(from decoder: Decoder) throws{
        let obj = try decoder.container(keyedBy: hospitalKey.self)
        id = UUID()
        hospitalId = try obj.decodeIfPresent(String.self, forKey: .hospitalId)
        name = try obj.decodeIfPresent(String.self, forKey: .name)
        streetAddress = try obj.decodeIfPresent(String.self, forKey: .streetAddress)
        city = try obj.decodeIfPresent(String.self, forKey: .city)
        state = try obj.decodeIfPresent(String.self, forKey: .state)
        zipCode = try obj.decodeIfPresent(String.self, forKey: .zipCode)
        bedCount = try obj.decodeIfPresent(String.self, forKey: .bedCount)
        county = try obj.decodeIfPresent(String.self, forKey: .county)
        
    }
    
    
    
}
