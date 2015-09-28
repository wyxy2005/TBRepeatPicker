//
//  TBRPPickerViewCell.swift
//  TBRepeatPicker
//
//  Created by hongxin on 15/9/24.
//  Copyright © 2015年 Teambition. All rights reserved.
//

import UIKit

enum TBRPPickerStyle {
    case Frequency
    case Every
    case Week
}

let TBRPPickerHeight: CGFloat = 215.0

private let TBRPPickerRowHeight: CGFloat = 40.0
private let TBRPPickerMaxRowCount = 999

protocol TBRPPickerCellDelegate {
    func pickerDidPick(pickerView: UIPickerView, pickStyle: TBRPPickerStyle, didSelectRow row: Int, inComponent component: Int)
}

class TBRPPickerViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    // MARK: - Public properties
    var locale = NSLocale.currentLocale()
    var pickerStyle: TBRPPickerStyle?
    var delegate: TBRPPickerCellDelegate?
    var unit: String? {
        didSet {
            pickerView?.reloadComponent(1)
        }
    }
    var frequency: TBRPFrequency? {
        didSet {
            pickerView?.selectRow((frequency?.rawValue)!, inComponent: 0, animated: true)
        }
    }
    var every: Int? {
        didSet {
            pickerView?.selectRow(every! - 1, inComponent: 0, animated: true)
        }
    }
    
    // MARK: - Private properties
    private var pickerView: UIPickerView?
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, pickerStyle: TBRPPickerStyle, locale: NSLocale) {
        self.init()

        pickerView = UIPickerView.init(frame: CGRectMake(0, 0, TBRPScreenWidth, TBRPPickerHeight))
        pickerView!.dataSource = self
        pickerView!.delegate = self
        
        self.pickerStyle = pickerStyle
        self.locale = locale
        contentView.addSubview(pickerView!)
    }
    
    // MARK: - UIPickerView data source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerStyle == .Frequency {
            return 1
        } else {
            return 2
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerStyle == .Frequency {
            return 4
        } else if pickerStyle == .Every {
            if component == 0 {
                return TBRPPickerMaxRowCount
            } else {
                return 1
            }
        } else if pickerStyle == .Week {
            if component == 0 {
                return TBRPHelper.sequencesInWeekPicker(locale).count
            } else {
                return TBRPHelper.daysInWeekPicker(locale).count
            }
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return TBRPPickerRowHeight
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return TBRPScreenWidth / 2
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerStyle == .Frequency {
            return TBRPHelper.frequencies(locale)[row]
        } else if pickerStyle == .Every {
            if component == 0 {
                return "\(row + 1)"
            } else {
                return unit
            }
        } else if pickerStyle == .Week {
            if component == 0 {
                return TBRPHelper.sequencesInWeekPicker(locale)[row]
            } else {
                return TBRPHelper.daysInWeekPicker(locale)[row]
            }
        }
        return nil
    }
    
    // MARK: - UIPickerView delegate
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let _ = delegate {
            delegate!.pickerDidPick(pickerView, pickStyle: pickerStyle!, didSelectRow: row, inComponent: component)
        }
    }
}
