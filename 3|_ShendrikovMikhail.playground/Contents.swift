import UIKit

enum ModelCar{  //перечисление вида машин.
    case sportCar, truckCar
}

enum Engine: String { //перечисление состояния двигателя: запущен или заглушен двигатеть.
    case start, stop
}

enum Windows: String { //перечисление состояния окон: открыты или закрыты.
    case open, close
}

enum ChangeVolumeTrunk: Double { //перечисление сосотояния: погрузка или разгрузка.
    case loadTruck, unloadTruck
}


//создаем структуру Автомобиль.
struct Car{
    //создали свойства для Автомобиля.
    let model: ModelCar
    let year: Int
    let trunkVolume: Double
    var trunkModeNow: Double = 0{
        didSet {                    //устанавливаем наблюдение над погрузкой и разгрузкой.
            print("Первоначальная заполняемость была \(oldValue), текущая заполняемость стала \(trunkModeNow).")
        }
    }
        
    
    var modeEngine: Engine {//обращаемся к перечислениям.
        didSet {            //устанавливаем наблюдение за состоянием двигателя.
            print("Мотор \(model) машины: \(modeEngine)")
        }
    }
    var modeWindows: Windows { //обращаемся к перечислениям.
        didSet {            //устанавливаем наблюдение за состоянием окон.
            print("Окна \(model) автомобиля: \(modeWindows)")
        }
    }
    
    mutating func engine(){         //метод по запуску и остановке двигателя.
       
        if modeEngine == .start {
            modeEngine = .stop
        } else {
            modeEngine = .start
        }
    }
    
    
    mutating func changeWindowsMode() {   //метод по открыванию и закрыванию окон.
            if modeWindows == .open {
                modeWindows = .close
            } else {modeWindows = .open }
        }
    
    mutating func changeTrunkVolume(mode: ChangeVolumeTrunk, volume: Double){   //метод по погрузке и разгрузки машины, с контролем объема работ.
        switch mode {
        case .loadTruck:
            if (trunkModeNow + volume) <= trunkVolume && (trunkModeNow + volume) > 0 {
                self .trunkModeNow = trunkModeNow + volume
                } else {print("Перегруз, максимально можно загрузить \(trunkVolume) м3.")}
            
        case .unloadTruck:
            if (trunkModeNow - volume) < trunkVolume && (trunkModeNow - volume) > 0 {
                self .trunkModeNow = trunkModeNow - volume
                } else {print("Ошибка, максимально можно разгрузить \(trunkVolume) м3.")}
                                   
        }
    }
    
}
    
    
    
    

var myCar2 = Car(model: .truckCar, year: 21, trunkVolume: 100, trunkModeNow: 50, modeEngine: .stop, modeWindows: .close)
print(myCar2)

var myCar = Car(model: .sportCar, year: 21, trunkVolume: 100, modeEngine: .stop, modeWindows: .open)
print(myCar)
// открываем и закрываем окна.
myCar.modeWindows
myCar.changeWindowsMode()
myCar.modeWindows
myCar.changeWindowsMode()
myCar.modeWindows

// загружаем и разгружаем богажник.
myCar.trunkModeNow
myCar.changeTrunkVolume(mode: .loadTruck, volume: 50)
myCar.trunkModeNow
myCar.changeTrunkVolume(mode: .unloadTruck, volume: 3)
myCar.trunkModeNow

// запуск и остановка двигателя.
myCar.engine()
myCar.modeEngine
myCar.engine()
myCar.modeEngine

