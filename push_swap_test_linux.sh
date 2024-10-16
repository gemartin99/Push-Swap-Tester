#!/bin/bash

# -=-=-=-=-	CLRS -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

DEF_COLOR='\033[0;39m'
BLACK='\033[0;30m'
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[0;93m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'
CYAN='\033[0;96m'
GRAY='\033[0;90m'
WHITE='\033[0;97m'

printf ${BLUE}"\n-------------------------------------------------------------\n"${DEF_COLOR};
printf ${YELLOW}"\n\t\tTEST CREATED BY: "${DEF_COLOR};
printf ${CYAN}"GEMARTIN\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n"${DEF_COLOR};

rm -rf traces.txt
rm -rf 0

# -=-=-=-=-	Control errors -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

FILE=$PWD/push_swap
FICHERO=test_check.txt

if [ -f "$FILE" ]; then
	echo -n
else
	printf "${RED}NO EXIST PUSH_SWAP PROGRAM ${DEF_COLOR}\n";
	exit 0
fi

if [ $1 == -v ];then
if [ -z "$2" ];then
	n=500;
else
	n=$2;
fi
ARG=$(seq -250 249 | shuf | tr '\n' ' '); ./push_swap $ARG | ./pro_checker $ARG
exit 0
fi

if [ $1 == -v2 ];then
ARG=$2; ./push_swap $ARG | ./pro_checker $ARG
exit 0
fi

if [ -z "$1" ] || [ $1 != -b ]; then
printf ${BLUE}"\n-------------------------------------------------------------\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t\tCONTROL ERRORS\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

ARG="a"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}1.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}1.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}1.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="111a11"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}2.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}2.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}2.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="hello world"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}3.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}3.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}3.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./push_swap "" > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}4.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}4.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}4.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="0 0"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}5.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}5.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}5.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-01 -001"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}6.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}6.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}6.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="111-1 2 -3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}7.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}7.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}7.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-3 -2 -2"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}8.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}8.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}8.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="\n"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}9.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}9.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}9.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-2147483649"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}10.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}10.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}10.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-2147483650"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}11.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}11.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}11.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="2147483648"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}12.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}12.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}12.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="8 008 12"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}13.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}13.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}13.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="10 -1 -2 -3 -4 -5 -6 90 99 10"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}14.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}14.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}14.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="1 +1 -1"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}15.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}15.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}15.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="3333-3333 1 4"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}16.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}16.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}16.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="111a111 -4 3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}17.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}17.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}17.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="111111 -4 3 03"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}18.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}18.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}18.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="2147483649"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}19.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}19.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}19.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="2147483647+1"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}20.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}20.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}20.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="0 1 2 3 4 5 0"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}21.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}21.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}21.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="3 +3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}22.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}22.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}22.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="3+3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}23.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}23.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}23.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="42 42"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}24.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}24.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}24.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="42 -42 -42 "
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}25.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}25.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}25.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="4222-4222"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}26.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}26.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}26.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="99999999999999999999999999"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}27.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}27.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}27.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-99999999999999999999999999"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}28.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}28.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}28.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="0 -0 1 -1"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}29.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}29.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}29.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="0 +0 1 -1"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}30.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}30.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}30.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="111+111 -4 3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}31.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}31.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}31.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}32.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}32.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}32.[KO] ${DEF_COLOR}\n";
fi

ARG="+"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}33.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}33.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}33.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="--123 1 321"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}34.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}34.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}34.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="++123 1 321"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}35.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}35.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}35.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="0000000000000000000000009 000000000000000000000009"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}36.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}36.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}36.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="00000001 1 9 3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}37.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}37.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}37.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="00000003 003 9 1"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}38.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}38.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}38.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="--21345"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}39.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}39.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}39.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt


ARG="1 01"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}40.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}40.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}40.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-000 -0000"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}41.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}41.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}41.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

ARG="-00042 -000042"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}42.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}42.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}42.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt
rm -rf 0

ARG="42 a 41"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}43.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}43.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}43.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt
rm -rf 0

ARG="42 41 40 45 101 x 202 -1 224 3"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}44.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}44.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}44.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt
rm -rf 0

ARG="42 -2 10 11 0 90 45 500 -200 e"
./push_swap $ARG > /dev/null 2> test_check.txt
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}45.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}45.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}45.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt
rm -rf 0

# -=-=-=-=-	Basic -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${BLUE}"\n-------------------------------------------------------------\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t\tBasic input\t\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

ARG="2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 4 ]; then
	printf "${GREEN}1.[OK] ${DEF_COLOR}";
else
	printf "${RED}1.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}2.[OK] ${DEF_COLOR}";
else
	printf "${RED}2.[KO]${DEF_COLOR}";
fi

ARG="1 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}3.[OK] ${DEF_COLOR}";
else
	printf "${RED}3.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}4.[OK] ${DEF_COLOR}";
else
	printf "${RED}4.[KO]${DEF_COLOR}";
fi

ARG="2 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 4 ]; then
	printf "${GREEN}5.[OK] ${DEF_COLOR}";
else
	printf "${RED}5.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}6.[OK] ${DEF_COLOR}";
else
	printf "${RED}6.[KO]${DEF_COLOR}";
fi

ARG="2 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 4 ]; then
	printf "${GREEN}7.[OK] ${DEF_COLOR}";
else
	printf "${RED}7.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}8.[OK] ${DEF_COLOR}";
else
	printf "${RED}8.[KO]${DEF_COLOR}";
fi

ARG="3 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 4 ]; then
	printf "${GREEN}9.[OK] ${DEF_COLOR}";
else
	printf "${RED}9.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}10.[OK] ${DEF_COLOR}";
else
	printf "${RED}10.[KO]${DEF_COLOR}";
fi

ARG="3 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 4 ]; then
	printf "${GREEN}11.[OK] ${DEF_COLOR}";
else
	printf "${RED}11.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}12.[OK] ${DEF_COLOR}";
else
	printf "${RED}12.[KO]${DEF_COLOR}";
fi
ARG="1 2 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}13.[OK] ${DEF_COLOR}";
else
	printf "${RED}13.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi

S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}14.[OK] ${DEF_COLOR}";
else
	printf "${RED}14.[KO]${DEF_COLOR}";
fi

ARG="1 3 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}15.[OK] ${DEF_COLOR}";
else
	printf "${RED}15.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}16.[OK] ${DEF_COLOR}";
else
	printf "${RED}16.[KO]${DEF_COLOR}";
fi

ARG="1 3 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}17.[OK] ${DEF_COLOR}";
else
	printf "${RED}17.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}18.[OK] ${DEF_COLOR}";
else
	printf "${RED}18.[KO]${DEF_COLOR}";
fi

ARG="1 4 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}19.[OK] ${DEF_COLOR}";
else
	printf "${RED}19.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}20.[OK] ${DEF_COLOR}";
else
	printf "${RED}20.[KO]${DEF_COLOR}";
fi

ARG="1 4 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}21.[OK] ${DEF_COLOR}";
else
	printf "${RED}21.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}22.[OK] ${DEF_COLOR}";
else
	printf "${RED}22.[KO]${DEF_COLOR}";
fi

ARG="2 3 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}23.[OK] ${DEF_COLOR}";
else
	printf "${RED}23.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}24.[OK] ${DEF_COLOR}";
else
	printf "${RED}24.[KO]${DEF_COLOR}";
fi

ARG="2 4 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}25.[OK] ${DEF_COLOR}";
else
	printf "${RED}25.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}26.[OK] ${DEF_COLOR}";
else
	printf "${RED}26.[KO]${DEF_COLOR}";
fi

ARG="2 1 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}27.[OK] ${DEF_COLOR}";
else
	printf "${RED}27.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}28.[OK] ${DEF_COLOR}";
else
	printf "${RED}28.[KO]${DEF_COLOR}";
fi

ARG="2 1 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}29.[OK] ${DEF_COLOR}";
else
	printf "${RED}29.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}30.[OK] ${DEF_COLOR}";
else
	printf "${RED}30.[KO]${DEF_COLOR}";
fi

ARG="2 3 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}31.[OK] ${DEF_COLOR}";
else
	printf "${RED}31.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}32.[OK] ${DEF_COLOR}";
else
	printf "${RED}32.[KO]${DEF_COLOR}";
fi

ARG="2 4 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}33.[OK] ${DEF_COLOR}";
else
	printf "${RED}33.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}34.[OK] ${DEF_COLOR}";
