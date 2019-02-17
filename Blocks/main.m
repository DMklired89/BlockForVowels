//
//  main.m
//  Blocks
//
//  Created by Dmitry Edrenov on 29.11.17.
//  Copyright © 2017 Dmitry Edrenov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // Создание массива строк, из которых удаляются гласные и контейнера для новых строк
        NSArray *oldStrings = [NSArray arrayWithObjects:@"Sauerkraut", @"Raygun",
        @"Big Nerd Ranch", @"Mississippi", nil];
        
        NSLog(@"Old strings: %@", oldStrings);
        
        NSMutableArray *newStrings = [NSMutableArray array];
        
        // Создание списка символов, удаляемых из строки
        NSArray *vowels = [NSArray arrayWithObjects: @"a", @"e", @"i", @"o", @"u", nil];
        
        // Объявление блочной переменной
        void (^devowelizer) (id, NSUInteger, BOOL *);
        
        // Присваивание блока переменной
        devowelizer = ^(id string, NSUInteger i, BOOL *stop)
        {
            NSMutableString *newString = [NSMutableString stringWithString: string];
            
            // Перебор массива данных и замена всех вхождений элементов пустой строки
            for (NSString *s in vowels)
            {
                NSRange fullRange = NSMakeRange(0, [newString length]);
               
                [newString replaceOccurrencesOfString: s withString: @"" options:
                NSCaseInsensitiveSearch range: fullRange];
            }
            [newStrings addObject: newString];
       
        }; // Конец присваивания блока
        
        // Перебор элементов массива с блоком
        [oldStrings enumerateObjectsUsingBlock: devowelizer];
        NSLog(@"new strings: %@", newStrings);
    }
    return 0;
}
