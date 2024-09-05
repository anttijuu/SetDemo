//
//  main.swift
//  SetDemo
//
//  Created by Antti Juustila on 4.9.2024.
//

import Foundation

print("Hello, Set Demo!")

// Equal sets
let setOfStrings1 = Set<String>(arrayLiteral: "Omena", "Päärynä", "Banaani")
let setOfStrings2 = Set<String>(arrayLiteral: "Päärynä", "Banaani", "Omena")
let emptySet: Set<Int> = Set()

print("-- Basics, isEmpty and count:")
print("  This set \(setOfStrings1) has \(setOfStrings1.count) elements")
var emptyOrNot = setOfStrings1.isEmpty ? "yes" : "no"
print("  Is this set \(setOfStrings1) empty: \(emptyOrNot)")
print("  This set \(emptySet) has \(emptySet.count) elements")
emptyOrNot = emptySet.isEmpty ? "yes" : "no"
print("  Is this set \(emptySet) empty: \(emptyOrNot)")

print("-- How equals works with sets?")
print("-- Are these sets equal or not")
if (setOfStrings1 == setOfStrings2) { // Java: do setOfStrings1.equals(setOfStrings2) !!
	print("\(setOfStrings1) is equal to \(setOfStrings2)")
} else {
	print("\(setOfStrings1) is NOT equal to \(setOfStrings2)")
}

// Contains
print("-- See how contains works with set \(setOfStrings1):")
contains(set: setOfStrings1, value: "Mandariini")
contains(set: setOfStrings1, value: "Omena")

print("-- How to make sure we have an unique set of elements from duplicate values?")
let array: Array<Int> = Array(arrayLiteral: 1, 1, 2, 3, 3, 3, 4, 5, 5)
print("Array: \(array)")
let uniques: Set<Int> = Set(array)
print("Set: \(uniques)")

print("---Next: numbers in set, set operations -----------------------")

var setOfSmallInts: Set<Int> = Set(arrayLiteral: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
var setOfOdds: Set<Int> = Set(arrayLiteral: 1, 3, 5, 7, 9, 11)
var setOfEvens: Set<Int> = Set(arrayLiteral: 2, 4, 6, 8, 10)

print("Set of small numbers: \(setOfSmallInts)")
print("Set of odds         : \(setOfOdds)")
print("Set of evens        : \(setOfEvens)")

print("-- Is set of odds subset of set of evens?:")
isSubset(set1: setOfOdds, of: setOfEvens)
print("-- Is set of odds subset of set of small ints?:")
isSubset(set1: setOfOdds, of: setOfSmallInts)
print("-- Is set of small ints superset of set of evens?:")
isSuperSet(set1: setOfSmallInts, of: setOfEvens)

print("-- Union of evens and odds:")
print("\(setOfEvens.union(setOfOdds))")

print("-- Are even and odd sets disjoint?:")
areSetsDisjoint(set1: setOfEvens, set2: setOfOdds)

print("-- Union of small ints and evens:")
print("\(setOfEvens.union(setOfSmallInts))")

print("-- Substracing odds from small ints")
print("\(setOfSmallInts.subtracting(setOfOdds))")

print("-- Intersection of odds and evens:")
print("\(setOfOdds.intersection(setOfEvens))")

print("-- Intersection of small ints and evens:")
print("\(setOfSmallInts.intersection(setOfEvens))")

print("-- Adding an already existing element to set, first current content...:")
print("\(setOfEvens)")
let success = setOfEvens.insert(2).inserted ? "  Did the insert" : "  Did not do the insert"
print(success)
print("-- ...and contents after inserting:")
print("\(setOfEvens)")

let antti = Citizen(personID: "112233-123N", name: "Antti")
let tiina = Citizen(personID: "112233-123N", name: "Tiina")

print("----- Set with our own data type (struct, Java would use class) -----")
//print("Demonstrating Set with our own element type, Citizen:")
//var citizens = Set<Citizen>()
//citizens.insert(antti)
//citizens.insert(tiina)
//print("\(citizens)")

//print("-- Iterating through set:")
//for citizen in citizens {
//	print(citizen)
//}

// Empty sets
print("-- How about empty sets on left side")
isSubset(set1: emptySet, of: setOfSmallInts)
isSuperSet(set1: emptySet, of: setOfSmallInts)
areSetsDisjoint(set1: emptySet, set2: setOfSmallInts)
print("-- How about empty sets on right side")
isSubset(set1: setOfSmallInts, of: emptySet)
isSuperSet(set1: setOfSmallInts, of: emptySet)
areSetsDisjoint(set1: setOfSmallInts, set2: emptySet)

/// Helper functions
///
func contains<T>(set: Set<T>, value: T) {
	if set.contains(value) {
		print("  Set contains \(value)")
	} else {
		print("  Set does NOT contain \(value)")
	}
}

func isSubset<T>(set1: Set<T>, of set2: Set<T>) {
	if set1.isSubset(of: set2) {
		print("  set1 _is_ subset of set2")
	} else {
		print("  set1 _is not_ subset of set2")
	}
}

func isSuperSet<T>(set1: Set<T>, of set2: Set<T>) {
	if set1.isSuperset(of: set2) {
		print("  set1 _is_ superset of set2")
	} else {
		print("  set1 _is not_ superset of set2")
	}
}

func areSetsDisjoint<T>(set1: Set<T>, set2: Set<T>) {
	if set1.isDisjoint(with: set2) {
		print("  Sets are disjoint")
	} else {
		print("  Sets have common elements")
	}
}

