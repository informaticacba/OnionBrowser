//
//  InstallViewController.swift
//  OnionBrowser
//
//  Created by Benjamin Erhart on 02.05.23.
//  Copyright © 2023 Tigas Ventures, LLC (Mike Tigas). All rights reserved.
//

import UIKit
import OrbotKit

class InstallViewController: UIViewController, WhyDelegate {

	static let orbot = "Orbot"


	@IBOutlet weak var titleLb: UILabel! {
		didSet {
			titleLb.text = String(format: NSLocalizedString("Install %@", comment: ""), Self.orbot)
		}
	}

	@IBOutlet weak var bodyLb: UILabel! {
		didSet {
			bodyLb.text = String(
				format: NSLocalizedString("%1$@ relies on %2$@ for a secure connection to Tor. Install the %2$@ app to continue.", comment: ""),
				Bundle.main.displayName,
				Self.orbot)
		}
	}

	@IBOutlet weak var getOrbotBt: UIButton! {
		didSet {
			getOrbotBt.setTitle(buttonTitle)
		}
	}

	@IBOutlet weak var whyBt: UIButton! {
		didSet {
			whyBt.setTitle(NSLocalizedString("Why", comment: ""))
		}
	}


	// MARK: WhyDelegate

	var buttonTitle: String {
		String(format: NSLocalizedString("Get %@", comment: ""), Self.orbot)
	}


	// MARK: Actions

	@IBAction
	func action() {
		UIApplication.shared.open(OrbotKit.appStoreLink)
	}

	@IBAction
	func why() {
		present(WhyViewController.instantiate(self))
	}
}