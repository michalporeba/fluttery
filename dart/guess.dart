import 'dart:io';
import 'dart:math';

main() {
    int? guess = null;
    int low = 0;
    int high = 99;
    int turns = 0;
    int theNumber = Random().nextInt(high+1); 

    do {
        turns +=1;
        print('Guess a number between $low and $high');
        stdout.write('is it: ');
        guess = int.parse(stdin.readLineSync()??'x', onError: (e) => -1);

        if (guess == null) {
            print('No, try again');
            continue;
        }
        else if (guess < theNumber) {
            low = guess;
            print('No, it is higher');
        } else if (guess > theNumber) {
            high = guess;
            print('No, it is lower');
        }
    } while (theNumber != guess);
    print('You got it in $turns turns! Go get a sign off.');
}