else
	printf "${RED}34.[KO]${DEF_COLOR}";
fi

ARG="3 4 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}35.[OK] ${DEF_COLOR}";
else
	printf "${RED}35.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}36.[OK] ${DEF_COLOR}";
else
	printf "${RED}36.[KO]${DEF_COLOR}";
fi

ARG="3 4 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}37.[OK] ${DEF_COLOR}";
else
	printf "${RED}37.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}38.[OK] ${DEF_COLOR}";
else
	printf "${RED}38.[KO]${DEF_COLOR}";
fi

ARG="3 2 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}39.[OK] ${DEF_COLOR}";
else
	printf "${RED}39.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}40.[OK] ${DEF_COLOR}";
else
	printf "${RED}40.[KO]${DEF_COLOR}";
fi

ARG="3 1 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}41.[OK] ${DEF_COLOR}";
else
	printf "${RED}41.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}42.[OK] ${DEF_COLOR}";
else
	printf "${RED}42.[KO]${DEF_COLOR}";
fi

ARG="3 1 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}43.[OK] ${DEF_COLOR}";
else
	printf "${RED}43.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}44.[OK] ${DEF_COLOR}";
else
	printf "${RED}44.[KO]${DEF_COLOR}";
fi

ARG="3 2 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}45.[OK] ${DEF_COLOR}";
else
	printf "${RED}45.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}46.[OK] ${DEF_COLOR}";
else
	printf "${RED}46.[KO]${DEF_COLOR}";
fi

ARG="3 1 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}47.[OK] ${DEF_COLOR}";
else
	printf "${RED}47.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}48.[OK] ${DEF_COLOR}";
else
	printf "${RED}48.[KO]${DEF_COLOR}";
fi

ARG="4 1 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}49.[OK] ${DEF_COLOR}";
else
	printf "${RED}49.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}50.[OK] ${DEF_COLOR}";
else
	printf "${RED}50.[KO]${DEF_COLOR}";
fi

ARG="4 1 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}51.[OK] ${DEF_COLOR}";
else
	printf "${RED}51.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}52.[OK] ${DEF_COLOR}";
else
	printf "${RED}52.[KO]${DEF_COLOR}";
fi

ARG="4 2 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}53.[OK] ${DEF_COLOR}";
else
	printf "${RED}53.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}54.[OK] ${DEF_COLOR}";
else
	printf "${RED}54.[KO]${DEF_COLOR}";
fi

ARG="4 2 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}55.[OK] ${DEF_COLOR}";
else
	printf "${RED}55.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}56.[OK] ${DEF_COLOR}";
else
	printf "${RED}56.[KO]${DEF_COLOR}";
fi

ARG="4 3 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}57.[OK] ${DEF_COLOR}";
else
	printf "${RED}57.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}58.[OK] ${DEF_COLOR}";
else
	printf "${RED}58.[KO]${DEF_COLOR}";
fi

ARG="4 3 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}59.[OK] ${DEF_COLOR}";
else
	printf "${RED}59.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}60.[OK] ${DEF_COLOR}";
else
	printf "${RED}60.[KO]${DEF_COLOR}";
fi

rm -rf 0

printf ${BLUE}"\n\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t\tSize 5\t\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};


ARG="1 2 3 5 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}1.[OK] ${DEF_COLOR}";
else
	printf "${RED}1.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}2.[OK] ${DEF_COLOR}";
else
	printf "${RED}2.[KO]${DEF_COLOR}";
fi

ARG="1 2 4 3 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}3.[OK] ${DEF_COLOR}";
else
	printf "${RED}3.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}4.[OK] ${DEF_COLOR}";
else
	printf "${RED}4.[KO]${DEF_COLOR}";
fi

ARG="1 2 4 5 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}5.[OK] ${DEF_COLOR}";
else
	printf "${RED}5.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}6.[OK] ${DEF_COLOR}";
else
	printf "${RED}6.[KO]${DEF_COLOR}";
fi

ARG="1 2 5 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}7.[OK] ${DEF_COLOR}";
else
	printf "${RED}7.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}8.[OK] ${DEF_COLOR}";
else
	printf "${RED}8.[KO]${DEF_COLOR}";
fi

ARG="1 2 5 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}9.[OK] ${DEF_COLOR}";
else
	printf "${RED}9.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}10.[OK] ${DEF_COLOR}";
else
	printf "${RED}10.[KO]${DEF_COLOR}";
fi

ARG="1 3 2 4 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}11.[OK] ${DEF_COLOR}";
else
	printf "${RED}11.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}12.[OK] ${DEF_COLOR}";
else
	printf "${RED}12.[KO]${DEF_COLOR}";
fi

ARG="1 3 2 5 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}13.[OK] ${DEF_COLOR}";
else
	printf "${RED}13.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi

S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}14.[OK] ${DEF_COLOR}";
else
	printf "${RED}14.[KO]${DEF_COLOR}";
fi

ARG="1 3 4 2 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}15.[OK] ${DEF_COLOR}";
else
	printf "${RED}15.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}16.[OK] ${DEF_COLOR}";
else
	printf "${RED}16.[KO]${DEF_COLOR}";
fi

ARG="1 3 4 5 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}17.[OK] ${DEF_COLOR}";
else
	printf "${RED}17.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}18.[OK] ${DEF_COLOR}";
else
	printf "${RED}18.[KO]${DEF_COLOR}";
fi

ARG="1 3 5 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}19.[OK] ${DEF_COLOR}";
else
	printf "${RED}19.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}20.[OK] ${DEF_COLOR}";
else
	printf "${RED}20.[KO]${DEF_COLOR}";
fi

ARG="1 3 5 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}21.[OK] ${DEF_COLOR}";
else
	printf "${RED}21.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}22.[OK] ${DEF_COLOR}";
else
	printf "${RED}22.[KO]${DEF_COLOR}";
fi

ARG="1 4 2 3 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}23.[OK] ${DEF_COLOR}";
else
	printf "${RED}23.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}24.[OK] ${DEF_COLOR}";
else
	printf "${RED}24.[KO]${DEF_COLOR}";
fi

ARG="1 4 2 5 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}25.[OK] ${DEF_COLOR}";
else
	printf "${RED}25.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}26.[OK] ${DEF_COLOR}";
else
	printf "${RED}26.[KO]${DEF_COLOR}";
fi

ARG="1 4 3 2 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}27.[OK] ${DEF_COLOR}";
else
	printf "${RED}27.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}28.[OK] ${DEF_COLOR}";
else
	printf "${RED}28.[KO]${DEF_COLOR}";
fi

ARG="1 4 3 5 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}29.[OK] ${DEF_COLOR}";
else
	printf "${RED}29.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}30.[OK] ${DEF_COLOR}";
else
	printf "${RED}30.[KO]${DEF_COLOR}";
fi

ARG="1 4 5 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}31.[OK] ${DEF_COLOR}";
else
	printf "${RED}31.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}32.[OK] ${DEF_COLOR}";
else
	printf "${RED}32.[KO]${DEF_COLOR}";
fi

ARG="1 4 5 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}33.[OK] ${DEF_COLOR}";
else
	printf "${RED}33.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}34.[OK] ${DEF_COLOR}";
else
	printf "${RED}34.[KO]${DEF_COLOR}";
fi

ARG="1 5 2 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}35.[OK] ${DEF_COLOR}";
else
	printf "${RED}35.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}36.[OK] ${DEF_COLOR}";
else
	printf "${RED}36.[KO]${DEF_COLOR}";
fi

ARG="1 5 2 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}37.[OK] ${DEF_COLOR}";
else
	printf "${RED}37.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}38.[OK] ${DEF_COLOR}";
else
	printf "${RED}38.[KO]${DEF_COLOR}";
fi

ARG="1 5 3 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}39.[OK] ${DEF_COLOR}";
else
	printf "${RED}39.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}40.[OK] ${DEF_COLOR}";
else
	printf "${RED}40.[KO]${DEF_COLOR}";
fi

ARG="1 5 3 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}41.[OK] ${DEF_COLOR}";
else
	printf "${RED}41.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}42.[OK] ${DEF_COLOR}";
else
	printf "${RED}42.[KO]${DEF_COLOR}";
fi

ARG="1 5 3 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}43.[OK] ${DEF_COLOR}";
else
	printf "${RED}43.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}44.[OK] ${DEF_COLOR}";
else
	printf "${RED}44.[KO]${DEF_COLOR}";
