//
//  MentalDice.swift
//  MentalDiceFramework
//
//  Created by Guillaume Bellut on 19/07/2020.
//  Copyright © 2020 Tulleb's Corp. All rights reserved.
//

import Foundation

public protocol MentalDiceDelegate: AnyObject {
    func didConnect()
    func didDisconnect()
    func didUpdate(dice: [Die])
    func didDetect(color: Die.Color)
}

@MainActor
public class MentalDiceManager: NSObject {

    public static let shared = MentalDiceManager()

    public weak var delegate: MentalDiceDelegate?
    public var dice = [Die(color: .white),
                       Die(color: .black),
                       Die(color: .red)]

    private let reachability = DiceReachability.shared

    private override init() {
        super.init()
        reachability.delegate = self
    }

    public func connect() {
        reachability.shouldScan = true
    }

    public func disconnect() {
        reachability.shouldScan = false
    }

}

extension MentalDiceManager: @preconcurrency DiceReachabilityDelegate {

    func didConnect() {
        delegate?.didConnect()
    }

    func didDisconnect() {
        delegate?.didDisconnect()
    }

    func didReceiveMessage(_ message: CharacteristicMessage) {
        switch message.type {
        case .read(.dices):
            for index in dice.indices {
                dice[index].update(from: message.body)
            }

            delegate?.didUpdate(dice: dice)

        case .read(.magnet):
            guard let color = Die.Color.allCases.first(where: { message.body.contains($0.rawValue) }) else {
                return
            }

            delegate?.didDetect(color: color)

        default:
            break
        }
    }

}
