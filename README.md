# Conjugator

A simple french conjugator class in Obj-C. The base for french conjugation has been taken from <http://sourceforge.net/projects/fvcr/> and modified where appropriate (NSRegularExpression differences, added support for a couple of verbs, etc.).

# State

So far this code is under development. Functionality and implementation will change rapidly.

## Functionality

|Implemented|Functionality|
|:-----------:|-------------|
| x | Present tense |
| x | Imparfait 		|
| x | Passé composé |
|   | Subjonctif		|

## Testing and compliance

|Implemented|Verb compliance|
|:-----------:|-------------|
| x | 100 most used |
|   | 500 most used	|
|   | 1000 most used|

# License

This software is licensed using the `MIT License`. Please see the end of this document.

# Linking and building
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
    
# License

The MIT License (MIT)

Copyright (c) [2015] [Krzysztof Pawłowski]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
