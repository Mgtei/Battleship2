//
//  MontyEngine.swift
//  Monty
//
//  Created by Jason Gresh on 9/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation


class MontyBrain {
    let numCards: Int
    
    init(numCards:Int){
        self.numCards = numCards
        setupCards()
    }
    
    fileprivate enum State{
        case hit
        case miss
    }
    
    private var cards = [State]()
    func setupCards(){
        cards = Array(repeating: .miss, count: numCards)
        //this makes one card a Hit
        cards[Int(arc4random_uniform(UInt32(numCards)))] = .hit
        
    }
    //this checks the card to see if it is Hit
    func checkCard(_ cardIn: Int) -> Bool{
        assert(cardIn < cards.count)  //helps with debugging
        return cards[cardIn] == .hit
        //TODO: randomly assign the hit squares on the grid:
        //Call arc4random UInt32 #ofHittableInts times
        //Make sure first random number called is between 0 and 10
        //set random number to row (x)
        //call second random number between 0 and 10
        //set that random number to column (y)
        //make square at R#1, R#2 a hit
        //check if that square is miss
        //if miss, assign numbers to new value for hit, row/column
        //if already hit, don't use and
        //run loop again for new numbers
        //until number of hittable elements equals desired number of squares to be hit
        //repeat 16 times
        
        
    //let squaresHit: Int
    //let randomRow: Int
    //let randomColumn: Int
    //var hitArray: [(Int)] <-Should be Array of tuples? Or array of arrays?
        //need to make call random row/column a function so it can be called multiple times
    //randomRow = [Int(arc4random_uniform(UInt32(10)))] <- does this make upper bound 10? (lower bound 0)
    //randomColumn = [Int(arc4random_uniform(UInt32(10)))]
    //func makeRandomRow(){
        //randomRow = [Int(arc4random_uniform(UInt32(10)))]
        //}
    //func makeRandomColumn(){
        //randomColumn = [Int(arc4random_uniform(UInt32(10)))]
    //need function that combines randomRow,randomColumn into tuples or array or card
        //need to find a way to check that cards made up of randomRow, randomColumn aren't already hit
        //return randomRow,randomColumn cards that are feasible in an... array? of hit cards
        //for loop that appends pairs of random numbers (tuples) in array?
    //func makeHitArray (randomRow: Int, randomColumn: Int) -> hitArray: [(Int, Int)]
        //
        
    //need to write a for loop that runs squaresHit times
    //this should probably be a function, too.
    //should it take in or return an array?
        //take in array cards?
        //func makeHits() {
        //for card in cards
        
       

    }
}
