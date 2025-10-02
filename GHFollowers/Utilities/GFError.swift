//
//  GFError.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 23/09/25.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This is an invalid username. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again later."
    case invalidData = "Invalid data received from the server."
    case unableToFavorite = "Unable to favorite this user."
    case alreadyInFavorites = "This user is already in your favorites."
}
