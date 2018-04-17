import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
        
        get("beers", Int.parameter) {req in
            let beers = try req.parameters.next(Int.self)
            return "I'll take one so you can have \(beers - 1) bottles for yourself!"
        }

    }
}
