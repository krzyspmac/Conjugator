# Conjugator
A simple french conjugator object in Obj-C. Verbs.xml has been taken off the web. All rights belong to the original author. The conjugator is free for use. Just use responsively ;)

## State
Not yet ready. Maybe in the future.

## Usage
Just add the project to your own, add the dependencies, be sure to link the final library and you're set.

## Sample usage

    #import <ConjugatorSharedLibrary/Conjugator.h>

    self.conjugator = [[Conjugator alloc] init];
    NSString * conjugatedResult = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles mode:ConjugatorMode_Present];

