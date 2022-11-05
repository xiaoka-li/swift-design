//
//  HomeView.swift
//  DesignCode
//
//  Created by xiaoka on 2022/10/29.
//

import SwiftUI

struct HomeView: View {
    @State var hasSrolled = false
    @Namespace var namespace
    @State var show = false
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollDetection
                
                featured
                
                Text("Cources".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,20)
                
                if !show {
                    CourseItemView(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                                show.toggle()
                            }
                        }
                }
            }
            .coordinateSpace(name: "scroll")
            .tracking(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(hasSrolled: $hasSrolled, title: "Featured")
            )
            if show {
                CourceView(namespace: namespace, show: $show)
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).midY)
        }.frame(height: 0)
            .onPreferenceChange(ScollPreferenceKey.self, perform: { value in
                withAnimation(.easeInOut) {
                    if value < 0 {
                        hasSrolled = true
                    } else {
                        hasSrolled = false
                    }
                }
                
            })
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItemView(thisCourse: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 50, y: -80)
                                .offset(x: minX / 2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1").offset(x: 250, y: -100)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
