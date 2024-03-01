//
//  AboutScreenUIView.swift
//  iosApp
//
//  Created by Thulani Mtetwa on 2024/02/29.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import shared

fileprivate struct RowItem: Hashable {
    let title: String
    let subtitle: String
}

struct AboutScreenUIView: View {
    
    private let items: [RowItem] = {
        let platform = Platform()
        platform.logSystemInfo()

        var result: [RowItem] = [
          .init(
            title: "Operating System",
            subtitle: "\(platform.name) \(platform.osVersion)"
          ),
          .init(
            title: "Device",
            subtitle: platform.deviceModel
          ),
          .init(
            title: "Density",
            subtitle: "@\(platform.density)x"
          )
        ]
        return result
      }()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(items, id: \.self) { item in
                    AboutListItemView(title: item.title,
                                      subtitle: item.subtitle)
                }
            }
            .navigationTitle("About Device")}
    }
}

struct AboutListItemView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(title)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Text(subtitle)
                .font(.body)
                .foregroundStyle(.primary)
        })
        .padding(.vertical, 4)
    }
}

#Preview {
    AboutScreenUIView()
}
