abbr -a cmkg 'cmake -S . -B build -G "Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
abbr -a cmkb 'cmake --build build'
abbr -a cmkr 'cmake --build build; and ./build/main'
abbr -a cmkc 'test -f CMakeLists.txt; and rm -rf build .cache'
