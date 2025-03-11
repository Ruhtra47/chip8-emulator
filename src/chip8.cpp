#include <fstream>
#include <cstring>
#include <cstdint>
#include <chrono>
#include <random>

#include "chip8.h"

const unsigned int FONTSET_SIZE = 80;
const unsigned int FONTSET_START_ADDRESS = 0x50;
const unsigned int START_ADDRESS = 0x200;

unsigned char fontset[80] =
    {
        0xF0, 0x90, 0x90, 0x90, 0xF0, // 0
        0x20, 0x60, 0x20, 0x20, 0x70, // 1
        0xF0, 0x10, 0xF0, 0x80, 0xF0, // 2
        0xF0, 0x10, 0xF0, 0x10, 0xF0, // 3
        0x90, 0x90, 0xF0, 0x10, 0x10, // 4
        0xF0, 0x80, 0xF0, 0x10, 0xF0, // 5
        0xF0, 0x80, 0xF0, 0x90, 0xF0, // 6
        0xF0, 0x10, 0x20, 0x40, 0x40, // 7
        0xF0, 0x90, 0xF0, 0x90, 0xF0, // 8
        0xF0, 0x90, 0xF0, 0x10, 0xF0, // 9
        0xF0, 0x90, 0xF0, 0x90, 0x90, // A
        0xE0, 0x90, 0xE0, 0x90, 0xE0, // B
        0xF0, 0x80, 0x80, 0x80, 0xF0, // C
        0xE0, 0x90, 0x90, 0x90, 0xE0, // D
        0xF0, 0x80, 0xF0, 0x80, 0xF0, // E
        0xF0, 0x80, 0xF0, 0x80, 0x80  // F
};

Chip8::Chip8() : randGen(std::chrono::system_clock::now().time_since_epoch().count())
{
    pc = START_ADDRESS;

    for (unsigned int i = 0; i < FONTSET_SIZE; ++i)
        memory[FONTSET_START_ADDRESS + i] = fontset[i];

    randByte = std::uniform_int_distribution<uint8_t>(0, 255u);
}

void Chip8::loadGame(char const *filename)
{
    std::ifstream file(filename, std::ios::binary | std::ios::ate);

    if (file.is_open())
    {
        std::streampos size = file.tellg();
        char *buffer = new char[size];
        file.seekg(0, std::ios::beg);
        file.read(buffer, size);
        file.close();

        for (long i = 0; i < size; ++i)
        {
            memory[START_ADDRESS + i] = buffer[i];
        }

        delete[] buffer;
    }
}

void Chip8::emulateCycle()
{
    opcode = memory[pc] << 8 | memory[pc + 1];

    pc += 2;

    // switch para cada opcode, chamar sua devida função.
    // TODO: Implementar ponteiro de função (parece ser melhor).
    // Vou escrever uma função para cada opcode para facilitar essa mudança.

    switch (opcode & 0xF000)
    {
    case 0x0000:
        switch (opcode & 0x00FF)
        {
        case 0x00E0:
            OP_00E0();
            break;
        case 0x00EE:
            OP_00EE();
            break;
        }
        break;
    case 0x1000:
        OP_1NNN();
        break;
    case 0x2000:
        OP_2NNN();
        break;
    case 0x3000:
        OP_3XNN();
        break;
    case 0x4000:
        OP_4XNN();
        break;
    case 0x5000:
        OP_5XY0();
        break;
    case 0x6000:
        OP_6XNN();
        break;
    case 0x7000:
        OP_7XNN();
        break;
    case 0x8000:
        switch (opcode & 0x000F)
        {
        case 0x0:
            OP_8XY0();
            break;
        case 0x1:
            OP_8XY1();
            break;
        case 0x2:
            OP_8XY2();
            break;
        case 0x3:
            OP_8XY3();
            break;
        case 0x4:
            OP_8XY4();
            break;
        case 0x5:
            OP_8XY5();
            break;
        case 0x7:
            OP_8XY7();
            break;
        case 0xE:
            OP_8XYE();
            break;
        }
        break;
    case 0x9000:
        OP_9XY0();
        break;
    case 0xA000:
        OP_ANNN();
        break;
    case 0xB000:
        OP_BNNN();
        break;
    case 0xC000:
        OP_CXNN();
        break;
    case 0xD000:
        OP_DXYN();
        break;
    case 0xE000:
        switch (opcode & 0x00FF)
        {
        case 0x9E:
            OP_EX9E();
            break;
        case 0xA1:
            OP_EXA1();
            break;
        }
        break;
    case 0xF000:
        switch (opcode & 0x00FF)
        {
        case 0x07:
            OP_FX07();
            break;
        case 0x0A:
            OP_FX0A();
            break;
        case 0x15:
            OP_FX15();
            break;
        case 0x18:
            OP_FX18();
            break;
        case 0x1E:
            OP_FX1E();
            break;
        case 0x29:
            OP_FX29();
            break;
        case 0x33:
            OP_FX33();
            break;
        case 0x55:
            OP_FX55();
            break;
        case 0x65:
            OP_FX65();
            break;
        }
        break;
    default:
        printf("Uknown opcode [0x000]: 0x%X\n", opcode);
        break;
    }

    if (delayTimer > 0)
        --delayTimer;

    if (soundTimer > 0)
        --soundTimer;
}

