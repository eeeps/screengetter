//
//  main.swift
//  screengetter
//
//  Created by Eric Portis on 6/14/21.
//

import Foundation
import AppKit

func getDisplayBrightness() -> Float {

    var brightness: Float = 1.0
    var service: io_object_t = 1
    var iterator: io_iterator_t = 0
    let result: kern_return_t = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator)

    if result == kIOReturnSuccess {

        while service != 0 {
            service = IOIteratorNext(iterator)
            IODisplayGetFloatParameter(service, 0, kIODisplayBrightnessKey as CFString, &brightness)
            IOObjectRelease(service)
        }
    }
    return brightness
}

print("maximumExtendedDynamicRangeColorComponentValue: ", NSScreen.main?.maximumExtendedDynamicRangeColorComponentValue)
print("maximumPotentialExtendedDynamicRangeColorComponentValue: ", NSScreen.main?.maximumPotentialExtendedDynamicRangeColorComponentValue)
print("maximumReferenceExtendedDynamicRangeColorComponentValue: ", NSScreen.main?.maximumReferenceExtendedDynamicRangeColorComponentValue)
print("kIODisplayBrightnessKey: ", getDisplayBrightness())

