// TODO:
// Lav file class og udskift
// Lav user class og udskift
import Foundation

//var loggedInUser:User

enum PostType{
    case retweet, comment, original
}

class Post {
    var likes: Int = 0
    var retweets: Int = 0
    var comments: Int = 0
    //var poster: User = loggedInUser
    var type: PostType
    var parent: Post?
    var mostRecentEventPost: Post?
    init(type: PostType){
        self.type = type
    }
}

class Text : Post{
    var text: String
    init(text: String, type: PostType){
        self.text = text
        super.init(type:type)
    }
}

class Photo : Post{
    var file: String
    init(file: String, type: PostType){
        self.file = file
        super.init(type: type)
    }
}

class TextPhoto : Post{
    var file: String
    var text: String
    init(text: String, file: String, type: PostType) {
        self.text = text
        self.file = file
        super.init(type: type)
    }
}

