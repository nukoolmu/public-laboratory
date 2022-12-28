#!/bin/bash
result(){
    echo "You score is : ${1}, Grade is : ${2}"
    SUM_GRADE_DIGIT=$((SUM_GRADE_DIGIT+$3))
}

grade_cal(){
    if [ $iscore -ge 90 ];then
        result "${iscore}" "A" "4" 
    elif [ $iscore -ge 80 ];then
        result "${iscore}" "B" "3" 
    elif [ $iscore -ge 70 ];then
        result "${iscore}" "C" "2" 
    elif [ $iscore -ge 50 ];then
        result "${iscore}" "D" "1" 
    else
        result "${iscore}" "F" "0"
    fi 
}

read -p "Plase Enter you Score : "  SCORE
read -a SCORE_COUNTER <<< $SCORE

for iscore in ${SCORE};do
    if [[ ! $iscore =~ ^[0-9]+$ || $iscore -lt 0 || $iscore -gt 100 ]];then
         echo "invalid score plase enter only integer between 0-100" 
    else   
        grade_cal  
    fi
done

GPA="$(echo $SUM_GRADE_DIGIT/${#SCORE_COUNTER[@]}|bc -l)"
printf "Your GPA is : %.2f\n" $GPA