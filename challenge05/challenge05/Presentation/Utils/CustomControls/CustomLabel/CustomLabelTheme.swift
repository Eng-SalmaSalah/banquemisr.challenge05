//
//  CustomLabelTheme.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

struct CustomLabelTheme {
    let font: UIFont
    let textColor: UIColor
}

struct CustomLabelThemes {
    //MARK: - Regular
    
    static let regular_primaryGrey_small = CustomLabelTheme(font: UIFont.appRegularFont(withSize: .small),
                                                           textColor: .primaryGrey)
    
    static let regular_primaryGrey_medium = CustomLabelTheme(font: UIFont.appRegularFont(withSize: .medium),
                                                            textColor: .primaryGrey)
    
    static let regular_primaryGrey_regular = CustomLabelTheme(font: UIFont.appRegularFont(withSize: .regular),
                                                              textColor: .primaryGrey)
    
    static let regular_primaryGrey_large = CustomLabelTheme(font: UIFont.appRegularFont(withSize: .large),
                                                           textColor: .primaryGrey)

    static let regular_black_regular = CustomLabelTheme(font: UIFont.appRegularFont(withSize: .regular),
                                                      textColor: .black)
    
    //MARK: - SemiBold

    static let semiBold_primaryGrey_small = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .small),
                                                            textColor: .primaryGrey)
    
    static let semiBold_primaryGrey_medium = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .medium),
                                                             textColor: .primaryGrey)
    
    static let semiBold_primaryGrey_regular = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regular),
                                                              textColor: .primaryGrey)
    
    static let semiBold_primaryGrey_large = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .large),
                                                            textColor: .primaryGrey)
    
    static let semiBold_primaryGrey_smallTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .smallTitle),
                                                            textColor: .primaryGrey)
    
    static let semiBold_mediumGrey_medium = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .medium),
                                                             textColor: .mediumGrey)
    
    static let semiBold_mediumGrey_large = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .large),
                                                          textColor: .mediumGrey)
    
    static let semiBold_placeholderGrey_regular = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regular),
                                                                   textColor: .placeholderGrey)
    
    static let semiBold_darkGrey_small = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .small),
                                                          textColor: .darkGrey)
    
    static let semiBold_darkGrey_medium = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .medium),
                                                           textColor: .darkGrey)
    
    static let semiBold_darkGrey_regular = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regular),
                                                            textColor: .darkGrey)
    
    static let semiBold_darkGrey_large = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .large),
                                                          textColor: .darkGrey)
    
    static let semiBold_darkGrey_smallTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .smallTitle),
                                                          textColor: .darkGrey)
    
    static let semiBold_darkGrey_regularTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regularTitle),
                                                                 textColor: .darkGrey)
    
    static let semiBold_darkGrey_largeTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .largeTitle),
                                                               textColor: .darkGrey)
    
    static let semiBold_black_medium = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .medium),
                                                        textColor: .black)
    
    static let semiBold_black_regular = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regular),
                                                         textColor: .black)
    
    static let semiBold_black_large = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .large),
                                                         textColor: .black)
    
    static let semiBold_black_smallTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .smallTitle),
                                                             textColor: .black)
    
    static let semiBold_black_mediumTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .mediumTitle),
                                                             textColor: .black)
    
    static let semiBold_black_regularTitle = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regularTitle),
                                                              textColor: .black)
    
    static let semiBold_white_regular = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .regular),
                                                         textColor: .white)

    static let semiBold_vividRed_medium = CustomLabelTheme(font: UIFont.appSemiBoldFont(withSize: .medium),
                                                           textColor: .vividRed)
    
    //MARK: - Bold
    static let bold_darkGrey_large = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .large),
                                                      textColor: .darkGrey)
    
    static let bold_darkGrey_regular = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .regular),
                                                        textColor: .darkGrey)
    
    static let bold_darkGrey_medium = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .medium),
                                                       textColor: .darkGrey)
    
    static let bold_darkGrey_smallTitle = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .smallTitle),
                                                           textColor: .darkGrey)
    
    static let bold_primaryGrey_regular = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .regular),
                                                           textColor: .primaryGrey)

    static let bold_black_large = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .large),
                                                   textColor: .black)
    
    static let bold_black_smallTitle = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .smallTitle),
                                                        textColor: .black)
    
    static let bold_white_largeTitle = CustomLabelTheme(font: UIFont.appBoldFont(withSize: .largeTitle),
                                                        textColor: .white)
    
}
