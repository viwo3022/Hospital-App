//
//  HospitalViewModel.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/28/21.
//

import Foundation

struct StateModel: Identifiable {
    var id: StateAbbreviation
    var name: String
}

class HospitalViewModel: ObservableObject {
    var stateList: [StateModel] = [
        StateModel(id: .NA, name: "Select a State"),
        StateModel(id: .AL, name: "Alabama"),
        StateModel(id: .AK, name: "Alaska"),
        StateModel(id: .AZ , name: "Arizona"),
        StateModel(id: .AR, name: "Arkansas"),
        StateModel(id: .CA, name: "California"),
        StateModel(id: .CO, name: "Colorado"),
        StateModel(id: .CT, name: "Connecticut"),
        StateModel(id: .DE, name: "Delaware"),
        StateModel(id: .FL, name: "Florida"),
        StateModel(id: .GA, name: "Georgia"),
        StateModel(id: .HI, name: "Hawaii"),
        StateModel(id: .ID, name: "Idaho"),
        StateModel(id: .IL, name: "Illinois"),
        StateModel(id: .IN, name: "Indiana"),
        StateModel(id: .IA, name: "Iowa"),
        StateModel(id: .KS, name: "Kansas"),
        StateModel(id: .KY, name: "Kentucky"),
        StateModel(id: .LA, name: "Louisiana"),
        StateModel(id: .ME, name: "Maine"),
        StateModel(id: .MD, name: "Maryland"),
        StateModel(id: .MA, name: "Massachusetts"),
        StateModel(id: .MI, name: "Michigan"),
        StateModel(id: .MN, name: "Minnesota"),
        StateModel(id: .MS, name: "Mississippi"),
        StateModel(id: .MO, name: "Missouri"),
        StateModel(id: .MT, name: "Montana"),
        StateModel(id: .NE, name: "Nebraska"),
        StateModel(id: .NV, name: "Nevada"),
        StateModel(id: .NH, name: "New Hampshire"),
        StateModel(id: .NJ, name: "New Jersey"),
        StateModel(id: .NM, name: "New Mexico"),
        StateModel(id: .NY, name: "New York"),
        StateModel(id: .NC, name: "North Carolina"),
        StateModel(id: .ND, name: "North Dakota"),
        StateModel(id: .OH, name: "Ohio"),
        StateModel(id: .OK, name: "Oklahoma"),
        StateModel(id: .OR, name: "Oregon"),
        StateModel(id: .PA, name: "Pennsylvania"),
        StateModel(id: .RI, name: "Rhode Island"),
        StateModel(id: .SC, name: "South Carolina"),
        StateModel(id: .SD, name: "South Dakota"),
        StateModel(id: .TN, name: "Tennessee"),
        StateModel(id: .TX, name: "Texas"),
        StateModel(id: .UT, name: "Utah"),
        StateModel(id: .VT, name: "Vermont"),
        StateModel(id: .VA, name: "Virginia"),
        StateModel(id: .WA, name: "Washington"),
        StateModel(id: .WV, name: "West Virginia"),
        StateModel(id: .WI, name: "Wisconson"),
        StateModel(id: .WY, name: "Wyoming")
        

    ]
    
    @Published var hospitalData: [Hospital] = []
    @Published var errorMessage: String = ""
    @Published var displayingAlert: Bool = false
    
    /// Get Hospital data for state parameter
    /// - Parameter state: Abbreviation for state
    
    func getHospitals(for state: StateAbbreviation) {
        guard state != .NA else {
            hospitalData = []
            return
        }
        NetworkHandler.shared.requestData(in: state) { [weak self] (data, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let error = error{
                    self.errorMessage = error.localizedDescription
                    self.displayingAlert = true
                }
                self.hospitalData = data
            }
            
        }
    }
    
    
    /// Get hospital name for hospital in state
    /// - Parameter abbreviation: Abbreviation for state
    /// - Returns: Name of Hospital
    
    func getName(for abbreviation: StateAbbreviation) -> String {
        stateList.first(where: {$0.id == abbreviation})?.name ?? "Unknown"
        
    }
}


