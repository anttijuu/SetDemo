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

print("\n-- Basics, isEmpty and count:")
print("  This set \(setOfStrings1) has \(setOfStrings1.count) elements")
// Prints: This set ["Päärynä", "Omena", "Banaani"] has 3 elements

var emptyOrNot = setOfStrings1.isEmpty ? "yes" : "no"
print("  Is this set \(setOfStrings1) empty: \(emptyOrNot)")
// Prints: Is this set ["Päärynä", "Omena", "Banaani"] empty: no

print("  This set \(emptySet) has \(emptySet.count) elements")
// Prints: This set [] has 0 elements

emptyOrNot = emptySet.isEmpty ? "yes" : "no"
print("  Is this set \(emptySet) empty: \(emptyOrNot)")
// Prints: Is this set [] empty: yes

print("\n-- How equals works with sets?")
print("-- Are these sets equal or not")
if (setOfStrings1 == setOfStrings2) {
	print("\(setOfStrings1) is equal to \(setOfStrings2)")
} else {
	print("\(setOfStrings1) is NOT equal to \(setOfStrings2)")
}
// Prints: ["Päärynä", "Omena", "Banaani"] is equal to ["Päärynä", "Omena", "Banaani"]
//  - Note that the order printed out is the same though elements were added in different order.

// In Java, the if above must be implemented using equals:
// if (setOfStrings1.equals(setOfStrings2)) { ...

// Contains; see contains() function below under Helper functions
print("\n-- See how contains works with set \(setOfStrings1):")
contains(set: setOfStrings1, value: "Mandariini")
// Prints: Set does NOT contain Mandariini

contains(set: setOfStrings1, value: "Omena")
// Prints: Set contains Omena

print("\n-- How to make sure we have an unique set of elements from duplicate values?")
print("   Start from an array with duplicate elements...:")
let array: Array<Int> = Array(arrayLiteral: 1, 1, 2, 3, 3, 3, 4, 5, 5)
print("Array: \(array)")
// Prints: Array: [1, 1, 2, 3, 3, 3, 4, 5, 5]

print("   Then put the elements from the array to the set and see duplicates not there:")
let uniques: Set<Int> = Set(array)
print("Set: \(uniques)")
// Prints: Set: [2, 3, 1, 4, 5]
//  - note how the order in set is different from array's, set has no order

print("\n---Next: numbers in set, set operations -----------------------")

var setOfSmallInts: Set<Int> = Set(arrayLiteral: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
var setOfOdds: Set<Int> = Set(arrayLiteral: 11, 3, 5, 7, 9, 1)
var setOfEvens: Set<Int> = Set(arrayLiteral: 2, 4, 6, 8, 10)

print("Set of small numbers: \(setOfSmallInts)")
print("Set of odds         : \(setOfOdds)")
print("Set of evens        : \(setOfEvens)")
// Lines above prints:
// Set of small numbers: [10, 7, 15, 12, 8, 11, 13, 6, 1, 3, 4, 9, 5, 2, 14]
// Set of odds         : [5, 1, 11, 9, 7, 3]
// Set of evens        : [8, 2, 6, 10, 4]
//  - note again that the order is different than in adding elements from array literals

// You can find the Helper functions isSubset, isSuperSet and
// areSetsDisjoint from below.

print("\n-- Is set of odds subset of set of evens?:")
isSubset(set1: setOfOdds, of: setOfEvens)
// Prints: set1 _is not_ subset of set2

print("-- Is set of odds subset of set of small ints?:")
isSubset(set1: setOfOdds, of: setOfSmallInts)
// Prints: set1 _is_ subset of set2

print("-- Is set of small ints superset of set of evens?:")
isSuperSet(set1: setOfSmallInts, of: setOfEvens)
// Prints: set1 _is_ superset of set2

print("-- Union of evens and odds:")
print("\(setOfEvens.union(setOfOdds))")
// Prints: [10, 3, 8, 6, 11, 2, 9, 4, 5, 1, 7]

print("-- Are even and odd sets disjoint?:")
areSetsDisjoint(set1: setOfEvens, set2: setOfOdds)
// Prints: Sets are disjoint

print("-- Union of small ints and evens:")
print("\(setOfEvens.union(setOfSmallInts))")
// Prints: [13, 7, 9, 11, 12, 4, 1, 3, 2, 8, 6, 5, 10, 14, 15]

print("-- Substracing odds from small ints")
print("\(setOfSmallInts.subtracting(setOfOdds))")
// Prints: [10, 13, 14, 8, 6, 12, 15, 2, 4]

print("-- Intersection of odds and evens:")
print("\(setOfOdds.intersection(setOfEvens))")
// Prints: []

print("-- Intersection of small ints and evens:")
print("\(setOfSmallInts.intersection(setOfEvens))")
// Prints: [10, 8, 6, 4, 2]

print("\n-- Adding an already existing element to set, first current content...:")
print("\(setOfEvens)")
var success = setOfEvens.insert(2).inserted ? "  Did the insert" : "  Did not do the insert"
print(success)
print("-- ...and contents after inserting:")
print("\(setOfEvens)")
// For the above lines, prints:
// [8, 2, 6, 10, 4]
//   Did not do the insert
// -- ...and contents after inserting:
// [8, 2, 6, 10, 4]

print("\n-- Adding a new element to set, first current content...:")
print("\(setOfEvens)")
success = setOfEvens.insert(12).inserted ? "  Did the insert" : "  Did not do the insert"
print(success)
print("-- ...and contents after inserting:")
print("\(setOfEvens)")
// For the above lines, prints:
// [8, 2, 6, 10, 4]
//   Did the insert
// -- ...and contents after inserting:
// [8, 12, 2, 6, 10, 4]

// TODO: Try giving citizens same id when Equatable is commented out...
let antti = Citizen(personID: "112233-123N", name: "Antti")
let tiina = Citizen(personID: "221133-123N", name: "Tiina")

print("\n----- Set with our own Citizen data type (a struct, Java would use class) -----")
print("Demonstrating Set with our own element type, Citizen:")
var citizens = Set<Citizen>()
citizens.insert(antti)
citizens.insert(tiina)
// Try adding antti again, see if it is included:
let (inserted, _) = citizens.insert(antti)
if (inserted) {
	print(" - antti was surprisingly added again to the Set")
} else {
	print(" - as expected, antti was already in the Set and not added again")
}
print("\(citizens)")
// Lines above print:
// Demonstrating Set with our own element type, Citizen:
// - as expected, antti was already in the Set and not added again
// [221133-123N Tiina, 112233-123N Antti]

print("-- Iterating through set:")
for citizen in citizens {
	print(citizen)
}
// Lines above print:
// -- Iterating through set:
// 221133-123N Tiina
// 112233-123N Antti

// Special case: empty sets

print("\n-- How about empty sets on left side")
isSubset(set1: emptySet, of: setOfSmallInts)
isSuperSet(set1: emptySet, of: setOfSmallInts)
areSetsDisjoint(set1: emptySet, set2: setOfSmallInts)
// For the above lines, prints:
// set1 _is_ subset of set2
// set1 _is not_ superset of set2
// Sets are disjoint

print("\n-- How about empty sets on right side")
isSubset(set1: setOfSmallInts, of: emptySet)
isSuperSet(set1: setOfSmallInts, of: emptySet)
areSetsDisjoint(set1: setOfSmallInts, set2: emptySet)
// For the above lines, prints:
// set1 _is not_ subset of set2
// set1 _is_ superset of set2
// Sets are disjoint

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

