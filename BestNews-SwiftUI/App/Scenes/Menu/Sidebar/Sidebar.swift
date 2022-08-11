//
//  SideMenu.swift
//  SwiftUISideMenuDemo
//
//  Created by Rupesh Chaudhari on 24/04/22.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id: UUID = UUID()
    var icon: String
    var text: String
}

var userActions: [MenuItem] = [
    MenuItem(icon: "bag.fill", text: "İş dünyası")
]

struct SideMenu: View {
    @Binding var isSidebarVisible: Bool
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.6
    var menuColor: Color = UIColor.bnBlue.color
    var secondaryColor: Color = UIColor.bnSecondary.color

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }

            content
        }
        .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                menuColor
                MenuChevron
                VStack {
                    Spacer()
                    MenuLinks(items: userActions)
                    Spacer()
                }
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)

            Spacer()
        }
    }

    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(menuColor)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: isSidebarVisible ? -18 : -10)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }

            Image(systemName: "chevron.right")
                .foregroundColor(secondaryColor)
                .rotationEffect(isSidebarVisible ? Angle(degrees: 180) : Angle(degrees: 0))
                .offset(x: isSidebarVisible ? -4 : 8)
                .foregroundColor(.blue)
        }
        .offset(x: sideBarWidth / 2, y: 80)
        .animation(.default, value: isSidebarVisible)
    }

}

struct MenuLinks: View {
    var items: [MenuItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(items) { item in
                menuLink(icon: item.icon, text: item.text)
            }
        }
        .padding(.vertical, 14)
        .padding(.leading, 8)
    }
}

struct menuLink: View {
    var icon: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(UIColor.bnSecondary.color)
                .padding(.trailing, 18)
            Text(text)
                .foregroundColor(.white)
                .font(.body)
        }
        .onTapGesture {
            print("Tapped on \(text)")
        }
    }
}



struct SideMenuView_Previews: PreviewProvider {
    @State static private var isSideBarOpened = true

    static var previews: some View {
        SideMenu(isSidebarVisible: $isSideBarOpened)
    }
}
