//
//  ScannerView.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 02/08/21.
//

import SwiftUI
import VisionKit
import Vision
import AVFoundation

class CameraManager: ObservableObject {
	@Published var permissionGranted = false
	
	func requestPermission() {
		AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
			DispatchQueue.main.async {
				self.permissionGranted = accessGranted
			}
		})
	}
}

final class ScannerView: UIViewControllerRepresentable {
	
//	@Binding var alertCameraAccessNeeded:Bool
	
//	let cameraAuthStatus = AVCaptureDevice.authorizationStatus(for: .video)
//	func requestCameraPermission() {
//		AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
//			guard accessGranted == true else {return}
//		})
//	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(completion: completionHandler)
	}
	
	final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
		private let completionHandler: ([String]?) -> Void
		
		init(completion: @escaping ([String]?) -> Void) {
			self.completionHandler = completion
		}
		
		func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
			let recognizer = TextRecognizer(cameraScan: scan)
			recognizer.recognizeText(withCompletionHandler: completionHandler)
		}
		
		func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
			completionHandler(nil)
		}
		
		func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
			completionHandler(nil)
		}
	}
	
	
	
	func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
		
		print("masuk make uiviewcontroller")
		let viewController = VNDocumentCameraViewController()
		viewController.delegate = context.coordinator
		return viewController
	}
	
	func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
	}
	
	typealias UIViewControllerType = VNDocumentCameraViewController
	
	private let completionHandler: ([String]?) -> Void
	
	init(completion: @escaping ([String]?) -> Void) {
		print("tes")
		self.completionHandler = completion
	}
}
