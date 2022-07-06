

import Foundation




struct LaunchInfo : Codable{
    static var fake = LaunchInfo(links: Links(patch: Patch(small: "https://imgur.com/a/MFFIpBB", large: "https://imgur.com/a/MFFIpBB"), youtube_id: "123"), rocket: "Fake rocket", success: false, failures: [Failures(time: 1, altitude: false, reason: "Fake reason")], launchpad: "Fake Launchpad", flight_number: 1, name: "Fake", date_unix: 1111, date_local: "", cores: [Core(flight: 1, gridfins: false, legs: false, reused: false, landing_attempt: false, landing_success: false, landing_type: "Fake landing", landpad: "Fake landpad")])
    
    var links: Links
    var rocket: String
        
    
    var success: Bool
    var failures: [Failures]
    var details: String?
    var launchpad: String
    var flight_number: Int
    var name : String
    var date_unix: Int
    var date_local : String
    var cores: [Core]

}

struct Links : Codable{
    var patch : Patch
    var youtube_id : String
}


struct Patch: Codable{
    var small : String
    var large : String
}

struct Failures: Codable{
    var time : Int
    var altitude : Bool
    var reason : String
}

struct Core : Codable{
    var flight : Int
    var gridfins : Bool
    var legs : Bool
    var reused : Bool
    var landing_attempt : Bool
    var landing_success : Bool
    var landing_type : String
    var landpad : String
}
