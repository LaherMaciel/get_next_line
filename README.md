# get_next_line

[![42](https://img.shields.io/badge/42-Project-blue)](https://42.fr)
[![C](https://img.shields.io/badge/Language-C-green)](https://en.wikipedia.org/wiki/C_(programming_language))

> Read a file descriptor one line at a time.

## Overview

`get_next_line` is a 42 School Rank 1 project. The goal is to implement a function that reads a line from a file descriptor each time it is called, handling any `BUFFER_SIZE` and working correctly across multiple calls.

The bonus version supports multiple file descriptors simultaneously.

## Function signature

```c
char *get_next_line(int fd);
```

Returns the next line from `fd` (including the `\n`), or `NULL` when the file ends or an error occurs.

## Project structure

```
get_next_line/
├── get_next_line.c            # Mandatory — single fd
├── get_next_line_utils.c      # Helpers for mandatory
├── get_next_line.h            # Header for mandatory
├── get_next_line_bonus.c      # Bonus — multiple fds
├── get_next_line_utils_bonus.c# Helpers for bonus
├── get_next_line_bonus.h      # Header for bonus
└── Makefile
```

## How it works

- Uses a `static` buffer to persist unread data between calls
- The bonus version uses a 2D static buffer indexed by fd (`buffer[FOPEN_MAX][BUFFER_SIZE + 1]`), allowing independent reads on up to `FOPEN_MAX` file descriptors at once
- `BUFFER_SIZE` defaults to `42` but can be overridden at compile time

## Usage

### Add to your project

```bash
# Copy the files you need into your project
cp get_next_line.c get_next_line_utils.c get_next_line.h your_project/
```

### Compile with custom BUFFER_SIZE

```bash
cc -Wall -Wextra -Werror -D BUFFER_SIZE=64 your_file.c get_next_line.c get_next_line_utils.c
```

### Example

```c
#include "get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

int main(void)
{
    int     fd;
    char    *line;

    fd = open("file.txt", O_RDONLY);
    while ((line = get_next_line(fd)) != NULL)
    {
        printf("%s", line);
        free(line);
    }
    close(fd);
    return (0);
}
```

## Make targets

| Target | Description |
|--------|-------------|
| `make` | Build test binary with mandatory version |
| `make bonus` | Build test binary with bonus version |
| `make clean` | Remove object files |
| `make fclean` | Remove object files and binary |
| `make re` | Rebuild from scratch |

## Author

**Laher Maciel**
- GitHub: [@LaherMaciel](https://github.com/LaherMaciel)
- 42 Login: lawences
