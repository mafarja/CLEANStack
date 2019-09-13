//
//  Response.swift
//  FamHub
//
//  Created by Marcelo Farjalla on 9/9/19.
//  Copyright © 2019 StackRank, LLC. All rights reserved.
//

import Foundation

struct ChuckNorrisJoke: Decodable {
  let icon_url: URL
  let value: String
}
