clang++ -Ilibs/SFML-2.4.2-osx-clang/include/ -framework sfml-window -Flibs/SFML-2.4.2-osx-clang/Frameworks  -framework sfml-graphics -framework sfml-system -framework sfml-audio -F libs/SFML-2.4.2-osx-clang/  main.cpp -o main
install_name_tool -add_rpath @loader_path/libs/SFML-2.4.2-osx-clang/Frameworks/ ./main
