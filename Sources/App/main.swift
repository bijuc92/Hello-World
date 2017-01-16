import Vapor

let drop = Droplet()

/*
drop.get ("/"){request in
    
    return "Hello World, This is my first swift web application"
    
}
 */

drop.get("/name", ":name"){ request in
    if let name = request.parameters["name"]?.string{
        return "Hello \(name)!"
    }
    return "Error retrieving parameters."
}
//
//drop.get("/age", ":age"){ request in
//    if let age = request.parameters["age"]?.string{
//        return "Hello \(age)!"
//    }
//    return "Error retrieving parameters."
//}

drop.get("/view") { request in
    return try drop.view.make("view.html")
}

//drop.get("/view") { request in
//    return try drop.view("view.html")
//}

drop.run()

//drop.get { req in
//    return try drop.view.make("welcome", [
//    	"message": drop.localization[req.lang, "welcome", "title"]
//    ])
//}
//
//drop.resource("posts", PostController())
//
//drop.run()
