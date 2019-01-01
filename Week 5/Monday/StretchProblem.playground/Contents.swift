import Foundation

protocol Searchable {
    func matches(SearchTerm: String) -> Bool
}

class Restaurant: Searchable {
    func matches(SearchTerm: String) -> Bool {
        for review in reviews {
            if review.matches(SearchTerm: SearchTerm) {
                return true
            }
        }
        return name.contains(SearchTerm) || streetAddress.contains(SearchTerm) || city.contains(SearchTerm)
    }
    
    let name: String
    let streetAddress: String
    let city: String
    let state: String
    let reviews: [Review]
    
    var hashTags: [String] {
        return reviews.compactMap { $0.text.components(separatedBy: " ").filter({ $0.hasPrefix("#")}).joined() }
    }
    
    init(name: String, streetAddress: String, city: String, state: String, reviews: [Review]) {
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.reviews = reviews
    }
}

class Review: Searchable {
    func matches(SearchTerm: String) -> Bool {
        if text.contains(SearchTerm) || username.contains(SearchTerm) {
            return true
        }
        return false
    }
    
    let username: String
    let text: String
    
    init(username: String, text: String) {
        self.username = username
        self.text = text
    }
}

var reviews: [Review] {
    let review1 = Review(username: "Julie D", text: "After visiting Sicilia Mia & Dolce Sicilia, we were very excited to visit Antica Silicia! This is by far our favorite of their restaurants as it is a lot more quaint than the other ones and is really romantic. ")
    let review2 = Review(username: "Mark L", text:
    "If you were to tell me I could have a romantic dinner with authentic Italian food in my very own neighborhood, I would struggle to find you credible.  However, I have seen the reality. Antica Sicilia seems to be one of the most yelped spots over the last while. For my loving wife's momentous birthday, I made us reservations. The hype and ratings of yelp are all true - this place is delightful.")
    let review3 = Review(username: "Jim B", text: "It was real good! Came here as it was 2 dollar signs and had a decent rating. It did not disappoint. #EatHere")
    return [review1, review2, review3]
}

print(reviews[0].text)


