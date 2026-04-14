# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lawences <laherwpayotmaciel@gmail.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/03 16:41:52 by lawences          #+#    #+#              #
#    Updated: 2023/01/21 20:27:53 by lawences         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= gnl_test
CC		= cc
CFLAGS	= -Wall -Wextra -Werror

SRC		= get_next_line.c get_next_line_utils.c
SRC_B	= get_next_line_bonus.c get_next_line_utils_bonus.c

all: $(NAME)

$(NAME): $(SRC)
	$(CC) $(CFLAGS) $(SRC) main.c -o $(NAME)

bonus: $(SRC_B)
	$(CC) $(CFLAGS) $(SRC_B) main.c -o $(NAME)

clean:
	rm -f *.o *.gch

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re
