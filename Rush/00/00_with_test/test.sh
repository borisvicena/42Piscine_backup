#!/bin/sh

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
WHITE=$(tput setaf 7)
LOCATION="./ex00/$1"
PASSED_TESTS=0
FAILED_TESTS=0

clear
echo "${YELLOW}------------------ RUN TEST for $1 file!------------------"
# Checking for norminette
echo "${RED}------------------ NORMINETTE${WHITE}"
if norminette -R CheckForbiddenSourceHeader ./ex00/*.c; then
	echo "${GREEN}------------------ Norminette OK!"
	PASSED_TESTS=$((PASSED_TESTS+1));
else
	echo "${RED}------------------ Norminette FAILED!"
	FAILED_TESTS=$((FAILED_TESTS+1));
fi

# Checking compiling
echo "${RED}------------------ COMPILING${WHITE}"
if cc -Wall -Wextra -Werror ./ex00/ft_putchar.c ./ex00/main.c $LOCATION; then
	echo "${GREEN}------------------ Compiling OK!"
	PASSED_TESTS=$((PASSED_TESTS+1));
else
	echo"${RED}------------------ Compiling FAILED!"
	FAILED_TESTS=$((FAILED_TESTS+1));
fi

# Checking if file is executable
echo "${RED}------------------ CHMOD TEST"
if chmod +x $LOCATION; then
	echo "${GREEN}------------------ CHMOD OK!"
	PASSED_TESTS=$((PASSED_TESTS+1));
else
	echo "${RED}------------------ CHMOD FAILED!"
	FAILED_TESTS=$((FAILED_TESTS+1));
fi

# Checking if everything is running
echo "${RED}------------------ RUNNING $1${WHITE}"

if ./a.out; then
	echo "${GREEN}------------------ File $1 OK!"
	PASSED_TESTS=$((PASSED_TESTS+1));
else
	echo "${RED}------------------ File $1 FAILED!"
	FAILED_TESTS=$((FAILED_TESTS+1));
fi

# Printing all test results
ALL_TESTS=$((PASSED_TESTS+FAILED_TESTS))
echo
echo "${WHITE}ALL TESTS: $ALL_TESTS"
echo "${GREEN}PASSED TESTS: $PASSED_TESTS"
echo "${RED}FAILED TESTS: $FAILED_TESTS"
echo
