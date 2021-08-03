//
//  ContentView.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/28/21.
//

import SwiftUI

struct HospitalView: View {
    @State private var stateName: StateAbbreviation = .NA
    @StateObject var viewModel = HospitalViewModel()

    var body: some View {
        
        
        NavigationView{
            
            VStack(alignment: .center){
                Spacer().frame(height: 32)
                Text("Hospital Finder")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("teal"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 16)
                
                HStack{
                    
                    Spacer()
                    
                    Picker(selection: $stateName, label: HStack{
                        Text(viewModel.getName(for: stateName))
                        Spacer()
                        Text("▼")
                        
                    }, content: {
                        ForEach(viewModel.stateList) { state in
                            Text(state.name)
                                .fontWeight(.bold)
                                .tag(state.id)
                                .padding(.trailing, 0)
                            
                        }
                    })
                    .pickerStyle(MenuPickerStyle())
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                    .onChange(of: stateName) { _ in
                   
                        viewModel.getHospitals(for: stateName)
                       
                       
                        
                    }
                    .background(Color("yellow"))
                    .padding(.vertical, 10)
                    .background(Color("yellow"))
                    .padding(.horizontal, 24).background((Color("yellow"))).cornerRadius(25)
                    
                    Spacer()
                }
                .padding(.horizontal, 42)
                .padding(.vertical, 20)
                
                
                Spacer().frame(height: 32)

                List(viewModel.hospitalData){ hospital in
                    NavigationLink(destination: HospitalDetailView(data: hospital)){
                        HospitalRow(hospitalName: hospital.name ?? "")
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
      
    }
}

struct HospitalView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalView()
    }
}
