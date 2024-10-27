//
//  randomGenerator.swift
//  Right on target
//
//  Created by Egor Panin on 16.10.2024.
//
protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class NumberGenerator: GeneratorProtocol {
    private let startRangeValue: Int
    private let endRangeValue: Int
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        startRangeValue = startValue
        endRangeValue = endValue
    }
    func getRandomValue() -> Int {
        (startRangeValue...endRangeValue).randomElement()!
    }
}
