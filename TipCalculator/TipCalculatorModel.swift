//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Kristopher Cruickshank on 02/07/2016.
//  Copyright © 2016 Kristopher Cruickshank. All rights reserved.
//

import Foundation


class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(_ tipPct: Double) -> (tip:Double, total:Double) {
        let tip = subtotal * tipPct
        return (tip, subtotal + tip)
    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        
        let possibleTipsInferred = [0.05, 0.1, 0.15, 0.18, 0.20]
        
        var retval = [Int: (tipAmt:Double, total:Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            let tipPair = calcTipWithTipPct(possibleTip)
            retval[intPct] = (tipAmt:tipPair.tip, total: tipPair.total)
        }
        return retval
    }
    
}
