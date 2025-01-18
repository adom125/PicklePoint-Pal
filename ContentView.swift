//
//  ContentView.swift
//  PicklePoint Pal Watch App
//
//  Created byDomanski on 7/25/24.
//
import SwiftUI

struct ContentView: View 
{
    let yellows = Color(red: 234.0, green: 255.0, blue: 0.0)
        
    @State var secondScreenDisplay = false
    @State private var scale = 1.0

    var body: some View
    {
        //add some start up animations
        VStack(alignment: .leading)
        {
            NavigationStack
            {
                Text("PicklePoint Pal")
                .font(.system(size:25))
                .fontWeight(.bold)
                .position(x: 100, y: 20)
                .foregroundStyle(.cyan)
                .shadow(radius: 10)

                NavigationLink(destination: SecondView())
                {
                    Label(
                        title: { Text("NEW GAME") },
                        icon: { Image(systemName: "") }
                    )
                    .foregroundStyle(.black)
                    .bold()
                    
                }
                .opacity(0.65)
                .background(.cyan)
                .cornerRadius(25) // 4
                .position(CGPoint(x: 97, y: 10.0))
                .scaleEffect(scale)
                .animation(.easeIn, value: scale)
                
                Image(systemName: "figure.racquetball")
                    .font(.largeTitle)
                    .foregroundStyle(.cyan)
                    .shadow(radius: 10)
                    .position(CGPoint(x: 100.0, y: 10.0))


            }
            
        }
        .background(Color(yellows))
        .frame(maxWidth: .infinity)
        

    }

}

struct SecondView: View 
{
    
    @State private var scale = 1.0
    var body: some View
    {
        //singles and doubles game
        NavigationStack
        {
            Text("Select Match Mode")
            .foregroundStyle(.black)
            .bold()
            NavigationLink(destination: singlesView())
            {
                Label(
                    title: { Text("SINGLES") },
                    icon: { Image(systemName: "") })
                .foregroundStyle(.black)
                .bold()
            }
            .opacity(0.65)
            .background(.cyan)
            .cornerRadius(25) // 4
            .scaleEffect(scale)
            .animation(.easeIn, value: scale)
            NavigationLink(destination: doublesView())
            {
                Label(
                    title: { Text("DOUBLES") },
                    icon: { Image(systemName: "") })
                .foregroundStyle(.black)
                .bold()
            }
            .opacity(0.65)
            .background(.cyan)
            .cornerRadius(25) // 4
            .scaleEffect(scale)
            .animation(.easeIn, value: scale)
        }
        .position(CGPoint(x: 100, y: 60.0))
    }
        
}
                
struct singlesView: View
{
    @State private var scale = 1.0
    @State private var playerOne: String = ""
    @State private var playerTwo: String = ""


    var body: some View 
    {
        ScrollView {
            VStack(alignment: .leading)
            {
                Label("Player One", systemImage: "")
                    .foregroundStyle(.black)
                    .bold()
                
                TextField(
                    "Player One",
                    text: $playerOne
                )
                .textInputAutocapitalization(.words)
                .disableAutocorrection(true)
                .border(.secondary)
                .position(CGPoint(x: 97, y: 25))
                .foregroundColor(.black)
                
                Label("Player Two", systemImage: "")
                    .foregroundStyle(.black)
                    .bold()
                
                TextField(
                    "Player Two",
                    text: $playerTwo
                )
                .textInputAutocapitalization(.words)
                .disableAutocorrection(true)
                .border(.secondary)
                .position(CGPoint(x: 97, y: 30))
                .foregroundColor(.black)
                
                NavigationLink(destination: playGame())
                {
                    Label(
                        title: { Text("START") },
                        icon: { Image(systemName: "") })
                    .foregroundStyle(.black)
                    .bold()
                    
                }
                .opacity(0.65)
                .background(.cyan)
                .cornerRadius(25) // 4
                .scaleEffect(scale)
                .animation(.easeIn, value: scale)
                
                //VALIDATE IF THEIR ARE TWO NAMES ENTERED FOR SINGLES display a check mark and prompt a button that says "Start Game"
                
            }
        }
    }
}

struct doublesView: View
{
    @State private var playerOne: String = ""
    @State private var playerTwo: String = ""
    @State private var playerThree: String = ""
    @State private var playerFour: String = ""
    @State private var scale = 1.0

    var body: some View
    {
        ScrollView {
            VStack(alignment: .leading)
            {
                Label("Team One", systemImage: "")
                    .foregroundStyle(.black)
                    .bold()
                
                TextField(
                    "Player One",
                    text: $playerOne
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .foregroundStyle(.black)
                .textCase(.uppercase)
                .cornerRadius(25)
                .border(.secondary)
                
                TextField(
                    "Player Two",
                    text: $playerTwo
                )
                
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .foregroundStyle(.black)
                .textCase(.uppercase)
                .cornerRadius(25)
                .border(.secondary)
                
                //if both names are added display a checkmark
                Label("Team Two", systemImage: "")
                    .foregroundStyle(.black)
                    .bold()
                
                TextField(
                    "Player Three",
                    text: $playerThree
                )
                //.focused($emailFieldIsFocused)
                // .onSubmit
                //{
                // validate(name: username)
                //}
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .foregroundStyle(.black)
                .textCase(.uppercase)
                .cornerRadius(25)
                .border(.secondary)
                
                TextField(
                    "Player Four",
                    text: $playerFour
                )
                //.focused($emailFieldIsFocused)
                // .onSubmit
                //{
                // validate(name: username)
                //}
                .textInputAutocapitalization(.words)
                .disableAutocorrection(true)
                .foregroundStyle(.black)
                .textCase(.uppercase)
                .cornerRadius(25)
                .border(.secondary)
                
                NavigationLink(destination: playGame())
                {
                    Label(
                        title: { Text("START") },
                        icon: { Image(systemName: "") })
                    .foregroundStyle(.black)
                    .bold()

                }
                .opacity(0.65)
                .background(.cyan)
                .cornerRadius(25) // 4
                .scaleEffect(scale)
                .animation(.easeIn, value: scale)
                //VALIDATE IF THEIR ARE TWO NAMES ENTERED FOR SINGLES display a check mark and prompt a button that says "Start Game"
                
            }
        }
    }
       
}

struct playGame: View
{
    var body: some View
    {
        Label("Serving...", systemImage: "")
            .foregroundColor(.black)
    }
}
//have a struct inGameMode that both singles and doubles screens go to upon hitting a "start" button
#Preview {

    ContentView()

}
