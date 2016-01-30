# Conjugator
A simple french conjugator object in Obj-C. Verbs.xml has been taken off the web. All rights belong to the original author. The conjugator is free for use. Just use responsively ;)

## State
Not yet ready. Maybe in the future but getting there.

## Linking and building
The project is designed as an ARC, shared-library piece of code. You can use it as such (iOS 8 required) or add the code diretly and omit the shared_library thingy.

As a shared_library - just add the project to your own (drag & drop), add the dependencies, be sure to link the final library and you're set.

If adding as a static library be sure to include all the neccessary files. More to follow when the project matures.

## Sample usage

    #import <ConjugatorSharedLibrary/Conjugator.h>

**Conjugator initialization**

    self.conjugator = [[Conjugator alloc] init];

**Present tense**

    NSString * conjugatedResult = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles mode:ConjugatorMode_Present options:0];

**Passé composé**

    self.conjugator = [[Conjugator alloc] init];
    NSString * conjugatedResult = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles ConjugatorTense_PasseCompose options:0];
    NSString * conjugatedResultWithAuxVerb = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles ConjugatorTense_PasseCompose options:ConjugatorOption_IncludeAxuliaryVerb];
    
**Imparfait**

    self.conjugator = [[Conjugator alloc] init];
    NSString * conjugatedResult = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles ConjugatorTense_Imparfait options:0];