fi

ARG="1 5 4 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}45.[OK] ${DEF_COLOR}";
else
	printf "${RED}45.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}46.[OK] ${DEF_COLOR}";
else
	printf "${RED}46.[KO]${DEF_COLOR}";
fi

ARG="1 5 4 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}47.[OK] ${DEF_COLOR}";
else
	printf "${RED}47.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}48.[OK] ${DEF_COLOR}";
else
	printf "${RED}48.[KO]${DEF_COLOR}";
fi

ARG="2 1 3 4 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}49.[OK] ${DEF_COLOR}";
else
	printf "${RED}49.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}50.[OK] ${DEF_COLOR}";
else
	printf "${RED}50.[KO]${DEF_COLOR}";
fi

ARG="2 1 3 5 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}51.[OK] ${DEF_COLOR}";
else
	printf "${RED}51.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}52.[OK] ${DEF_COLOR}";
else
	printf "${RED}52.[KO]${DEF_COLOR}";
fi

ARG="2 1 4 3 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}53.[OK] ${DEF_COLOR}";
else
	printf "${RED}53.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}54.[OK] ${DEF_COLOR}";
else
	printf "${RED}54.[KO]${DEF_COLOR}";
fi

ARG="2 1 4 5 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}55.[OK] ${DEF_COLOR}";
else
	printf "${RED}55.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}56.[OK] ${DEF_COLOR}";
else
	printf "${RED}56.[KO]${DEF_COLOR}";
fi

ARG="2 1 5 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}57.[OK] ${DEF_COLOR}";
else
	printf "${RED}57.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}58.[OK] ${DEF_COLOR}";
else
	printf "${RED}58.[KO]${DEF_COLOR}";
fi

ARG="2 1 5 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}59.[OK] ${DEF_COLOR}";
else
	printf "${RED}59.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}60.[OK] ${DEF_COLOR}";
else
	printf "${RED}60.[KO]${DEF_COLOR}";
fi

ARG="2 3 1 4 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}61.[OK] ${DEF_COLOR}";
else
	printf "${RED}61.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}62.[OK] ${DEF_COLOR}";
else
	printf "${RED}62.[KO]${DEF_COLOR}";
fi

ARG="2 3 1 5 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}63.[OK] ${DEF_COLOR}";
else
	printf "${RED}63.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}64.[OK] ${DEF_COLOR}";
else
	printf "${RED}64.[KO]${DEF_COLOR}";
fi

ARG="2 3 4 1 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}65.[OK] ${DEF_COLOR}";
else
	printf "${RED}65.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}66.[OK] ${DEF_COLOR}";
else
	printf "${RED}66.[KO]${DEF_COLOR}";
fi

ARG="2 3 4 5 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}67.[OK] ${DEF_COLOR}";
else
	printf "${RED}67.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}68.[OK] ${DEF_COLOR}";
else
	printf "${RED}68.[KO]${DEF_COLOR}";
fi

ARG="2 3 5 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}69.[OK] ${DEF_COLOR}";
else
	printf "${RED}69.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}70.[OK] ${DEF_COLOR}";
else
	printf "${RED}70.[KO]${DEF_COLOR}";
fi

ARG="2 3 5 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}71.[OK] ${DEF_COLOR}";
else
	printf "${RED}71.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}72.[OK] ${DEF_COLOR}";
else
	printf "${RED}72.[KO]${DEF_COLOR}";
fi

ARG="2 4 1 3 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}73.[OK] ${DEF_COLOR}";
else
	printf "${RED}73.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}74.[OK] ${DEF_COLOR}";
else
	printf "${RED}74.[KO]${DEF_COLOR}";
fi

ARG="2 4 1 5 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}75.[OK] ${DEF_COLOR}";
else
	printf "${RED}75.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}76.[OK] ${DEF_COLOR}";
else
	printf "${RED}76.[KO]${DEF_COLOR}";
fi

ARG="2 4 3 1 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}77.[OK] ${DEF_COLOR}";
else
	printf "${RED}77.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}78.[OK] ${DEF_COLOR}";
else
	printf "${RED}78.[KO]${DEF_COLOR}";
fi

ARG="2 4 3 5 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}79.[OK] ${DEF_COLOR}";
else
	printf "${RED}79.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}80.[OK] ${DEF_COLOR}";
else
	printf "${RED}80.[KO]${DEF_COLOR}";
fi

ARG="2 4 5 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}81.[OK] ${DEF_COLOR}";
else
	printf "${RED}81.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}82.[OK] ${DEF_COLOR}";
else
	printf "${RED}82.[KO]${DEF_COLOR}";
fi

ARG="2 4 5 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}83.[OK] ${DEF_COLOR}";
else
	printf "${RED}83.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}84.[OK] ${DEF_COLOR}";
else
	printf "${RED}84.[KO]${DEF_COLOR}";
fi

ARG="2 5 1 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}85.[OK] ${DEF_COLOR}";
else
	printf "${RED}85.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}86.[OK] ${DEF_COLOR}";
else
	printf "${RED}86.[KO]${DEF_COLOR}";
fi

ARG="2 5 1 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}87.[OK] ${DEF_COLOR}";
else
	printf "${RED}87.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}88.[OK] ${DEF_COLOR}";
else
	printf "${RED}88.[KO]${DEF_COLOR}";
fi

ARG="2 5 3 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}89.[OK] ${DEF_COLOR}";
else
	printf "${RED}89.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}90.[OK] ${DEF_COLOR}";
else
	printf "${RED}90.[KO]${DEF_COLOR}";
fi

ARG="2 5 3 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}91.[OK] ${DEF_COLOR}";
else
	printf "${RED}91.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}92.[OK] ${DEF_COLOR}";
else
	printf "${RED}92.[KO]${DEF_COLOR}";
fi

ARG="2 5 4 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}93.[OK] ${DEF_COLOR}";
else
	printf "${RED}93.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}94.[OK] ${DEF_COLOR}";
else
	printf "${RED}94.[KO]${DEF_COLOR}";
fi

ARG="2 5 4 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}95.[OK] ${DEF_COLOR}";
else
	printf "${RED}95.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}96.[OK] ${DEF_COLOR}";
else
	printf "${RED}96.[KO]${DEF_COLOR}";
fi

ARG="3 1 2 4 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}97.[OK] ${DEF_COLOR}";
else
	printf "${RED}97.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}98.[OK] ${DEF_COLOR}";
else
	printf "${RED}98.[KO]${DEF_COLOR}";
fi

ARG="3 1 2 5 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}99.[OK] ${DEF_COLOR}";
else
	printf "${RED}99.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}100.[OK] ${DEF_COLOR}";
else
	printf "${RED}100.[KO]${DEF_COLOR}";
fi

ARG="3 1 4 2 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}101.[OK] ${DEF_COLOR}";
else
	printf "${RED}101.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}102.[OK] ${DEF_COLOR}";
else
	printf "${RED}102.[KO]${DEF_COLOR}";
fi

ARG="3 1 4 5 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}103.[OK] ${DEF_COLOR}";
else
	printf "${RED}103.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}104.[OK] ${DEF_COLOR}";
else
	printf "${RED}104.[KO]${DEF_COLOR}";
fi

ARG="3 1 5 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}105.[OK] ${DEF_COLOR}";
else
	printf "${RED}105.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}106.[OK] ${DEF_COLOR}";
else
	printf "${RED}106.[KO]${DEF_COLOR}";
fi

ARG="3 1 5 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}107.[OK] ${DEF_COLOR}";
else
	printf "${RED}107.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}108.[OK] ${DEF_COLOR}";
else
	printf "${RED}108.[KO]${DEF_COLOR}";
fi

ARG="3 2 1 4 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}109.[OK] ${DEF_COLOR}";
else
	printf "${RED}109.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}110.[OK] ${DEF_COLOR}";
else
	printf "${RED}110.[KO]${DEF_COLOR}";
fi

ARG="3 2 1 5 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}111.[OK] ${DEF_COLOR}";
else
	printf "${RED}111.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}112.[OK] ${DEF_COLOR}";
else
	printf "${RED}112.[KO]${DEF_COLOR}";
fi

ARG="3 2 4 1 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}113.[OK] ${DEF_COLOR}";
else
	printf "${RED}113.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}114.[OK] ${DEF_COLOR}";
else
	printf "${RED}114.[KO]${DEF_COLOR}";
fi

