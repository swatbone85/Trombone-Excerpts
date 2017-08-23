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
    let pieces: [String]
    
}

// TENOR TROMBONE
let excerptArray: [Excerpt] = [Excerpt.init(composer: "Beethoven",
                                            pieces: ["Fidelio Overture",
                                                     "Symphony no. 5",
                                                     "Symphony no. 9"]),
                               Excerpt.init(composer: "Berlioz",
                                            pieces: ["Hungarian March",
                                                     "Roman Carnival Overture",
                                                     "Symphonie Fantastique"]),
                               Excerpt.init(composer: "Brahms",
                                            pieces: ["Symphony no. 1",
                                                     "Symphony no. 2",
                                                     "Symphony no. 3",
                                                     "Symphony no. 4"]),
                               Excerpt.init(composer: "Mahler",
                                            pieces: ["Symphony no. 3",
                                                     "Symphony no. 5"]),
                               Excerpt.init(composer: "Mozart",
                                            pieces: ["Requiem"]),
                               /*Excerpt.init(composer: "Ravel",
                                            pieces: ["Bolero"]),*/
                               Excerpt.init(composer: "Rossini",
                                            pieces: ["La Gazza Ladra",
                                                     "William Tell Overture"]),
                               Excerpt.init(composer: "Saint-Saens",
                                            pieces: ["Symphony no. 3 Organ"]),
                               Excerpt.init(composer: "Schumann",
                                            pieces: ["Symphony no. 3 Rhenish"]),
                               Excerpt.init(composer: "Wagner",
                                            pieces: ["Lohengrin act 3",
                                                     "Ride of the Valkyries",
                                                     "Tannhauser Overture"])]

//BASS TROMBONE
let bassTromboneArray: [Excerpt] = [Excerpt.init(composer: "Beethoven",
                                                 pieces: ["Symphony no. 9"]),
                                    Excerpt.init(composer: "Berlioz",
                                                 pieces: ["Hungarian March"]),
                                    Excerpt.init(composer: "Bruckner",
                                                 pieces: ["Symphony no. 7"]),
                                    Excerpt.init(composer: "Franck",
                                                 pieces: ["Symphony in D minor"]),
                                    Excerpt.init(composer: "Haydn",
                                                 pieces: ["The Creation"]),
                                    Excerpt.init(composer: "Mozart",
                                                 pieces: ["Requiem"]),
                                    Excerpt.init(composer: "Respighi",
                                                 pieces: ["Fountains of Rome"]),
                                    Excerpt.init(composer: "Rossini",
                                                 pieces: ["La Gazza Ladra",
                                                          "William Tell Overture"]),
                                    Excerpt.init(composer: "Schumann",
                                                 pieces: ["Symphony no. 3 Rhenish"]),
                                    Excerpt.init(composer: "Wagner",
                                                 pieces: ["Das Rheingold",
                                                          "Lohengrin",
                                                          "Ride of the Valkyries",
                                                          "Tannhauser Overture"])]








