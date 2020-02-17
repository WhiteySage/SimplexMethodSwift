import Foundation

print("Симплекс Метод")
print("______________")
print("")
let Table = SimplexMethod()
Table.InitialCondition()
print("______________")

let mainTable = Table.maximize([
    [-3, -1, 4, 2, 0,0,0,    0],
    [3,  2, -2, -1, 1,0,0,  6],
    [0,  4, -2, 4, 0,1,0,  7],
    [3, 3, 4, -4, 0,0,1, 5],
])

print("Оптимальное рещение:\(mainTable)")

//maximize: 3x + 1y - 4z - 2d
//subject to:
//3x + 2y - 2z - 1d <= 6
//0x + 4y - 2z + 4d <= 7
//3x + 3y + 4z - 4d <= 5





//TEST


//let test1 = SimplexMethod()
//test1.maximize([
//    [1, -5, -3, 0,   0],
//    [0,  1,  1, 1, 100],
//])
////solution: [500, 100, 0, 0]
//
//let test2 = SimplexMethod()
//test2.maximize([
//    [1, -5, -3, 0, 0,   0],
//    [0,  1,  1, 1, 0, 100],
//    [0,  4,  2, 0, 1, 300],
//])
////solution: [400, 50, 50, 0, 0]
//let test3 = SimplexMethod()
//test3.maximize([
//    [1, -5, -3, 0, 0, 0,    0],
//    [0,  1,  1, 1, 0, 0,  100],
//    [0,  4,  2, 0, 1, 0,  300],
//    [0, 40, 30, 0, 0, 1, 3300],
//])
//// solution: [390, 60, 30, 10, 0, 0]