ARG="3 2 4 5 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}115.[OK] ${DEF_COLOR}";
else
	printf "${RED}115.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}116.[OK] ${DEF_COLOR}";
else
	printf "${RED}116.[KO]${DEF_COLOR}";
fi

ARG="3 2 5 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}117.[OK] ${DEF_COLOR}";
else
	printf "${RED}117.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}118.[OK] ${DEF_COLOR}";
else
	printf "${RED}118.[KO]${DEF_COLOR}";
fi

ARG="3 2 5 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}119.[OK] ${DEF_COLOR}";
else
	printf "${RED}119.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}120.[OK] ${DEF_COLOR}";
else
	printf "${RED}120.[KO]${DEF_COLOR}";
fi

ARG="3 4 1 2 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}121.[OK] ${DEF_COLOR}";
else
	printf "${RED}121.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}122.[OK] ${DEF_COLOR}";
else
	printf "${RED}122.[KO]${DEF_COLOR}";
fi

ARG="3 4 1 5 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}123.[OK] ${DEF_COLOR}";
else
	printf "${RED}123.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}124.[OK] ${DEF_COLOR}";
else
	printf "${RED}124.[KO]${DEF_COLOR}";
fi

ARG="3 4 2 1 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}125.[OK] ${DEF_COLOR}";
else
	printf "${RED}125.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}126.[OK] ${DEF_COLOR}";
else
	printf "${RED}126.[KO]${DEF_COLOR}";
fi

ARG="3 4 2 5 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}127.[OK] ${DEF_COLOR}";
else
	printf "${RED}127.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}128.[OK] ${DEF_COLOR}";
else
	printf "${RED}128.[KO]${DEF_COLOR}";
fi

ARG="3 4 5 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}129.[OK] ${DEF_COLOR}";
else
	printf "${RED}129.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}130.[OK] ${DEF_COLOR}";
else
	printf "${RED}130.[KO]${DEF_COLOR}";
fi

ARG="3 4 5 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}131.[OK] ${DEF_COLOR}";
else
	printf "${RED}131.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}132.[OK] ${DEF_COLOR}";
else
	printf "${RED}132.[KO]${DEF_COLOR}";
fi

ARG="3 5 1 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}133.[OK] ${DEF_COLOR}";
else
	printf "${RED}133.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}134.[OK] ${DEF_COLOR}";
else
	printf "${RED}134.[KO]${DEF_COLOR}";
fi

ARG="3 5 1 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}135.[OK] ${DEF_COLOR}";
else
	printf "${RED}135.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}136.[OK] ${DEF_COLOR}";
else
	printf "${RED}136.[KO]${DEF_COLOR}";
fi

ARG="3 5 2 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}137.[OK] ${DEF_COLOR}";
else
	printf "${RED}137.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}138.[OK] ${DEF_COLOR}";
else
	printf "${RED}138.[KO]${DEF_COLOR}";
fi

ARG="3 5 2 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}139.[OK] ${DEF_COLOR}";
else
	printf "${RED}139.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}140.[OK] ${DEF_COLOR}";
else
	printf "${RED}140.[KO]${DEF_COLOR}";
fi

ARG="3 5 4 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}141.[OK] ${DEF_COLOR}";
else
	printf "${RED}141.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}142.[OK] ${DEF_COLOR}";
else
	printf "${RED}142.[KO]${DEF_COLOR}";
fi

ARG="3 5 4 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}143.[OK] ${DEF_COLOR}";
else
	printf "${RED}143.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}144.[OK] ${DEF_COLOR}";
else
	printf "${RED}144.[KO]${DEF_COLOR}";
fi

ARG="4 1 2 3 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}145.[OK] ${DEF_COLOR}";
else
	printf "${RED}145.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}146.[OK] ${DEF_COLOR}";
else
	printf "${RED}146.[KO]${DEF_COLOR}";
fi

ARG="4 1 2 5 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}147.[OK] ${DEF_COLOR}";
else
	printf "${RED}147.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}148.[OK] ${DEF_COLOR}";
else
	printf "${RED}148.[KO]${DEF_COLOR}";
fi

ARG="4 1 3 2 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}149.[OK] ${DEF_COLOR}";
else
	printf "${RED}149.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}150.[OK] ${DEF_COLOR}";
else
	printf "${RED}150.[KO]${DEF_COLOR}";
fi

ARG="4 1 3 5 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}151.[OK] ${DEF_COLOR}";
else
	printf "${RED}151.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}152.[OK] ${DEF_COLOR}";
else
	printf "${RED}152.[KO]${DEF_COLOR}";
fi

ARG="4 1 5 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}153.[OK] ${DEF_COLOR}";
else
	printf "${RED}153.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}154.[OK] ${DEF_COLOR}";
else
	printf "${RED}154.[KO]${DEF_COLOR}";
fi

ARG="4 1 5 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}155.[OK] ${DEF_COLOR}";
else
	printf "${RED}155.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}156.[OK] ${DEF_COLOR}";
else
	printf "${RED}156.[KO]${DEF_COLOR}";
fi

ARG="4 2 1 3 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}157.[OK] ${DEF_COLOR}";
else
	printf "${RED}157.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}158.[OK] ${DEF_COLOR}";
else
	printf "${RED}158.[KO]${DEF_COLOR}";
fi

ARG="4 2 1 5 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}159.[OK] ${DEF_COLOR}";
else
	printf "${RED}159.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}160.[OK] ${DEF_COLOR}";
else
	printf "${RED}160.[KO]${DEF_COLOR}";
fi

ARG="4 2 3 1 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}161.[OK] ${DEF_COLOR}";
else
	printf "${RED}161.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}162.[OK] ${DEF_COLOR}";
else
	printf "${RED}162.[KO]${DEF_COLOR}";
fi

ARG="4 2 3 5 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}163.[OK] ${DEF_COLOR}";
else
	printf "${RED}163.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}164.[OK] ${DEF_COLOR}";
else
	printf "${RED}164.[KO]${DEF_COLOR}";
fi

ARG="4 2 5 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}165.[OK] ${DEF_COLOR}";
else
	printf "${RED}165.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}166.[OK] ${DEF_COLOR}";
else
	printf "${RED}166.[KO]${DEF_COLOR}";
fi

ARG="4 2 5 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}167.[OK] ${DEF_COLOR}";
else
	printf "${RED}167.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}168.[OK] ${DEF_COLOR}";
else
	printf "${RED}168.[KO]${DEF_COLOR}";
fi

ARG="4 3 1 2 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}169.[OK] ${DEF_COLOR}";
else
	printf "${RED}169.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}170.[OK] ${DEF_COLOR}";
else
	printf "${RED}170.[KO]${DEF_COLOR}";
fi

ARG="4 3 1 5 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}171.[OK] ${DEF_COLOR}";
else
	printf "${RED}171.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}172.[OK] ${DEF_COLOR}";
else
	printf "${RED}172.[KO]${DEF_COLOR}";
fi

ARG="4 3 2 1 5";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}173.[OK] ${DEF_COLOR}";
else
	printf "${RED}173.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}174.[OK] ${DEF_COLOR}";
else
	printf "${RED}174.[KO]${DEF_COLOR}";
fi

ARG="4 3 2 5 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}175.[OK] ${DEF_COLOR}";
else
	printf "${RED}175.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}176.[OK] ${DEF_COLOR}";
else
	printf "${RED}176.[KO]${DEF_COLOR}";
fi

ARG="4 3 5 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}177.[OK] ${DEF_COLOR}";
else
	printf "${RED}177.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}178.[OK] ${DEF_COLOR}";
else
	printf "${RED}178.[KO]${DEF_COLOR}";
fi

ARG="4 3 5 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}179.[OK] ${DEF_COLOR}";
else
	printf "${RED}179.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}180.[OK] ${DEF_COLOR}";
else
	printf "${RED}180.[KO]${DEF_COLOR}";
fi

ARG="4 5 1 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}181.[OK] ${DEF_COLOR}";
else
	printf "${RED}181.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}182.[OK] ${DEF_COLOR}";
else
	printf "${RED}182.[KO]${DEF_COLOR}";
fi

ARG="4 5 1 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}183.[OK] ${DEF_COLOR}";
else
	printf "${RED}183.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}184.[OK] ${DEF_COLOR}";
else
	printf "${RED}184.[KO]${DEF_COLOR}";
fi

ARG="4 5 2 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}185.[OK] ${DEF_COLOR}";
else
	printf "${RED}185.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}186.[OK] ${DEF_COLOR}";
