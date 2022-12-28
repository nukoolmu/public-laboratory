#!/bin/bash
result(){
    echo "You score is : ${1}, Grade is : ${2}"
    SUM_GRADE_DIGIT=$((SUM_GRADE_DIGIT+$3))
}
read -p "Plase Enter you Score : "  SCORE
read -a SCORE_COUNTER <<< $SCORE

for iscore in ${SCORE};do
    case $iscore in
        [9][0-9]|100) result "$iscore" "A" "4" ;;
        [8][0-9]) result "$iscore" "B" "3" ;;
        [7][0-9]) result "$iscore" "C" "2" ;;
        [6][0-9]) result "$iscore" "D" "1" ;;
        [5][0-9]|[4][0-9]|[3][0-9]|[2][0-9]|[1][0-9]|[0-9]) result "$iscore" "F" "0" ;;
        *) echo "invalid score plase enter only integer between 0-100"  ;;
    esac
done

printf "Your GPA is : %.2f\n" "$((SUM_GRADE_DIGIT/${#SCORE_COUNTER[@]}))"