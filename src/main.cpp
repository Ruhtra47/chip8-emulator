#include <iostream>
#include <chrono>
#include <SDL2/SDL.h>

#include "chip8.h"
#include "window.h"

int main(int argc, char **argv)
{
    if (argc != 4)
    {
        std::cerr << "Usage: " << argv[0] << " <SCALE> <Delay> <ROM>\n";
        std::exit(EXIT_FAILURE);
    }

    int videoScale = std::stoi(argv[1]);
    int cycleDelay = std::stoi(argv[2]);
    // int videoScale = 20;
    // int cycleDelay = 2;
    char const *romFileName = argv[3];

    Window window("Chip8 Emulator", VIDEO_WIDTH * videoScale, VIDEO_HEIGHT * videoScale, VIDEO_WIDTH, VIDEO_HEIGHT);

    Chip8 chip8;
    chip8.loadGame(romFileName);

    int videoPitch = sizeof(chip8.video[0]) * VIDEO_WIDTH;

    auto lastTimerTime = std::chrono::high_resolution_clock::now();
    const float timerInterval = 16.6667f;

    bool quit = false;

    while (!quit)
    {
        quit = window.processInput(chip8.keypad);

        auto currentTime = std::chrono::high_resolution_clock::now();
        float dt = std::chrono::duration<float, std::chrono::milliseconds::period>(currentTime - lastTimerTime).count();

        if (dt >= timerInterval)
        {
            lastTimerTime = currentTime;
            chip8.emulateCycle();

            window.cycle(chip8.video, videoPitch);
        }
    }

    return 0;
}