else
	printf "${RED}186.[KO]${DEF_COLOR}";
fi

ARG="4 5 2 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}187.[OK] ${DEF_COLOR}";
else
	printf "${RED}187.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}188.[OK] ${DEF_COLOR}";
else
	printf "${RED}188.[KO]${DEF_COLOR}";
fi

ARG="4 5 3 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}189.[OK] ${DEF_COLOR}";
else
	printf "${RED}189.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}190.[OK] ${DEF_COLOR}";
else
	printf "${RED}190.[KO]${DEF_COLOR}";
fi

ARG="4 5 3 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}191.[OK] ${DEF_COLOR}";
else
	printf "${RED}191.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}192.[OK] ${DEF_COLOR}";
else
	printf "${RED}192.[KO]${DEF_COLOR}";
fi

ARG="5 1 2 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}193.[OK] ${DEF_COLOR}";
else
	printf "${RED}193.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}194.[OK] ${DEF_COLOR}";
else
	printf "${RED}194.[KO]${DEF_COLOR}";
fi

ARG="5 1 2 4 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}195.[OK] ${DEF_COLOR}";
else
	printf "${RED}195.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}196.[OK] ${DEF_COLOR}";
else
	printf "${RED}196.[KO]${DEF_COLOR}";
fi

ARG="5 1 3 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}197.[OK] ${DEF_COLOR}";
else
	printf "${RED}197.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}198.[OK] ${DEF_COLOR}";
else
	printf "${RED}198.[KO]${DEF_COLOR}";
fi

ARG="5 1 3 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}199.[OK] ${DEF_COLOR}";
else
	printf "${RED}199.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}200.[OK] ${DEF_COLOR}";
else
	printf "${RED}200.[KO]${DEF_COLOR}";
fi

ARG="5 1 4 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}201.[OK] ${DEF_COLOR}";
else
	printf "${RED}201.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}202.[OK] ${DEF_COLOR}";
else
	printf "${RED}202.[KO]${DEF_COLOR}";
fi

ARG="5 1 4 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}203.[OK] ${DEF_COLOR}";
else
	printf "${RED}203.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}204.[OK] ${DEF_COLOR}";
else
	printf "${RED}204.[KO]${DEF_COLOR}";
fi

ARG="5 1 4 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}205.[OK] ${DEF_COLOR}";
else
	printf "${RED}205.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}206.[OK] ${DEF_COLOR}";
else
	printf "${RED}206.[KO]${DEF_COLOR}";
fi

ARG="5 1 4 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}207.[OK] ${DEF_COLOR}";
else
	printf "${RED}207.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}208.[OK] ${DEF_COLOR}";
else
	printf "${RED}208.[KO]${DEF_COLOR}";
fi

ARG="5 2 3 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}209.[OK] ${DEF_COLOR}";
else
	printf "${RED}209.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}210.[OK] ${DEF_COLOR}";
else
	printf "${RED}210.[KO]${DEF_COLOR}";
fi

ARG="5 2 3 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}211.[OK] ${DEF_COLOR}";
else
	printf "${RED}211.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}212.[OK] ${DEF_COLOR}";
else
	printf "${RED}212.[KO]${DEF_COLOR}";
fi

ARG="5 2 4 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}213.[OK] ${DEF_COLOR}";
else
	printf "${RED}213.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}214.[OK] ${DEF_COLOR}";
else
	printf "${RED}214.[KO]${DEF_COLOR}";
fi

ARG="5 2 4 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}215.[OK] ${DEF_COLOR}";
else
	printf "${RED}215.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}216.[OK] ${DEF_COLOR}";
else
	printf "${RED}216.[KO]${DEF_COLOR}";
fi

ARG="5 3 1 2 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}217.[OK] ${DEF_COLOR}";
else
	printf "${RED}217.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}218.[OK] ${DEF_COLOR}";
else
	printf "${RED}218.[KO]${DEF_COLOR}";
fi

ARG="5 3 1 4 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}219.[OK] ${DEF_COLOR}";
else
	printf "${RED}219.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}220.[OK] ${DEF_COLOR}";
else
	printf "${RED}220.[KO]${DEF_COLOR}";
fi

ARG="5 3 2 1 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}221.[OK] ${DEF_COLOR}";
else
	printf "${RED}221.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}222.[OK] ${DEF_COLOR}";
else
	printf "${RED}222.[KO]${DEF_COLOR}";
fi

ARG="5 3 2 4 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}223.[OK] ${DEF_COLOR}";
else
	printf "${RED}223.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}224.[OK] ${DEF_COLOR}";
else
	printf "${RED}224.[KO]${DEF_COLOR}";
fi

ARG="5 3 4 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}225.[OK] ${DEF_COLOR}";
else
	printf "${RED}225.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}226.[OK] ${DEF_COLOR}";
else
	printf "${RED}226.[KO]${DEF_COLOR}";
fi

ARG="5 3 4 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}227.[OK] ${DEF_COLOR}";
else
	printf "${RED}227.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}228.[OK] ${DEF_COLOR}";
else
	printf "${RED}228.[KO]${DEF_COLOR}";
fi

ARG="5 4 1 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}229.[OK] ${DEF_COLOR}";
else
	printf "${RED}229.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}230.[OK] ${DEF_COLOR}";
else
	printf "${RED}230.[KO]${DEF_COLOR}";
fi

ARG="5 4 1 3 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}231.[OK] ${DEF_COLOR}";
else
	printf "${RED}231.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}232.[OK] ${DEF_COLOR}";
else
	printf "${RED}232.[KO]${DEF_COLOR}";
fi

ARG="5 4 2 1 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}233.[OK] ${DEF_COLOR}";
else
	printf "${RED}233.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}234.[OK] ${DEF_COLOR}";
else
	printf "${RED}234.[KO]${DEF_COLOR}";
fi

ARG="5 4 2 3 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}235.[OK] ${DEF_COLOR}";
else
	printf "${RED}235.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}236.[OK] ${DEF_COLOR}";
else
	printf "${RED}236.[KO]${DEF_COLOR}";
fi

ARG="5 4 3 1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}237.[OK] ${DEF_COLOR}";
else
	printf "${RED}237.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}238.[OK] ${DEF_COLOR}";
else
	printf "${RED}238.[KO]${DEF_COLOR}";
fi

ARG="5 4 3 2 1";
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 13 ]; then
	printf "${GREEN}239.[OK] ${DEF_COLOR}";
else
	printf "${RED}239.[KO]${DEF_COLOR}";
	printf "${WHITE} TEST: ";
	echo -n "$ARG "
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}240.[OK] ${DEF_COLOR}";
else
	printf "${RED}240.[KO]${DEF_COLOR}";
fi

printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t  Multiple size <= 100\t\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

echo Multiple size '<'= 100 >> traces.txt

res_1=0
res_2=0
res_3=0
res_4=0
res_5=0
res_err=0
control=1
val=201
media=0
alta=0
baja=2147483647
if [ $1 > 0 ]; then
	val=$1
fi
((val++))
cont=1
while [ $cont -lt $val ]
do
ARG=$(seq 0 99 | shuf | tr '\n' ' ');
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}$cont .[OK]${DEF_COLOR}";
	control=2
else
	printf "${RED}$cont .[KO]${DEF_COLOR}";
	control=3
fi
N=$(./push_swap $ARG | wc -l)
if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
if [ $N -gt 700 ] || [ $N -eq 700 ]; then
	echo TEST $cont ARG:"$ARG" >> traces.txt
fi
if [ $N -lt 700 ] && [ $control -eq 2 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
  media=$(($media+$N))
	((res_1++))
elif [ $N -gt 700 ] || [ $N -eq 700 ] && [ $N -lt 900 ] && [ $control -eq 2 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_2++))
elif [ $N -gt 900 ] || [ $N -eq 900 ] && [ $N -lt 1100 ] && [ $control -eq 2 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_3++))
elif [ $N -gt 1100 ] || [ $N -eq 1100 ] && [ $N -lt 1300 ] && [ $control -eq 2 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_4++))
elif [ $N -gt 1300 ] || [ $N -eq 1300 ] && [ $control -eq 2 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_5++))
elif [ $control -eq 3 ]; then
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	echo TEST $cont ARG:"$ARG" >> traces.txt
	((res_err++))
fi
((cont++))
done

