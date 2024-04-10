//
//  Model.swift
//  ClassWork15_BegiK
//
//  Created by M1 on 10.04.2024.
//

import UIKit

struct Zodiac {
    var name: String?
    var description: String?
    var icon: UIImageView?
    var polarSign: String?
}

var aries = Zodiac(name: "Aries", description: "Aries (♈︎) (Greek: Κριός, romanized: Kriós, Latin: Ariēs, lit. 'ram') is the first astrological sign in the zodiac, spanning the first 30 degrees of celestial longitude (0°≤ λ <30°), and originates from the Aries constellation. Under the tropical zodiac, the Sun transits this sign from approximately March 21 to April 19 each year. This time-duration is exactly the first month of the Solar Hijri calendar (Arabic Hamal/Persian Farvardin/Pashto Wray).", icon: UIImageView(image: UIImage(named: "aries")), polarSign: "Libra")

var taurus = Zodiac(name: "Taurus", description: "Taurus (♉︎) (Ancient Greek: Ταῦρος, romanized: Taûros, Latin for bull) is the second astrological sign in the modern zodiac. It spans from 30° to 60° of the zodiac. This sign belongs to the Earth element or triplicity, as well as a fixed modality, quality, or quadruplicity. It is a Venus-ruled sign, the Moon is in its exaltation here at exactly 3°. The Sun transits this sign from approximately April 20 until May 20 in western astrology. Taurus is one of the three earth signs, alongside Capricorn and Virgo. Taurus's opposite sign is Scorpio.", icon: UIImageView(image: UIImage(named: "taurus")), polarSign: "Scorpio")

var gemini = Zodiac(name: "Gemini", description: "Gemini (♊︎) (/ˈdʒɛmɪnaɪ/ JEM-in-eye Greek: Δίδυμοι, romanized: Dídymoi, Latin for twins) is the third astrological sign in the zodiac. Under the tropical zodiac, the sun transits this sign between about May 21 to June 21. Gemini is represented by the twins, Castor and Pollux, known as the Dioscuri in Greek mythology. It is known as a positive, mutable sign.", icon: UIImageView(image: UIImage(named: "gemini")), polarSign: "Sagittarius")

var cancer = Zodiac(name: "Cancer", description: "Cancer (♋︎) (Greek: Καρκίνος, romanized: Karkínos, Latin for the Crab) is the fourth astrological sign in the zodiac, originating from the constellation of Cancer. It spans from 90° to 120° celestial longitude. Under the tropical zodiac, the Sun transits this area between approximately June 22 and July 22.", icon: UIImageView(image: UIImage(named: "cancer")), polarSign: "Capricorn")

var leo = Zodiac(name: "Leo", description: "Leo (♌︎) (Ancient Greek: Λέων, romanized: Léōn, Latin for lion) is the fifth sign of the zodiac. It corresponds to the constellation Leo and comes after Cancer and before Virgo. The traditional Western zodiac associates Leo with the period between about July 23 and August 22", icon: UIImageView(image: UIImage(named: "leo")), polarSign: "Aquarius")

var virgo = Zodiac(name: "Virgo", description: "Virgo (♍︎) (Ancient Greek: Παρθένος, romanized: Parthénos) (Latin for virgin or maiden) is the sixth astrological sign in the zodiac. It spans the 150–180th degree of the zodiac. Under the tropical zodiac, the Sun transits this area (on average) between August 23 and September 22. Depending on the system of astrology, individuals born during these dates may be called Virgos or Virgoans.", icon: UIImageView(image: UIImage(named: "virgo")), polarSign: "Pisces")

var libra = Zodiac(name: "Libra", description: "Libra (♎︎) (Ancient Greek: Ζυγός, romanized: Zygós, Latin for scales) is the seventh astrological sign in the zodiac. It spans 180°–210° celestial longitude. The Sun transits this sign on average between September 23 and October 23. The symbol of the scales is based on the Scales of Justice held by Themis, the Greek personification of divine law and custom", icon: UIImageView(image: UIImage(named: "libra")), polarSign: "Aries")

var scorpio = Zodiac(name: "Scorpio", description: "Scorpio (♏︎) (Ancient Greek: Σκορπιός, romanized: Skorpiós, Latin for scorpion) is the eighth astrological sign in the zodiac, originating from the constellation of Scorpius. It spans 210–240° ecliptic longitude. Under the tropical zodiac (most commonly used in Western astrology), the Sun transits this sign on average from October 23 to November 21.", icon: UIImageView(image: UIImage(named: "scorpio")), polarSign: "Taurus")

var sagittarius = Zodiac(name: "Sagittarius", description: "Sagittarius (♐︎) (Greek: Τοξότης, romanized: Toxótēs, Latin for archer) is the ninth astrological sign, which is associated with the constellation Sagittarius and spans 240–270th degrees of the zodiac. Under the tropical zodiac, the sun transits this sign between approximately November 22 and December 21.", icon: UIImageView(image: UIImage(named: "sagittarius")), polarSign: "Gemini")

var capricorn = Zodiac(name: "Capricorn", description: "Capricorn (♑︎) (Greek: Αιγόκερως, romanized: Aigókerōs, Latin for horned goats) is the tenth astrological sign in the zodiac out of twelve total zodiac signs, originating from the constellation of Capricornus, the goat. It spans the 270–300th degree of the zodiac, corresponding to celestial longitude.", icon: UIImageView(image: UIImage(named: "capricorn")), polarSign: "Cancer")

var aquarius = Zodiac(name: "Aquarius", description: "Aquarius (♒︎) (Greek: Ὑδροχόος, romanized: Hydrokhóos, Latin for water-bearer) is the eleventh astrological sign in the zodiac, originating from the constellation Aquarius. Under the tropical zodiac, the Sun is in the Aquarius sign between about January 20 and February 18.", icon: UIImageView(image: UIImage(named: "aquarius")), polarSign: "Leo")

var pisces = Zodiac(name: "Pisces", description: "Pisces (♓︎) (/ˈpaɪsiːz/; Ancient Greek: Ἰχθύες Ikhthyes, Latin for fishes) is the twelfth and final astrological sign in the zodiac. It is a negative, mutable sign. It spans 330° to 360° of celestial longitude. Under the tropical zodiac, the sun transits this area between February 19 and March 20.", icon: UIImageView(image: UIImage(named: "pisces")), polarSign: "Virgo")
