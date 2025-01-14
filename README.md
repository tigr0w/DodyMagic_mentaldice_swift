# MentalDice-Swift

## Installation

### SPM (Swift Package Manager) setup

1. From your Xcode project, tap on `File > Add Package Dependencies...`

1. Paste this URL into the search text field: `https://github.com/digital-magic-club/mentaldice-swift.git`

1. Add package

### Pod setup

1. Add `source 'https://github.com/digital-magic-club/mentaldice-swift.git'` on top of your Podfile

1. Add `pod 'MentalDice-Swift'` into your Podfile targets

1. Run `pod install`

## Usage

1. Add the `NSBluetoothAlwaysUsageDescription` key to your `Info.plist` if it is not already there.

1. Add `import MentalDice` to the file which is meant to receive the dice's values.

1. Set yourself as delegate: `MentalDice.shared.delegate = self`

1. Connect to the Mental Dice: `MentalDice.shared.connect()`

1. Listen to the delegate protocol:
```
extension YourClass: MentalDiceDelegate {
    func didUpdate(dice: [Die]) {
        // ...
    }

    func didDetect(color: Die.Color) {
        // ...
    }

    func didConnect() {
        // ...
    }

    func didDisconnect() {
        // ...
    }
}
```

Optional: Remove the potential extra `MentalDice.` prefixes from the generated protocol functions (`func didUpdate(dice: [Die])` instead of `func didUpdate(dice: [MentalDice.Die])` for example).

## Credits

This project is owned and maintained by the Digital Magic Club. You can join the [Facebook group](https://www.facebook.com/groups/digitalmagicclub) for project updates and releases.

## Sponsorship

The [DMC](https://github.com/sponsors/digital-magic-club) is looking to raise money to officially stay registered as a federal non-profit organization.

Sponsoring the DMC will enable us to:
- Pay our yearly legal fees to keep the non-profit in good status,
- Keep adding more open-source features at a faster pace,
- Potentially fund test servers to make it easier for us to test the edge cases,
- Potentially fund developers to work on one of our projects full-time.

The magic community adoption of the DMC libraries has been amazing!

We are greatly humbled by your enthusiasm around the projects and want to continue to do everything we can to move the needle forward. With your continued support, the DMC will be able to improve its reach and also provide better legal safety for the core members.

Any amount you can donate, whether once or monthly, to help us reach our goal would be greatly appreciated.
