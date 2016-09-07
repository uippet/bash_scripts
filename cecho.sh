function cecho(){
#Цветовой вывод в консоле
#первый аргумент - цвет текста
#второй аргумент - цвет фона
#третий аргумент - опции (можно объединять): n - не переводить на новую строку, l - также выводить в лог файл $e_log_file, b - жирный текст
#остальные аргументы - выводимый текст

case $1 in
    "0" | "k" ) col=black; col='30';;
    "1" | "r" ) col=red; col='31';;
    "2" | "g" ) col=green; col='32';;
    "3" | "y" ) col=yellow; col='33';;
    "4" | "b" ) col=blue; col='34';;
    "5" | "m" ) col=magenta; col='35';;
    "6" | "c" ) col=cyan; col='36';;
    "7" | "w" ) col=white; col='37';;
    *   ) col=white; col='37';;
esac

case $2 in
    "0" | "k" ) fon=black; fon='40';;
    "1" | "r" ) fon=red; fon='41';;
    "2" | "g" ) fon=green; fon='42';;
    "3" | "y" ) fon=yellow; fon='43';;
    "4" | "b" ) fon=blue; fon='44';;
    "5" | "m" ) fon=magenta; fon='45';;
    "6" | "c" ) fon=cyan; fon='46';;
    "7" | "w" ) fon=white; fon='47';;
        *   ) fon=black; fon='40';;
esac

if [[ `echo $3 | grep "b" | wc -l` = "1" ]]; then.
    sbold="\033[1m"
    ebold="\033[0m"
else
    sbold=""
    ebold=""
fi

if [[ `echo $3 | grep "n" | wc -l` = "1" ]]; then.
    nobr="-n"
else
    nobr=""
fi

if [[ `echo $3 | grep "l" | wc -l` = "1" ]]; then.
    logg=true
else
    logg=""
fi

shift
shift
shift

color='\E['"$col"';'"$fon"'m'
[[ $logg ]] && echo -e $nobr "$color$sbold$@$ebold" | tee -a $e_log_file || echo -e $nobr "$color$sbold$@$ebold"
tput sgr0
}

cecho r k b "Test"
cecho g k 0 "Test"
cecho b k l "Test"
cecho c k b "Test"
cecho m k b "Test"
cecho y k b "Test"
cecho w k b "Test"
cecho k r 0 "Test"
cecho k g 0 "Test"
cecho k b 0 "Test"
cecho k c 0 "Test"
cecho k m 0 "Test"
cecho k y 0 "Test"
cecho k w 0 "Test"
cecho r b nb "Test"
cecho c k nb "Test"
cecho y y lb "Test"
