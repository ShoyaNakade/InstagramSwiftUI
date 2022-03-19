//
//  LazyView.swift
//  InstagramSwiftUI
//  viewの中に入る時のみにviewの作成.
//  Created by 中出翔也 on 2022/03/19.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
