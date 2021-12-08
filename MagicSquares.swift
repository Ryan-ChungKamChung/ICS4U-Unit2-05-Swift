// Global constants
let three = 3
let four = 4
let five = 5
let six = 6
let seven = 7
let eight = 8
let nine = 9
let magicNum = 15

// Generates the magic squares
func genSquare(square: [Int], currentSquare: [Int], index: Int) {

    let mutableIndex = index
    var mutableSquare = square
    var mutableCurrentSquare = currentSquare

    for iterator in 0..<mutableSquare.count
        where mutableCurrentSquare[iterator] == 0 {

        mutableSquare[mutableIndex] = iterator + 1
        mutableCurrentSquare[iterator] = 1

        if mutableIndex < mutableSquare.count - 1 {
            genSquare(square: mutableSquare, currentSquare:
                mutableCurrentSquare, index: mutableIndex + 1)
        } else if isMagic(preSquare: mutableSquare) {
            printMagicSquare(outputSquare: mutableSquare)
        }

        mutableCurrentSquare[iterator] = 0
    }
}

// Checks if the magic square is a valid one
func isMagic(preSquare: [Int]) -> Bool {
    let row1 = preSquare[0] + preSquare[1] + preSquare[2]
    let row2 = preSquare[three] + preSquare[four] + preSquare[five]
    let row3 = preSquare[six] + preSquare[seven] + preSquare[eight]
    let col1 = preSquare[0] + preSquare[three] + preSquare[six]
    let col2 = preSquare[1] + preSquare[four] + preSquare[seven]
    let col3 = preSquare[2] + preSquare[five] + preSquare[eight]
    let diag1 = preSquare[0] + preSquare[four] + preSquare[eight]
    let diag2 = preSquare[2] + preSquare[four] + preSquare[six]

    return row1 == magicNum && row2 == magicNum && row3 == magicNum
        && col1 == magicNum && col2 == magicNum && col3 == magicNum
        && diag1 == magicNum && diag2 == magicNum
}

// Outputs a formatted magic square
func printMagicSquare(outputSquare: [Int]) {
    print("\n*****")
    for count in 0..<outputSquare.count {
        if count == three || count == six {
            print()
            print("\(outputSquare[count]) ", terminator: "")
        } else {
            print("\(outputSquare[count]) ", terminator: "")
        }
    }

    print("\n*****")
}

// Instantiates the arrays and calls genSquare()
let magicSquare = [1, 2, three, four, five, six, seven, eight, nine]
let extraArray = Array(repeating: 0, count: 9)

print("\nAll Possible Magic Squares (3x3):\n")
genSquare(square: magicSquare, currentSquare: extraArray, index: 0)

print("\nDone.")
