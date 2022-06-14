//
//  ThemeManager.swift
//  FlexiCalc
//
//  Created by waheedCodes on 31/05/2022.
//

import Foundation

class ThemeManager {

    // MARK: - Singleton

    static let shared = ThemeManager()

    // MARK: - Data Storage

    private let key = "com.waheedcodes.FlexiCalc.ThemeManager.ThemeIndex"
    private lazy var dataStore = DataStorageManager(key: key)

    // MARK: - Themes

    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    private var savedThemeIndex = 0
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }

        return savedTheme
    }

    // MARK: - Lifecycle

    init() {
        populateArrayOfThemes()
        restoreSavedTheme()
    }

    private func populateArrayOfThemes() {
        themes = [
            darkTheme,
            bloodOrangeTheme,
            darkBlueTheme,
            electroTheme,
            lightBlueTheme,
            lightTheme,
            orangeTheme,
            pinkTheme,
            purpleTheme,
            washedOutTheme
        ]
    }

    // MARK: - Save & Restore Theme Index

    private func restoreSavedTheme() {
        guard let encodedTheme = dataStore.getValue() as? Data
        else {
            return
        }

        let decoder = JSONDecoder()
        if let previousTheme = try? decoder
            .decode(
                CalculatorTheme.self,
                from: encodedTheme
            ) {
            savedTheme = previousTheme
        }
    }

    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        if let encodedTheme = try? encoder.encode(theme) {
            dataStore.set(encodedTheme)
        }
    }

    // MARK: - Next Theme

    func moveToNextTheme() {

        // Index of saved theme
        let currentThemeId = currentTheme.id
        let currentThemeIndex = themes.firstIndex { calculatorTheme in
            calculatorTheme.id == currentThemeId
        }

        // reset the theme if something has gone wrong
        guard let indexOfExistingTheme = currentThemeIndex else {
            if let firstTheme = themes.first {
                updateSystemThemeWith(firstTheme)
            }
            return
        }

        // Move to the next theme
        var nextThemeIndex = indexOfExistingTheme + 1
        if nextThemeIndex > themes.count - 1 {
            nextThemeIndex = 0
        }

        // Set the next theme
        let nextTheme = themes[nextThemeIndex]
        updateSystemThemeWith(nextTheme)
    }

    private func updateSystemThemeWith(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveThemeToDisk(theme)
    }
}