((val--))
media=$(($media/$val))
printf "${CYAN}\n\nMax: $alta${DEF_COLOR}\n"
printf "${CYAN}Min: $baja${DEF_COLOR}\n"
printf "${CYAN}Average: $media${DEF_COLOR}\n"
printf	"${WHITE}\n\nTest ${DEF_COLOR}${GREEN}[5/5] ${WHITE}$res_1/$val"
if [ $res_1 == $val ]; then
	printf "${GREEN} Congrats , all tests have been completed successfully 🥳✅"
	echo OK >> traces.txt
fi
if [ $res_2 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${YELLOW}[4/5] ${WHITE}$res_2/$val"
fi
if [ $res_3 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[3/5] ${WHITE}$res_3/$val"
fi
if [ $res_4 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[2/5] ${WHITE}$res_4/$val"
fi
if [ $res_5 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[1/5] ${WHITE}$res_5/$val\n"
fi
if [ $res_err != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[NO SORTED] ${WHITE}$res_err/$val\n"
fi
if [ $res_1  != $val ]; then
	printf "${CYAN}\nCheck traces $PWD/traces.txt\n"
fi

printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t  Multiple size <= 500\t\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

echo Multiple size '<'= 500 >> traces.txt

res_1=0
res_2=0
res_3=0
res_4=0
res_5=0
val=201
media=0
control=1
alta=0
baja=2147483647
if [ $2 > 0 ]; then
	val=$2
fi
((val++))
cont=1
while [ $cont -lt $val ]
do
ARG=$(seq -250 249 | shuf | tr '\n' ' ');
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}$cont .[OK]${DEF_COLOR}";
	control=2
else
	printf "${RED}$cont .[KO]${DEF_COLOR}";
	control=3
fi
N=$(./push_swap $ARG | wc -l)
if [ $N -gt $alta ]; then
	alta=$(($N))
fi
if [ $N -lt $baja ]; then
	baja=$(($N))
fi
if [ $N -gt 700 ] || [ $N -eq 700 ]; then
	echo TEST $cont ARG:"$ARG" >> traces.txt
fi
if [ $N -lt 5500 ] && [ $control -eq 2 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
  media=$(($media+$N))
	((res_1++))
elif [ $N -gt 5500 ] || [ $N -eq 5500 ] && [ $N -lt 7000 ] && [ $control -eq 2 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_2++))
elif [ $N -gt 7000 ] || [ $N -eq 7000 ] && [ $N -lt 8500 ] && [ $control -eq 2 ]; then
	printf "${RED}[OK][3/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_3++))
elif [ $N -gt 8500 ] || [ $N -eq 8500 ] && [ $N -lt 10000 ] && [ $control -eq 2 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_4++))
elif [ $N -gt 11500 ] || [ $N -eq 11500 ] && [ $control -eq 2 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	if [ $N -gt $alta ]; then
		alta=$(($N))
	fi
	if [ $N -lt $baja ]; then
		baja=$(($N))
	fi
	media=$(($media+$N))
	((res_5++))
elif [ $control -eq 3 ]; then
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	echo TEST $cont ARG:"$ARG" >> traces.txt
fi
((cont++))
done

((val--))
media=$(($media/$val))
printf "${CYAN}\n\nMax move: $alta${DEF_COLOR}\n"
printf "${CYAN}Min move: $baja${DEF_COLOR}\n"
printf "${CYAN}Average: $media${DEF_COLOR}\n"
printf	"${WHITE}\n\nTest ${DEF_COLOR}${GREEN}[5/5] ${WHITE}$res_1/$val"
if [ $res_1 == $val ]; then
	printf "${GREEN} Congrats , all tests have been completed successfully 🥳✅"
	echo OK >> traces.txt
fi
if [ $res_2 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${YELLOW}[4/5] ${WHITE}$res_2/$val"
fi
if [ $res_3 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[3/5] ${WHITE}$res_3/$val"
fi
if [ $res_4 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[2/5] ${WHITE}$res_4/$val"
fi
if [ $res_5 != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[1/5] ${WHITE}$res_5/$val\n"
fi
if [ $res_err != 0 ]; then
printf	"${WHITE}\nTest ${DEF_COLOR}${RED}[NO SORTED] ${WHITE}$res_err/$val\n"
fi
if [ $res_1  != $val ]; then
	printf "${CYAN}\nCheck traces $PWD/traces.txt\n"
fi

printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t  Order nums\t\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

ARG="";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}1. [OK]${DEF_COLOR}";
else
	printf "${RED}1. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1 2 3 4 5 6 7 8 9";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}2. [OK]${DEF_COLOR}";
else
	printf "${RED}2. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1 2 3";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}3. [OK]${DEF_COLOR}";
else
	printf "${RED}3. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}4. [OK]${DEF_COLOR}";
else
	printf "${RED}4. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="0 1 2 3 4";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}5. [OK]${DEF_COLOR}";
else
	printf "${RED}5. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1 2";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}6. [OK]${DEF_COLOR}";
else
	printf "${RED}6. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}7. [OK]${DEF_COLOR}";
else
	printf "${RED}7. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="6 7 8";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}8. [OK]${DEF_COLOR}";
else
	printf "${RED}8. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="2147483645 2147483646 2147483647";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}9. [OK]${DEF_COLOR}";
else
	printf "${RED}9. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="-2147483648 -2147483647 -2147483646";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}10. [OK]${DEF_COLOR}";
else
	printf "${RED}10. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}11. [OK]${DEF_COLOR}";
else
	printf "${RED}11. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

ARG="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77";
N=$(./push_swap $ARG | wc -l)
if [ $N -eq 0 ]; then
	printf "${GREEN}12. [OK]${DEF_COLOR}";
else
	printf "${RED}12. [KO]${DEF_COLOR}";
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}\n";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}\n";
fi

printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t  Random test with big nums\t\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

ARG=$(seq -2147483648 -2147483149 | shuf | tr '\n' ' ')
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq -2147483648 -2147483149 | shuf | tr '\n' ' ')
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 498 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 497 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 497 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq -1 498 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 5000 5499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 50000 50499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 50000 50499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 500000 500499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 5000000 5000499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 50000000 50000499 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 0 450 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 250 720 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 10000 10479 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 100 450 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq -500 -50 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq -500 -9 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

ARG=$(seq 100 599 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
if [ $N -lt 5500 ]; then
	printf "${GREEN}[OK][5/5]${DEF_COLOR}";
elif [ $N -gt 5500 ] && [ $N -lt 7000 ]; then
	printf "${YELLOW}[OK][4/5]${DEF_COLOR}";
elif [ $N -gt 7000 ] && [ $N -lt 8500 ]; then
	printf "${RED}[KO][3/5]${DEF_COLOR}";
elif [ $N -gt 8500 ] && [ $N -lt 10000 ]; then
	printf "${RED}[KO][2/5]${DEF_COLOR}";
elif [ $N -gt 11500 ]; then
	printf "${RED}[KO][1/5]${DEF_COLOR}";
fi
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN} [OK]${DEF_COLOR}\n";
else
	printf "${RED} [KO]${DEF_COLOR}\n";
fi

printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${BLUE}"\n\t\t  All size test + leaks check\t\n"${DEF_COLOR};
printf ${BLUE}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

echo All size test >> traces.txt

printf "\n${WHITE}⚠️ This test is very long. It is recommended to use it only when the project is finished or in an evaluation ⚠️${DEF_COLOR}\n\n\n";

sleep 1

res_1=0
res_2=0
res_3=0
res_4=0
cont=1
cont2=1
cont3=1
cont4=0
while [ $cont2 -lt 501 ]
do
cont=1
while [ $cont -lt 6 ]
do
ARG=$(seq 0 $cont2 | shuf | tr '\n' ' ');
N=$(./push_swap $ARG | wc -l)
S=$(./push_swap $ARG | ./checker_linux $ARG)
if [ $S == "OK" ]; then
	printf "${GREEN}$cont3 .[OK]${DEF_COLOR}";
	((cont2++))
	printf	"${MAGENTA} Num args: $cont2 ${DEF_COLOR}"
	((cont2--))
	printf "${CYAN} Moves:$N${DEF_COLOR}\n";
	((res_1++))
else
	printf "${RED}$cont3 .[KO]${DEF_COLOR}\n";
	echo TEST $cont ARG:"$ARG" >> traces.txt
	((res_2++))
fi
if [ $cont -eq 5 ]; then

R=$(valgrind --leak-check=full ./push_swap $ARG > /dev/null 2>&1)
R=$?
((cont4++))
if [[ $R == 0 ]]; then
  printf "${GREEN}$cont3 [MEMORY OK] ${DEF_COLOR}\n";
  ((res_3++))
else
  printf "${RED}$cont3 [KO LEAKS] ${DEF_COLOR}\n";
  echo TEST LEAKS $cont ARG:"$ARG" >> traces.txt
  ((res_4++))
fi
fi
((cont++))
((cont3++))
done
((cont2++))
done

((cont3--))

if [ $res_1 == $cont3 ]; then
	printf "${GREEN}\nCongrats , all tests have been completed successfully 🥳✅\n"
	echo OK >> traces.txt
fi
if [ $res_2 != 0 ]; then
printf	"${GREEN}\nOK${WHITE} TESTS $res_1/$cont3\n"
printf	"${RED}\nKO${WHITE} TESTS $res_2/$cont3\n"
printf "${CYAN}\nCheck traces $PWD/traces.txt\n"
fi

if [ $res_4 != 0 ]; then
printf	"${GREEN}\nOK${WHITE} TESTS $res_3/$cont4\n"
printf	"${RED}\nKO${WHITE} TESTS $res_4/$cont4\n"
printf "${CYAN}\nCheck traces $PWD/traces.txt\n"
fi

else

FILE=$PWD/checker

if [ -f "$FILE" ]; then
	echo -n
else
	printf "${RED}NO EXIST CHECKER PROGRAM${DEF_COLOR}\n";
	exit 0
fi

printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t\t  BONUS\t\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

printf ${MAGENTA}"\n-------------------------------------------------------------\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t\tCONTROL ERRORS\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

./checker "a" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}1.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}1.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}1.[KO] ${DEF_COLOR}\n";
fi


