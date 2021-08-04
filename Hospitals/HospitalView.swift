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
//    @State private var alertIsPresented = false

    var body: some View {
        
        ZStack {
            NavigationView{
                
                VStack(alignment: .center){
                    Spacer().frame(height: 32)
                    
                    Text("Hospital Finder")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("teal"))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 24)
                    
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
                        .onChange(of: stateName) { state in
                       
                            viewModel.getHospitals(for: stateName)
                            
                        }
                        .background(Color("yellow"))
                        .padding(.vertical, 10)
                        .background(Color("yellow"))
                        .padding(.horizontal, 24).background((Color("yellow"))).cornerRadius(25)
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal, 42)
                    .padding(.vertical,16)
                    
                    
                    Spacer().frame(height: 42)

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
            .alert(isPresented: $viewModel.displayingAlert) {
                
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Dismiss")))
                
            }
           
        
        }
    }
    
    func createAlert() -> some View {
        
        alert(isPresented: $viewModel.displayingAlert) {
            
            Alert(title: Text("Error"), message: Text("placeholder"), dismissButton: .default(Text("Dismiss")))
            
        }
   
    }
    
}

struct HospitalView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalView()
    }
}
