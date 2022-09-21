//
//  SegmentedControlViewDelegate.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

protocol SegmentedControlViewDelegate: AnyObject {
    func segmentedControl(didChange index: Int)
}
