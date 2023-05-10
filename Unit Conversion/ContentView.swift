//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Orhan Pojskic on 10.05.2023..
//

import SwiftUI


struct ContentView: View {
    @State var inputValue = 0.0
    @State var inputMetric = ""
    @State var outputMetric = ""
    @State var metrics = ["metar", "km", "feet", "yards", "miles"]
    @FocusState var isFocused: Bool
    var calculate: Double{
        var output: Double = inputValue
        
        switch outputMetric{
        case "metar":
            if inputMetric == "metar"{
                output = output * 1.0
            }else if inputMetric == "km"{
                output = output * 1000.0
            }else if inputMetric == "feet"{
                output = output * 0.3048
            }else if inputMetric == "yards"{
                output = output * 0.9144
            }else if inputMetric == "miles"{
                output = output * 1609.344
            }
        case "km":
            if inputMetric == "metar"{
                output = output * 0.001
            }else if inputMetric == "km"{
                output = output * 1.0
            }else if inputMetric == "feet"{
                output = output * 0.0003048
            }else if inputMetric == "yards"{
                output = output * 0.0009144
            }else if inputMetric == "miles"{
                output = output * 1.60934
            }
        case "feet":
            if inputMetric == "metar"{
                output = output * 3.28084
            }else if inputMetric == "km"{
                output = output * 3280.84
            }else if inputMetric == "feet"{
                output = output * 1.0
            }else if inputMetric == "yards"{
                output = output * 3.0
            }else if inputMetric == "miles"{
                output = output * 5280.0
            }
        case "yards":
            if inputMetric == "metar"{
                output = output * 1.09361
            }else if inputMetric == "km"{
                output = output * 1093.61
            }else if inputMetric == "feet"{
                output = output * 0.333333
            }else if inputMetric == "yards"{
                output = output * 1.0
            }else if inputMetric == "miles"{
                output = output * 1760.0
            }
        case "miles":
            if inputMetric == "metar"{
                output = output * 0.000621371
            }else if inputMetric == "km"{
                output = output * 0.621371
            }else if inputMetric == "feet"{
                output = output * 0.000189394
            }else if inputMetric == "yards"{
                output = output * 0.000568182
            }else if inputMetric == "miles"{
                output = output * 1.0
            }
        default:
            output = output * 1
        }
        return output
        
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Click here to input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Metrics", selection: $inputMetric){
                        ForEach(metrics, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("UNIT INPUT")
                }
                Section{
                    Picker("Metrics", selection: $outputMetric){
                        ForEach(metrics, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    Text("Result: \(calculate, specifier: "%.5f")")
                } header:{
                    Text("unit output")
                }
            }.navigationTitle("Unit Conversions")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
