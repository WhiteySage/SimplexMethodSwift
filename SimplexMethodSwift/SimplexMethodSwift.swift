 class SimplexMethod {
    
    
     var startTable = [[1,-3,-1,4,2,0,0,0,0],
                       [0,3,2,-2,-1,1,0,0,6],
                       [0,0,4,-2,4,0,1,0,7],
                       [0,3,3,4,-4,0,0,1,5]]
        
        func InitialCondition() -> () {
             for values in startTable {
                 print(values)
             }
                  }

        let c = [-3,-1,4,2]
        
        let A = [[3,2,-2,-1],
                 [0,4,-2,4],
                 [3,3,4,-4]]
        
        let b = [6,7,5]
        
        

        func initialize() -> () {
            let (m,n) = (A.count,A[0].count)
            let k = c.count
            var tempTable = [[Int]](repeating: [Int](repeating: 0, count: m + n + 1), count: m + 1)
        }
            
            
            
            
            
    //        Нужно получить такое: Matrix
    //        var Matrix = [
    //    [1, -3, -1, 4, 2, 0,0,0,    0],
    //    [0,  3,  2, -2, -1, 1,0,0,  6],
    //    [0,  0,  4, -2, 4, 0,1,0,  7],
    //    [0, 3, 3, 4, -4, 0,0,1, 5],
    //]
    
    
    
    public func maximize(_ Matrix: [[Float]]) -> [Float] {
        
        var table = Matrix

        // Поворачиваем пока не будет оптимальным решение
        while let pivotColumnIndex = selectPivotColumn(table) {
            let pivotRowIndex = selectPivotRow(table, pivotColumnIndex: pivotColumnIndex)
            table = pivot(table, pivotRowIndex: pivotRowIndex, pivotColumnIndex: pivotColumnIndex)
        }

       // print("Оптимальное решение найдено:\(solution(table))")
        return solution(table)
    }

    //Возвращает индекс минимаьного элемента в цеевой функции и получаем индекс минимального столбца или решение найдено, если нет отрицательного
    
     func selectPivotColumn(_ Matrix:[[Float]]) -> Int? {
          //  Находим максимальное идекс макс отриц элемента в целевой функции.
          let minValue = Matrix[0].dropLast().firstIndex{$0 < 0}
        
          return minValue
      }

    // Находим ведущую строку
    
    func selectPivotRow(_ Matrix: [[Float]], pivotColumnIndex: Int) -> Int {
        // получаем кортеж из числе больше 0 в столбце
        let positiveRowIndexes = (1..<Matrix.count).filter { Matrix[$0][pivotColumnIndex] > 0 }

        // Select the row with the lowest ratio.
        return positiveRowIndexes.min {
            let row0 = Matrix[$0]
            let ratio0 = row0.last! / row0[pivotColumnIndex]

            let row1 = Matrix[$1]
            let ratio1 = row1.last! / row1[pivotColumnIndex]
            
 //  нашли меньшее значение при делении результатов столбца на основной
            return ratio0 < ratio1
        }!
    }

    // возвращает копию таблицы, развернутую в указанной ячейке
    
    func pivot(_ Matrix: [[Float]], pivotRowIndex: Int, pivotColumnIndex: Int) -> [[Float]] {
        
        return Matrix.enumerated().map { rowIndex, row in
            if rowIndex == pivotRowIndex {
                
                // получили коеф из столбца
                let coeff = row[pivotColumnIndex]
                
                // получаем строку и делим на коеф,
                return row.map { $0 / coeff }
            }

            
            let coeff = row[pivotColumnIndex] / Matrix[pivotRowIndex][pivotColumnIndex]
            return row.enumerated().map { columnIndex, cellValue in
                cellValue - coeff * Matrix[pivotRowIndex][columnIndex]
            }
        }
    }

    func solution(_ Matrix: [[Float]]) -> [Float] {
        return (0..<Matrix[0].count - 1).map { columnIndex in
            solution(Matrix, columnIndex: columnIndex)
        }
    }

    func solution(_ Matrix: [[Float]], columnIndex: Int) -> Float {
        let nonZeroRowIndexes = (0..<Matrix.count).filter { Matrix[$0][columnIndex] > 0 }

        if nonZeroRowIndexes.count != 1 {
            // Переменная не базисная
            return 0
        }

         // Переменная базисная
        let firstNonZeroRow = Matrix[nonZeroRowIndexes[0]]
        return firstNonZeroRow.last! / firstNonZeroRow[columnIndex]
    }

 }

