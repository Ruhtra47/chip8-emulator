#pragma once

#include <SDL2/SDL.h>
#include <bitset>

const int CHIP8_WIDTH = 64;
const int CHIP8_HEIGHT = 32;
const int SCALE = 20;
const int WINDOW_WIDTH = CHIP8_WIDTH * SCALE;
const int WINDOW_HEIGHT = CHIP8_HEIGHT * SCALE;

class Window
{
public:
    Window(char const *title);
    ~Window();
    void cycle(const std::bitset<CHIP8_WIDTH * CHIP8_HEIGHT> *display);
    bool processInput(uint8_t *keys);

private:
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
    std::bitset<CHIP8_WIDTH * CHIP8_HEIGHT> display;
};