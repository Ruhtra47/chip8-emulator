#include <iostream>
#include <chrono>
#include <SDL2/SDL.h>

#include "chip8.h"
#include "window.h"

int main()
{
    // if (argc != 2)
    // {
    //     std::cerr << "Usage: " << argv[0] << " <ROM>\n";
    //     std::exit(EXIT_FAILURE);
    // }

    // char const *romFileName = argv[1];

    std::string temp;
    std::cin >> temp;
    const char *romFileName = temp.c_str();

    Window window("Chip8 Emulator");

    Chip8 chip8;
    chip8.loadGame(romFileName);

    auto lastCycleTime = std::chrono::high_resolution_clock::now();
    bool quit = false;

    while (!quit)
    {
        quit = window.processInput(chip8.keypad);

        auto currentTime = std::chrono::high_resolution_clock::now();
        float dt = std::chrono::duration<float, std::chrono::milliseconds::period>(currentTime - lastCycleTime).count();

        if (dt > 10)
        {
            lastCycleTime = currentTime;
            chip8.emulateCycle();

            std::cout << "cycled\n";

            window.cycle(&chip8.video);
        }
    }

    return 0;
}