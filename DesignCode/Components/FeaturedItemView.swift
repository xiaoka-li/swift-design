//
//  FeaturedItemView.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/29.
//

import SwiftUI

struct FeaturedItemView: View {
    var thisCourse: Course = courses[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(thisCourse.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10.0)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)
            Text(thisCourse.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            Text(thisCourse.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(thisCourse.text)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0)
        .frame(height: 350.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30.0)
        .padding(.horizontal, 20.0)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView()
    }
}
