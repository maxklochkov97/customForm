//
//  ContentView.swift
//  fourthProject
//
//  Created by Максим Клочков on 24.02.2022.


import SwiftUI

struct ContentView: View {

    static let color1 = #colorLiteral(red: 0.9047903419, green: 0.5437530279, blue: 0.5264148116, alpha: 1)
    static let color2 = #colorLiteral(red: 0.4719121456, green: 0.2981515229, blue: 0.3109664023, alpha: 1)

    @State var index = 0

    var body: some View {
        GeometryReader { _ in
            VStack() {
            Image("logo")
                .frame(width: 70, height: 70)

                ZStack {
                    SingUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }

                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color(ContentView.color1))
                        .frame(height: 1)

                    Text("OR")

                    Rectangle()
                        .fill(Color(ContentView.color1))
                        .frame(height: 1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)

                HStack(spacing: 25) {
                    Button(action: {
                        // какой-то код
                    }) {
                        Image("apple1")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }

                    Button(action: {
                        // какой-то код
                    }) {
                        Image("fb")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }

                    Button(action: {
                        // какой-то код
                    }) {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
            .padding(.top, 55)

        }
        .preferredColorScheme(.dark)
    }
}


struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)

                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer()
                }
                .padding(.top, 30)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(ContentView.color1))
                        TextField("Email Address", text: self.$email)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))

                }
                .padding(.horizontal)
                .padding(.top, 40)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(ContentView.color1))
                        SecureField("Password", text: self.$pass)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))

                }
                .padding(.horizontal)
                .padding(.top, 40)

                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        // какой-то код
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)

            }
            .padding()
            .padding(.bottom, 65)
            .background(Color(ContentView.color2))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button(action: {

            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color(ContentView.color1))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 27)
            .opacity(self.index == 0 ? 1 : 0)

        }
    }
}


struct SingUp: View {
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    VStack(spacing: 10) {
                        Text("SingUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)

                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(ContentView.color1))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(ContentView.color1))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(ContentView.color1))
                        SecureField("Password", text: self.$repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color(ContentView.color2))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button(action: {

            }) {
                Text("SINGUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color(ContentView.color1))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 30)
            .opacity(self.index == 1 ? 1 : 0)

        }

    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