void Chip8::OP_00E0()
{
    memset(video, 0, sizeof(video));
}

void Chip8::OP_00EE()
{
    --sp;
    pc = stack[sp];
}

void Chip8::OP_1NNN()
{
    pc = opcode & 0x0FFFu;
}

void Chip8::OP_2NNN()
{
    stack[sp] = pc;
    ++sp;
    pc = opcode & 0x0FFFu;
}

void Chip8::OP_3XNN()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t n = (opcode & 0x00FFu);

    if (registers[Vx] == n)
    {
        pc += 2;
    }
}

void Chip8::OP_4XNN()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t n = (opcode & 0x00FFu);

    if (registers[Vx] != n)
    {
        pc += 2;
    }
}

void Chip8::OP_5XY0()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;

    if (registers[Vx] == registers[Vy])
    {
        pc += 2;
    }
}

void Chip8::OP_6XNN()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    registers[Vx] = (opcode & 0x00FFu);
}

void Chip8::OP_7XNN()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    registers[Vx] += (opcode & 0x00FFu);
}

void Chip8::OP_8XY0()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;
    registers[Vx] = registers[Vy];
}

void Chip8::OP_8XY1()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;
    registers[Vx] |= registers[Vy];
}

void Chip8::OP_8XY2()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;
    registers[Vx] &= registers[Vy];
}

void Chip8::OP_8XY3()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;
    registers[Vx] ^= registers[Vy];
}

void Chip8::OP_8XY4()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;

    uint16_t s = registers[Vx] + registers[Vy];

    if (s > 255u)
        registers[0xF] = 1;
    else
        registers[0xF] = 0;

    registers[Vx] = s & 0xFFu;
}

void Chip8::OP_8XY5()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;

    if (registers[Vy] > registers[Vx])
        registers[0xF] = 1;
    else
        registers[0xF] = 0;

    registers[Vx] -= registers[Vy];
}

void Chip8::OP_8XY6()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;

    registers[0xF] = (Vx & 0x1u);

    registers[Vx] >>= 1;
}

void Chip8::OP_8XY7()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;

    if (registers[Vx] > registers[Vy])
        registers[0xF] = 0;
    else
        registers[0xF] = 1;

    registers[Vx] = registers[Vy] - registers[Vx];
}

void Chip8::OP_8XYE()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;

    registers[0xF] = (registers[Vx] & 0x80u) >> 7u;

    registers[Vx] <<= 1;
}

void Chip8::OP_9XY0()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8u;
    uint8_t Vy = (opcode & 0x00F0u) >> 4u;

    if (registers[Vx] != registers[Vy])
        pc += 2;
}

void Chip8::OP_ANNN()
{
    index = opcode & 0x0FFFu;
}

void Chip8::OP_BNNN()
{
    pc = registers[0] + (opcode & 0x0FFFu);
}

void Chip8::OP_CXNN()
{
    uint8_t Vx = (opcode & 0x0F00u) >> 8;

    registers[Vx] = randByte(randGen) & (opcode & 0x00FFu);
}

void Chip8::OP_DXYN()
{
    // TODO: DRAW
}

void Chip8::OP_EX9E()
{
    if (keypad[registers[(opcode & 0x0F00u) >> 8u]])
        pc += 2;
}

void Chip8::OP_EXA1()
{
    if (!keypad[registers[(opcode & 0x0F00u) >> 8u]])
        pc += 2;
}

void Chip8::OP_FX07()
{
    registers[(opcode & 0x0F00u) >> 8u] = delayTimer;
}

void Chip8::OP_FX0A()
{
    // seems hard
}

void Chip8::OP_FX15()
{
    delayTimer = registers[(opcode & 0x0F00u) >> 8u];
}

void Chip8::OP_FX18()
{
    soundTimer = registers[(opcode & 0x0F00u) >> 8u];
}

void Chip8::OP_FX1E()
{
    index += registers[(opcode & 0x0F00u) >> 8u];
}

void Chip8::OP_FX29()
{
}

void Chip8::OP_FX33()
{
}

void Chip8::OP_FX55()
{
    for (uint8_t i = 0; i <= (opcode & 0x0F00u) >> 8u; ++i)
    {
        memory[index + i] = registers[i];
    }
}

void Chip8::OP_FX65()
{
    for (uint8_t i = 0; i <= (opcode & 0x0F00u) >> 8u; ++i)
    {
        registers[i] = memory[index + i];
    }
}
