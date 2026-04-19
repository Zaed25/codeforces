//
//  main.cpp
//  codeforces
//
//  Created by Mhd Zaid Al Nahhas on 16/03/2025.
//

#include <iostream>
#include <cmath>
using std::cout;
using std::cin;
using std::endl;
using std::string;
using std::to_string;

int main(int argc, const char * argv[]) {
    int n = 0;
    cin >>  n;
    
    string* originalWord = new string[n];
    string* newWord;
    for (int i = 0; i < n; i++) {
        cin >> originalWord[i];
        if (originalWord[i].length() > 100 || originalWord[i].length() < 1) {
            cout << "Invalid word Length! Try again." << endl;
            cin >> originalWord[i];
        }
    }
    
    for (int i = 0; i<n; i++){
        if (originalWord[i].length()<=10) {
            originalWord[i]=originalWord[i];
        } else {
            long l = originalWord[i].length();
            long numOfMiddleLetters = l -2;
            string stringnumOfMiddleLetters = to_string(numOfMiddleLetters);
            long newWordSize = numOfMiddleLetters + 2;
            newWord = new string[newWordSize];
            newWord[i][0]=originalWord[i][0];
            newWord[i][l - 1]=originalWord[i][l];
            for (int j = 1; j <= stringnumOfMiddleLetters.length() ; j++) {
                newWord[i][j]=stringnumOfMiddleLetters[j-1];
            }
            
        }
    }
    
    for (int i =0 ; i < n; i++){
        cout << newWord[i] << endl;
    }
    return 0;
}
