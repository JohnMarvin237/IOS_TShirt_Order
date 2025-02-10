//
//  Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKOUITestsLaunchTests.swift
//  Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKOUITests
//
//  Created by John Marvin NDEKEBITIK HELIANG on 2025-02-10.
//

import XCTest

final class Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKOUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
