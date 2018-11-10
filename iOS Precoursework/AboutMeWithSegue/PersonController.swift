//
//  PersonController.swift
//  AboutMeWithSegue
//
//  Created by Thomas Cowern New on 11/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import UIKit

class PersonController {
    
    static let shared = PersonController()


let people: [Person] = {
    
    let theDoctor = Person(name: "Dr. Dre", title: "Beats Physician", age: 53, profilePicture: UIImage(named: "dre")!, bio: "Gangsta rap pioneer Dr. Dre was born on February 18, 1965. A music fan from the start, Dre started working as a DJ in his teens. His first major success came with the rap group N.W.A. and he later co-founded Death Row Records in 1991. In 1992, his first solo album, The Chronic, became a huge hit. Dre started up Aftermath Entertainment in 1996 and signed Eminem and 50 Cent to his label. He eventually co-founded the company Beats Electronics with Jimmy Iovine, going on to make millions from its 2014 sale to Apple.")
    
    let cube = Person(name: "Ice Cube", title: "Bad Actor", age: 49, profilePicture: UIImage(named: "ice")!, bio: "Actor and rapper Ice Cube was born in South Central Los Angeles in 1969. With fellow rappers Dr. Dre, Eazy-E, DJ Yella and MC Ren, he rocketed to fame in the late 1980s as a member of the hard-hitting gangsta rap group, N.W.A. After breaking off on his own in '89, Cube has put together a successful recording and acting career, having appeared in the films Friday (1995), Barbershop (2002) and 21 Jump Street (2012).")
    
    let andre = Person(name: "André 3000", title: "André from OutCast", age: 43, profilePicture: UIImage(named: "3000")!, bio: "Born in 1975 in Atlanta, Georgia, André 3000 began performing in his teens with a friend as 2 Shades Deep. The pair got a record deal and changed their name to OutKast. Their first single, 1993's Players' Ball, was a Christmas song, and it stayed at No. 1 on the rap charts for six weeks. By the end of the decade, OutKast was a known quantity, and their single Hey Ya! cemented the group's reputation. The song went on to be named one of Rolling Stone's top 500 songs of all time, and OutKast collected six Grammy Awards along the way. Soon after, Andre 3000 began acting, appearing in several movies and on television, while also writing music for both. His latest effort is portraying Jimi Hendrix in the 2013 biopic All Is by My Side.")
    
    let lamar = Person(name: "Kendric Lamar", title: "Kung Fu Kitty", age: 37, profilePicture: UIImage(named: "kendric")!, bio: "Kendrick Lamar Duckworth, who performs as Kendrick Lamar, was born in Compton, California, on June 17, 1987. After writing stories as a child, he put to music some lyrics about the rough Compton streets he grew up on. He rapped under the name K-Dot, releasing a series of increasingly popular mix tapes, which brought him to the attention of hip-hop super-producer Dr. Dre. Lamar's debut major-label recording, good kid, m.A.A.d City, was released to great acclaim and impressive sales for an up-and-coming recording artist. He continued to receive accolades for his 2015 album, To Pimp a Butterfly, and his 2017 follow-up, DAMN.; both won Grammys for Best Rap Album, while DAMN. also made history as the first of its genre to earn a Pulitzer Prize.")
    
    let west = Person(name: "Kanye West", title: "Philanthropist", age: 45, profilePicture: UIImage(named: "KanyeProfilePic")!, bio: "As Kanye West would doubtless tell you himself, he is a 21st-century phenomenon — a producer turned rap superstar who has reinvented hip hop several times over in the course of a stellar career; but whose creative genius is sometimes eclipsed by his talent for putting his entire foot in his own mouth. He has made headlines for his bizarre tweets and his grand pronouncements, his award-show stage invasions, his outré fashion sense and his flashbulb-popping marriage to Kim Kardashian. But when West channels his hubristic impulses into his music, the results have rarely been less than thrilling: hence eight solo albums debuting at No. 1 and 21 Grammy awards — no rapper has won more; two inclusions in Time magazine's 100 most influential people list; and plaudits from Lou Reed, Prince, Elon Musk — and, most frequently of all, from West himself. I am a god, he rapped in 2013, following up with a line that perhaps only he could deliver with a straight face: Hurry up with my damn croissants.")
    
    return [theDoctor, cube, andre, lamar, west]
    
}()
}
