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
        restoreSavedThemeIndex()
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

    private func restoreSavedThemeIndex() {
        if let previousThemeIndex = dataStore.getValue() as? Int {
            savedThemeIndex = previousThemeIndex
        }

        savedTheme = themes[savedThemeIndex]
    }

    private func saveThemeIndexToDisk() {
        dataStore.set(savedThemeIndex)
    }

    // MARK: - Next Theme

    func moveToNextTheme() {

        savedThemeIndex = savedThemeIndex + 1
        if savedThemeIndex > themes.count - 1 {
            savedThemeIndex = 0
        }

        savedTheme = themes[savedThemeIndex]
        saveThemeIndexToDisk()
    }
}
