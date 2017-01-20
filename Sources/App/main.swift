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

drop.get("/second") { request in
   return try drop.view.make("second.html")
}

drop.get { request in
    return try JSON(node: [
        "message": "World"
        ])
}

drop.get("hello") { request in
    return try JSON(node: [
        "message": "Hello World "
        ])
}


drop.get("hello", "there") { request in
    return try JSON(node: [
        "message": "Hello World there"
        ])
}

drop.get("beers", Int.self){ request, beers in
    return try JSON(node: [
        "message": "Take one down, pass it around \(beers-1) bottles of beer on the wall.."
        ])
    
}

drop.post("post") { request in
    guard let name = request.data["username"]?.string else{
        throw Abort.badRequest
    }
    
    guard let pwd = request.data["password"]?.string else{
        throw Abort.badRequest
    }
    
    guard pwd == "123456" else{
        return try JSON(node: [
            "message": "Inavalid password",
            "status": "Failed"])
    }
    
    return try JSON(node: [
         "message": "Hello, \(name)",
        "status": "Success",
        "data": JSON(node: ["A":"1", "B":"2", "C":"3"])
        ])
    
}


drop.get("/events") { _ in
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
