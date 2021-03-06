#!/bin/bash

###
## @NOTE: add your git cmake dependencies here (use git subtree, not git submodule)
## run add (once) first: git subtree add  --prefix lib/doctest https://github.com/onqtam/doctest.git master --squash 
## then you can use:     git subtree pull --prefix lib/doctest https://github.com/onqtam/doctest.git master --squash 
###

# base/util libs, some basic/util libs
git subtree pull --prefix backend/lib/better-enums https://github.com/aantron/better-enums.git master --squash 
git subtree pull --prefix backend/lib/cereal https://github.com/USCiLab/cereal master --squash 
git subtree pull --prefix backend/lib/clamp https://github.com/martinmoene/clamp master --squash 
git subtree pull --prefix backend/lib/json https://github.com/nlohmann/json master --squash 

## app libs, libs my app/backend ned
git subtree pull --prefix backend/lib/entt https://github.com/skypjack/entt.git master --squash
git subtree pull --prefix backend/lib/eventpp https://github.com/abeimler/eventpp master --squash 


## Testing, Benchmaks, .. libs
git subtree pull --prefix lib/benchpress https://github.com/abeimler/benchpress master --squash 
git subtree pull --prefix lib/doctest https://github.com/onqtam/doctest.git master --squash 


## not used
#git subtree pull --prefix lib/GSL/tests/unittest-cpp https://github.com/unittest-cpp/unittest-cpp master --squash 
#git subtree pull --prefix lib/GSL https://github.com/Microsoft/GSL master --squash 

#git subtree pull --prefix lib/type_safe https://github.com/foonathan/type_safe master --squash 
#git subtree pull --prefix lib/type_safe/external/debug_assert https://github.com/foonathan/debug_assert master --squash 
