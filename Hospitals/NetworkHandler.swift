//
//  NetworkHandler.swift
//  Hospitals
//
//  Created by Vienna Wong on 7/28/21.
//

import Foundation

enum NetworkError: Error {
    case dataNotReceived
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataNotReceived:
            return "Server did not return any data"
        }
    }
}

class NetworkHandler: NSObject {
    static let shared = NetworkHandler()
    
    
    var urlString = "http://www.communitybenefitinsight.org/api/get_hospitals.php"
    var dataTask:URLSessionDataTask?
    let session =  URLSession(configuration: URLSessionConfiguration.default)
    
 
    
    
    /// Get Request from URL
    /// - Parameters:
    ///   - state: abbreviation of stste
    ///   - completion: completion
    
    func requestData(in state: StateAbbreviation, completion: @escaping ([Hospital], Error?) -> Void)  {
        var urlComp = URLComponents(string: urlString)
        urlComp?.query = "state=\(state.rawValue)"
        guard let url = urlComp?.url else {
            fatalError("invalid")
            
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return fetchHospitalData(with: request, completion: completion)
        
        
    }
    
 
    
    /// Fetch the JSON File with the hospital data
    /// - Parameters:
    ///   - myRequest: Pass om a URL request with assigned http methof
    ///   - completion: Completion
    
    private func fetchHospitalData(with myRequest: URLRequest, completion: @escaping ([Hospital], Error?) -> Void) {
        dataTask?.cancel()
        dataTask = session.dataTask(with: myRequest) { data, response, error in

            
            if let error = error{
                debugPrint(error.localizedDescription)
                completion([], error)
                
            }
            else if
                let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200{ //if success (code 200)
                self.decodeData(data: data, completion: completion)
            }
            else{
                completion([], error)
            }
        }
        dataTask?.resume()
    }
 
    
    /// Maps JSON data to indivisual objects of type hospital
    /// - Parameter data: passed in data
    /// - Returns: Array of hospital objects
    
    private func decodeData(data: Data?, completion: @escaping ([Hospital], Error?) -> Void){
        guard let data = data else {
            debugPrint("Data is nil")
            completion([], NetworkError.dataNotReceived)
            return
        }
        do {
            let hospitalData: [Hospital] = try JSONDecoder().decode([Hospital].self, from: data)
            completion(hospitalData, nil)
        } catch(let error) {
            completion([], error)
        }
        
        
    }
 
    
    /// Displays hospital data
    /// - Parameter data: data
    /// - Returns: None
    
    func displayHospital(data: [Hospital]) -> Void {
        
        for eachHos in data {
            print("name: \(eachHos.name ?? "")")
            print("address: \(eachHos.streetAddress ?? "")")
            print("city: \(eachHos.city ?? "")")
            print("county: \(eachHos.county ?? "")")
            print("zipcode: \(eachHos.zipCode ?? "")")
            print("bed count: \(eachHos.bedCount ?? "")")
            print("\n")
        }
        return
    }
    
    
    
}


