# Conjugator
A simple french conjugator object in Obj-C. Verbs.xml has been taken off the web. All rights belong to the original author. The conjugator is free for use. Just use responsively ;)

## State
Not yet ready. Maybe in the future.

## Linking and building
The project is designed as an ARC, shared-library piece of code. You can use it as such (iOS 8 required) or add the code diretly and omit the shared_library thingy.

As a shared_library - just add the project to your own (drag & drop), add the dependencies, be sure to link the final library and you're set.

## Sample usage

    #import <ConjugatorSharedLibrary/Conjugator.h>

    self.conjugator = [[Conjugator alloc] init];
    NSString * conjugatedResult = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles mode:ConjugatorMode_Present];

