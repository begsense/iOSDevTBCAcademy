import Foundation

func evaluate(good: String, vsEvil evil: String) -> String {
    let goodWorth = [1, 2, 3, 3, 4, 10]
    let evilWorth = [1, 2, 2, 2, 3, 5, 10]
    
    let goodCounts = good.split(separator: " ").compactMap { Int($0) }
    let evilCounts = evil.split(separator: " ").compactMap { Int($0) }
  
  print (goodCounts)
  print (evilCounts)
    
    let goodTotal = zip(goodCounts, goodWorth).map(*).reduce(0, +)
    let evilTotal = zip(evilCounts, evilWorth).map(*).reduce(0, +)
    
    if goodTotal > evilTotal {
        return "Battle Result: Good triumphs over Evil"
    } else if evilTotal > goodTotal {
        return "Battle Result: Evil eradicates all trace of Good"
    } else {
        return "Battle Result: No victor on this battle field"
    }
}