./checker "111a11" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}2.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}2.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}2.[KO] ${DEF_COLOR}\n";
fi


./checker "hello world" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}3.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}3.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}3.[KO] ${DEF_COLOR}\n";
fi


./checker "" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}4.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}4.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}4.[KO] ${DEF_COLOR}\n";
fi

./checker "0 0" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}5.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}5.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}5.[KO] ${DEF_COLOR}\n";
fi

./checker "111-1 2 -3" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}7.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}7.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}7.[KO] ${DEF_COLOR}\n";
fi

./checker "-3 -2 -2" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}8.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}8.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}8.[KO] ${DEF_COLOR}\n";
fi

./checker "\n" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}9.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}9.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}9.[KO] ${DEF_COLOR}\n";
fi

./checker "-2147483649" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}10.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}10.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}10.[KO] ${DEF_COLOR}\n";
fi

./checker "-2147483650" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}11.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}11.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}11.[KO] ${DEF_COLOR}\n";
fi

./checker "2147483648" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}12.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}12.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}12.[KO] ${DEF_COLOR}\n";
fi

./checker "8 "9 1" 12" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}13.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}13.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}13.[KO] ${DEF_COLOR}\n";
fi

./checker "10 -1 -2 -3 -4 -5 -6 90 99 10" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}14.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}14.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}14.[KO] ${DEF_COLOR}\n";
fi

./checker "1 +1 -1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}15.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}15.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}15.[KO] ${DEF_COLOR}\n";
fi

./checker "3333-3333 1 4" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}16.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}16.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}16.[KO] ${DEF_COLOR}\n";
fi

./checker "111a111 -4 3" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}17.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}17.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}17.[KO] ${DEF_COLOR}\n";
fi

./checker "111111 "-4 3"" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}18.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}18.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}18.[KO] ${DEF_COLOR}\n";
fi

./checker "2147483649" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}19.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}19.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}19.[KO] ${DEF_COLOR}\n";
fi

./checker "2147483647+1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}20.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}20.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}20.[KO] ${DEF_COLOR}\n";
fi

./checker "0 1 2 3 4 5 0" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}21.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}21.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}21.[KO] ${DEF_COLOR}\n";
fi

./checker "3 +3" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}22.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}22.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}22.[KO] ${DEF_COLOR}\n";
fi

./checker "3+3" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}23.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}23.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}23.[KO] ${DEF_COLOR}\n";
fi

./checker "42 42" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}24.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}24.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}24.[KO] ${DEF_COLOR}\n";
fi

./checker "42 " -42" " 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}25.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}25.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}25.[KO] ${DEF_COLOR}\n";
fi

./checker "4222-4222" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}26.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}26.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}26.[KO] ${DEF_COLOR}\n";
fi

./checker "99999999999999999999999999" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}27.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}27.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}27.[KO] ${DEF_COLOR}\n";
fi

./checker "-99999999999999999999999999" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}28.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}28.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}28.[KO] ${DEF_COLOR}\n";
fi

./checker "0 -0 1 -1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}29.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}29.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}29.[KO] ${DEF_COLOR}\n";
fi

./checker "0 +0 1 -1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}30.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}30.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}30.[KO] ${DEF_COLOR}\n";
fi

./checker "111+111 -4 3" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}31.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}31.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}31.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./checker "-" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}32.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}32.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}32.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./checker "+" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}33.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}33.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}33.[KO] ${DEF_COLOR}\n";
fi

./checker "--123 1 321" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}34.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}34.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}34.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./checker "++123 1 321" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}35.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}35.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}35.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./checker "09 9 3 -1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}36.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}36.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}36.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./checker "00000001 1 9 3" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}37.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}37.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}37.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

./checker "-5 00000003 003 9 1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
  	printf "${GREEN}38.[OK] ${DEF_COLOR}\n";
  else
  	printf "${RED}38.[KO] ${DEF_COLOR}\n";
  	break
  fi
done < test_check.txt
else
	printf "${RED}38.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

echo -e "saa" | ./checker "1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}39.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}39.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}39.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

echo -e "sa\n" | ./checker "1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}40.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}40.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}40.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

echo -e "SA" | ./checker "1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}41.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}41.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}41.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

echo -e "sa " | ./checker "1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}42.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}42.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}42.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt

echo -e "" | ./checker "1" 2> test_check.txt > /dev/null
if [ -s "$FICHERO" ];then
while IFS= read -r line
do
  if [[ $line == "Error" ]]; then
    printf "${GREEN}43.[OK] ${DEF_COLOR}\n";
  else
    printf "${RED}43.[KO] ${DEF_COLOR}\n";
    break
  fi
done < test_check.txt
else
  printf "${RED}43.[KO] ${DEF_COLOR}\n";
fi

rm -rf test_check.txt


# Checkear nombres de funciones diferentes
printf ${MAGENTA}"\n-------------------------------------------------------------\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t\tCheck operations\t\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

#pruebas SA
ARG="2 1 3";
S=$(echo -e "sa" | ./checker_linux $ARG)
R=$(echo -e "sa" | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}1.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}1.[KO] ${DEF_COLOR}\n";
fi

#pruebas SB
ARG="2 1 3 4";
S=$(echo -e "pb\npb\nsb\npa\npa" | ./checker_linux $ARG)
R=$(echo -e "pb\npb\nsb\npa\npa" | ./checker $ARG)
if [ $S == $R ]; then
  printf "${GREEN}2.[OK] ${DEF_COLOR}\n";
else
  printf "${RED}2.[KO] ${DEF_COLOR}\n";
fi

