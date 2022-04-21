//
//  ImageUrlStringTest.swift
//  DictionaryTests
//
//  Created by Лихалетов Дмитрий Михайлович on 21.04.2022.
//

import XCTest
import Dictionary

class ImageUrlStringTest: XCTestCase {
    
    private enum ImageUrl: String {
        case valid = "https://cdn-user77752.skyeng.ru/resized-images/640x480/jpeg/60/817712a5e7449bc173120806ad4e02d8.jpeg"
        case fromApi = "//cdn-user77752.skyeng.ru/resized-images/640x480/jpeg/60/817712a5e7449bc173120806ad4e02d8.jpeg"
        case firstInvalid = "afp/////cdn-user77752/resized-images/640x480/jpeg/60/817712a5e7449bc173120806ad4e02d8"
        case secondInvalid = "817712a5e7449bc173120806ad4e02d8.jpeg"
        case thirdInvalid = "http//cdn-user77752.skyeng.ru/resized-images/640x480/jpeg/60/817712a5e7449bc173120806ad4e02d8"
    }
    
    func testWordMeaningImageUrls() {
        XCTAssertNotNil(URL.makeUrl(ImageUrl.valid.rawValue))
        XCTAssertNotNil(URL.makeUrl(ImageUrl.fromApi.rawValue))
        XCTAssertNotNil(URL.makeUrl(ImageUrl.firstInvalid.rawValue))
        XCTAssertNotNil(URL.makeUrl(ImageUrl.secondInvalid.rawValue))
        XCTAssertNotNil(URL.makeUrl(ImageUrl.thirdInvalid.rawValue))
    }

}
