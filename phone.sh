#입력 인자가 없는 경우
if test $# -eq 0
then
	echo "Usage:phone searchfor[...searchfor]"
	echo "(You didn't tell me what you want to searach for.)"
#입력 인자가 있는 경우
else
#입력 인자가 한 개인 경우와 여러 개인 경우
#모든 인자를 다 붙여서 하나의 문자열로 만들어야 한다. 
#bash 에서 문자열을 붙이는 방법은
#변수="$변수$붙일문자열"
#and 로 처리할지 or 로 처리할지
#입력 받아 결정
	temp=$1

	if test $# -gt 1; then
		echo -n "input option: "
		read option

		for tmp in $@
		do
			if test "$tmp" != "$1" ; then
				if test "$option" = "or" ; then
					temp="$temp|$tmp"
				else
					temp="$temp.*$tmp"
				fi
			fi
		done
	fi
	egrep -i "($temp)" data > text
	awk -f awkfile.awk text 
	rm text
fi
			