#pruebas SS
ARG="2 1 4 3";
S=$(echo -e "pb\npb\nss\npa\npa" | ./checker_linux $ARG)
R=$(echo -e "pb\npb\nss\npa\npa" | ./checker $ARG)
L=$(echo -e "pb\npb\nss\npa\npa" | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
L=$?
if [ $S == $R ]; then
  printf "${GREEN}3.[OK] ${DEF_COLOR}";
else
  printf "${RED}3.[KO]${DEF_COLOR}";
fi
if [[ $L == 0 ]]; then
  printf "${GREEN}[MEMORY OK] ${DEF_COLOR}\n";
else
  printf "${RED}[KO LEAKS] ${DEF_COLOR}\n";
fi

#pruebas RA
ARG="2 1";
S=$(echo -e "ra" | ./checker_linux $ARG)
R=$(echo -e "ra" | ./checker $ARG)
if [ $S == $R ]; then
  printf "${GREEN}4.[OK] ${DEF_COLOR}\n";
else
  printf "${RED}4.[KO] ${DEF_COLOR}\n";
fi

#pruebas RA
ARG="100 101 1 2 3 4 5 6 7 8 9 10 11 12 13 14";
S=$(echo -e "ra\nra" | ./checker_linux $ARG)
R=$(echo -e "ra\nra" | ./checker $ARG)
if [ $S == $R ]; then
  printf "${GREEN}5.[OK] ${DEF_COLOR}\n";
else
  printf "${RED}5.[KO] ${DEF_COLOR}\n";
fi

#pruebas de todo
ARG="1";
S=$(echo -e "sa\nsb\nss\npa\npb\npa\npb\nsb\npa\nra\nrb\nrr\nrra\nrrb\nrrr" | ./checker_linux $ARG)
R=$(echo -e "sa\nsb\nss\npa\npb\npa\npb\nsb\npa\nra\nrb\nrr\nrra\nrrb\nrrr" | ./checker $ARG)
L=$(echo -e "sa\nsb\nss\npa\npb\npa\npb\nsb\npa\nra\nrb\nrr\nrra\nrrb\nrrr" | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
L=$?
if [ $S == $R ]; then
  printf "${GREEN}6.[OK] ${DEF_COLOR}";
else
  printf "${RED}6.[KO] ${DEF_COLOR}";
fi
if [[ $L == 0 ]]; then
  printf "${GREEN}[MEMORY OK] ${DEF_COLOR}\n";
else 
  printf "${RED}[KO LEAKS] ${DEF_COLOR}\n";
fi

printf ${MAGENTA}"\n-------------------------------------------------------------\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t\tBasic Input\t\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

ARG="2 1";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}1.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}1.[KO]${DEF_COLOR}\n";
fi

ARG="2 1 3";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}2.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}2.[KO]${DEF_COLOR}\n";
fi

ARG="1 3 2";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}3.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}3.[KO]${DEF_COLOR}\n";
fi

ARG="2 3 1";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}4.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}4.[KO]${DEF_COLOR}\n";
fi

ARG="3 2 1";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}5.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}5.[KO]${DEF_COLOR}\n";
fi

ARG="3 1 2";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}6.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}6.[KO]${DEF_COLOR}\n";
fi


ARG="4 3 2 1";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}7.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}7.[KO]${DEF_COLOR}\n";
fi

ARG="4 2 1 3";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}8.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}8.[KO]${DEF_COLOR}\n";
fi

ARG="4 3 1 2";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}9.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}9.[KO]${DEF_COLOR}\n";
fi

ARG="3 2 1 4";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}10.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}10.[KO]${DEF_COLOR}\n";
fi

printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t\tSize 5\t\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

ARG="2 1 3 4 5";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}1.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}1.[KO]${DEF_COLOR}\n";
fi

ARG="5 4 3 2 1";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}2.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}2.[KO]${DEF_COLOR}\n";
fi

ARG="5 4 1 2 3";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}3.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}3.[KO]${DEF_COLOR}\n";
fi

ARG="5 4 3 1 2";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}4.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}4.[KO]${DEF_COLOR}\n";
fi

ARG="4 5 3 1 2";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}5.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}5.[KO]${DEF_COLOR}\n";
fi

ARG="3 2 1 5 4";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}6.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}6.[KO]${DEF_COLOR}\n";
fi


ARG="1 2 3 5 4";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}7.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}7.[KO]${DEF_COLOR}\n";
fi

ARG="2 1 4 5 3";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}8.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}8.[KO]${DEF_COLOR}\n";
fi

ARG="1 3 2 5 4";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}9.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}9.[KO]${DEF_COLOR}\n";
fi

ARG="2 3 4 5 1";
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}10.[OK] ${DEF_COLOR}\n";
else
	printf "${RED}10.[KO]${DEF_COLOR}\n";
fi

rm -rf 0
rm -rf test_check.txt

printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t  Multiple size <= 100\t\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

echo BONUS-Multiple size '<'= 100 >> traces.txt

val=101

if [ $2 ]; then
	val=$(($2+1))
fi
res_1=0
res_2=0
cont=1
while [ $cont -lt $val ]
do
ARG=$(seq 0 99 | shuf | tr '\n' ' ')
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ] && [ $R == "OK" ]; then
	printf "${GREEN}$cont .[OK] ${DEF_COLOR}";
	((res_1++))
else
	printf "${RED}$cont .[KO] ${DEF_COLOR}";
	echo TEST $cont ARG:"$ARG" >> traces.txt
	((res_2++))
fi
((cont++))
done

echo

((val--))
if [ $res_1 == $val ]; then
	printf "${GREEN}\nCongrats , all tests have been completed successfully 🥳✅\n"
	echo OK >> traces.txt
fi
if [ $res_2 != 0 ]; then
printf	"${GREEN}\nOK${WHITE} TESTS $res_1/$val${DEF_COLOR}\n"
printf	"${RED}\nKO${WHITE} TESTS $res_2/$val${DEF_COLOR}\n"
printf "${CYAN}\nCheck traces $PWD/traces.txt${DEF_COLOR}\n"
fi

rm -rf 0
rm -rf test_check.txt

printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t  Multiple size <= 500\t\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

echo BONUS-Multiple size '<'= 500 >> traces.txt

val=101

if [ $2 ]; then
	val=$(($3+1))
fi

res_1=0
res_2=0
cont=1
while [ $cont -lt $val ]
do
ARG=$(seq 0 499 | shuf | tr '\n' ' ');
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ] && [ $R == "OK" ]; then
	printf "${GREEN}$cont .[OK] ${DEF_COLOR}";
	((res_1++))
else
	printf "${RED}$cont .[KO] ${DEF_COLOR}";
	echo TEST $cont ARG:"$ARG" >> traces.txt
	((res_2++))
fi
((cont++))
done

echo

((val--))
if [ $res_1 == $val ]; then
	printf "${GREEN}\nCongrats , all tests have been completed successfully 🥳✅\n"
	echo OK >> traces.txt
fi
if [ $res_2 != 0 ]; then
printf	"${GREEN}\nOK${WHITE} TESTS $res_1/$val\n"
printf	"${RED}\nKO${WHITE} TESTS $res_2/$val\n"
printf "${CYAN}\nCheck traces $PWD/traces.txt\n"
fi

rm -rf 0
rm -rf test_check.txt

printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};
printf ${MAGENTA}"\n\t\t  All size test + leaks check\t\n"${DEF_COLOR};
printf ${MAGENTA}"\n-------------------------------------------------------------\n\n"${DEF_COLOR};

echo BONUS-All size test >> traces.txt

val=500
res_1=0
res_2=0
cont=1
var=0
while [ $cont -lt $val ] && [ $var -lt 500 ]
do
ARG=$(seq 0 $var | shuf | tr '\n' ' ');
var=$(($var + 1))
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}$cont .[OK] ${DEF_COLOR}";
	((res_1++))
else
	printf "${RED}$cont .[KO] ${DEF_COLOR}";
	echo TEST $cont ARG:"$ARG" >> traces.txt
 	((res_2++))
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}";
fi
echo
((cont++))
done

while [ $var -lt 1000 ]
do
ARG=$(seq 0 $var | shuf | tr '\n' ' ');
var=$(($var + 25))
S=$(./push_swap $ARG | ./checker_linux $ARG)
R=$(./push_swap $ARG | ./checker $ARG)
if [ $S == $R ]; then
	printf "${GREEN}$cont .[OK] ${DEF_COLOR}";
	((res_1++))
else
	printf "${RED}$cont .[KO] ${DEF_COLOR}";
	echo TEST $cont ARG:"$ARG" >> traces.txt
 	((res_2++))
fi
R=$(./push_swap $ARG | valgrind --leak-check=full ./checker $ARG > /dev/null 2>&1)
R=$?
if [[ $R == 0 ]]; then
  printf "${GREEN}[MOK] ${DEF_COLOR}";
else
  printf "${RED} [KO LEAKS] ${DEF_COLOR}";
fi
echo
((cont++))
done

((cont--))
echo

val=$(($val+$var))

((val--))
if [ $res_1 == $cont ]; then
	printf "${GREEN}\nCongrats , all tests have been completed successfully 🥳✅\n"
	echo OK >> traces.txt
fi
if [ $res_2 != 0 ]; then
printf	"${GREEN}\nOK${WHITE} TESTS $res_1/$cont\n"
printf	"${RED}\nKO${WHITE} TESTS $res_2/$cont\n"
printf "${CYAN}\nCheck traces $PWD/traces.txt\n"
fi

fi

rm -rf 0
rm -rf test_check.txt
