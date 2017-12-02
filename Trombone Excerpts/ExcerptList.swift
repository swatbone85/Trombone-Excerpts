//
//  ExcerptList.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import Foundation

struct Excerpt {
    
    let composer: String
    let firstName: String
    let pieces: [String]
    
}

// TENOR TROMBONE
let excerptArray: [Excerpt] = [Excerpt.init(composer: "Beethoven",
                                            firstName: "Ludwig van",
                                            pieces: ["Fidelio Overture",
                                                     "Symphony no. 5",
                                                     "Symphony no. 9"]),
                               Excerpt.init(composer: "Berlioz",
                                            firstName: "Hector",
                                            pieces: ["Hungarian March",
                                                     "Roman Carnival Overture",
                                                     "Symphonie Fantastique"]),
                               Excerpt.init(composer: "Brahms",
                                            firstName: "Johannes",
                                            pieces: ["Academic Festival Overture",
                                                     "Symphony no. 1",
                                                     "Symphony no. 2",
                                                     "Symphony no. 3",
                                                     "Symphony no. 4"]),
                               Excerpt.init(composer: "Mahler",
                                            firstName: "Gustav",
                                            pieces: ["Symphony no. 3",
                                                     "Symphony no. 5"]),
                               Excerpt.init(composer: "Mozart",
                                            firstName: "Wolfgang Amadeus",
                                            pieces: ["Requiem"]),
                               Excerpt.init(composer: "Ravel",
                                            firstName: "Maurice",
                                            pieces: ["Bolero"]),
                               Excerpt.init(composer: "Rossini",
                                            firstName: "Gioachino",
                                            pieces: ["La Gazza Ladra",
                                                     "William Tell Overture"]),
                               Excerpt.init(composer: "Saint-Saens",
                                            firstName: "Camille",
                                            pieces: ["Symphony no. 3 Organ"]),
                               Excerpt.init(composer: "Schumann",
                                            firstName: "Robert",
                                            pieces: ["Symphony no. 3 Rhenish"]),
                               Excerpt.init(composer: "Wagner",
                                            firstName: "Richard",
                                            pieces: ["Lohengrin act 3",
                                                     "Ride of the Valkyries",
                                                     "Tannhauser Overture"])]

//BASS TROMBONE
let bassTromboneArray: [Excerpt] = [Excerpt.init(composer: "Beethoven",
                                                 firstName: "Ludwig van",
                                                 pieces: ["Symphony no. 9"]),
                                    Excerpt.init(composer: "Berlioz",
                                                 firstName: "Hector",
                                                 pieces: ["Hungarian March"]),
                                    Excerpt.init(composer: "Bruckner",
                                                 firstName: "Anton",
                                                 pieces: ["Symphony no. 7"]),
                                    Excerpt.init(composer: "Franck",
                                                 firstName: "César",
                                                 pieces: ["Symphony in D minor"]),
                                    Excerpt.init(composer: "Haydn",
                                                 firstName: "Joseph",
                                                 pieces: ["The Creation"]),
                                    Excerpt.init(composer: "Mozart",
                                                 firstName: "Wolfgang Amadeus",
                                                 pieces: ["Requiem"]),
                                    Excerpt.init(composer: "Respighi",
                                                 firstName: "Ottorino",
                                                 pieces: ["Fountains of Rome"]),
                                    Excerpt.init(composer: "Rossini",
                                                 firstName: "Gioachino",
                                                 pieces: ["La Gazza Ladra",
                                                          "William Tell Overture"]),
                                    Excerpt.init(composer: "Schumann",
                                                 firstName: "Robert",
                                                 pieces: ["Symphony no. 3 Rhenish"]),
                                    Excerpt.init(composer: "Wagner",
                                                 firstName: "Richard",
                                                 pieces: ["Das Rheingold",
                                                          "Lohengrin",
                                                          "Ride of the Valkyries",
                                                          "Tannhauser Overture"])]

//VIDEOS

let videoArray: [String] = ["B3wRYURYbwo", "B3wRYURYbwo", "B3wRYURYbwo"]







