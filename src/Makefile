# cross platform Makefile for sfml-tutorial
#
#
#CXX = g++
#CXX = clang++
CXX = clang++
#LD=clang++
EXE = ../build/main 
SOURCES = main.cpp 
OBJS = $(addsuffix .o, $(basename $(notdir $(SOURCES))))
FRAMEWORKS = ../libs/SFML-2.4.2-osx-clang/Frameworks/
UNAME_S := $(shell uname -s)

define colorecho
	@tput setaf 6
	@echo $1
	@tput sgr0
endef

ifeq ($(UNAME_S), Linux) #LINUX
	ECHO_MESSAGE = "Linux"
	LIBS = ./libnfd.a -lGL -ldl -lpthread `sdl2-config --libs` `pkg-config --libs gtk+-3.0` 

	CXXFLAGS = -I. -I../libs/imgui -I../libs/imgui/libs/gl3w `sdl2-config --cflags` `pkg-config --cflags gtk+-3.0`
	CXXFLAGS += -Wall -Wformat
	CFLAGS = $(CXXFLAGS)
	COLORECHO = $(call colorecho,"Build complete for", $(ECHO_MESSAGE))
endif

ifeq ($(UNAME_S), Darwin) #APPLE
	ECHO_MESSAGE = "Mac OS X"
	LIBS =  -framework sfml-window -F $(FRAMEWORKS) -framework sfml-graphics -framework sfml-system -framework sfml-audio 

	CXXFLAGS = -I../libs/SFML-2.4.2-osx-clang/include/ 
	CXXFLAGS += -Wall -Wformat
	CFLAGS = $(CXXFLAGS)
    TOOLS = install_name_tool -add_rpath @loader_path/$(FRAMEWORKS) $(EXE) 
	COLORECHO = $(call colorecho,"Build complete for" $(ECHO_MESSAGE))
endif

ifeq ($(findstring MINGW,$(UNAME_S)),MINGW)
   ECHO_MESSAGE = "Windows"
   LIBS = -lgdi32 -lopengl32 -limm32 `pkg-config --static --libs sdl2`

   CXXFLAGS = -I../../ -I../libs/gl3w `pkg-config --cflags sdl2`
   CXXFLAGS += -Wall -Wformat
   CFLAGS = $(CXXFLAGS)
   COLORECHO = @echo Build complete for $(ECHO_MESSAGE)
endif


%.o:src/%.cpp
	$(CXX) $(CXXFLAGS) -c -std=c++14 -o $@ $<
#%.o:ImGuiColorTextEdit/%.cpp
	$(CXX) $(CXXFLAGS) -std=c++14 -c -o $@ $<

all: $(EXE)
	@$(COLORECHO)
	$(TOOLS)
	$(call colorecho, "Fixed rpath")	

$(EXE): $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

clean:
	rm -f $(EXE) $(OBJS)
