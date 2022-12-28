# Shell script Grade calculator หาค่าเกรดและเกรดเฉลี่ย จากชุดตัวเลขที่รับค่ามาจาก keybroad 

## run-with-if.bash ใช้ if-condition ในการกำหนดเงื่อนไข



```bash
result(){
    echo "You score is : ${1}, Grade is : ${2}"
    SUM_GRADE_DIGIT=$((SUM_GRADE_DIGIT+$3))
}

```
ประกาศ function สำหรับ display result เพื่อจะนำไป reuse code ในอนาคตโดยจะมีการรับค่า paramter `${1}` คือ ผลคะแนน `${2}` คือเกรดที่ถูกคำนวณแล้วในรูปแบบของตัวอักษร (alphabet) และ `${2}` คือเกรดที่ถูกคำนวณแล้ว ในรูปแบบของตัวเลขเพื่อจะนำไปคำนวณเกรดเฉลี่ย

`SUM_GRADE_DIGIT=$((SUM_GRADE_DIGIT+$3))` คือการเก็บผลรวมของ เกรดที่ถูกคำนวณแล้ว ในรูปแบบของตัวเลข สามารถใช้ `((SUM_GRADE_DIGIT=SUM_GRADE_DIGIT+$3))` หรือ `SUM_GRADE_DIGIT=$(expr SUM_GRADE_DIGIT+$3)` และ `SUM_GRADE_DIGIT=$(echo SUM_GRADE_DIGIT+$3|bc)` 

> หากใช้ bc จำเป็นต้อง install package bc ก่อนเสมอ

```bash
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
```

|SCORE|GRADE ALPHABET|GRADE DIGIT|
|---|---|---|
|90-100| A | 4 |
|80-89| B | 3 |
|70-79| C | 2 |
|60-69| D | 1 |
|0-59| F | 0 |
|Other| F | 0 |

`result "${iscore}" "B" "3" ` เป็นการเรียกใช้งาน function result โดยที่ function result หาก run program ด้วยคะแนน 80 function result จะแสดงผลออกมาเป็น `You score is : 80, Grade is : B`

```bash
read -p "Plase Enter you Score : "  SCORE
```
`read` เป็นคำสั่งในการรอรับค่าจาก keybroad โดย option `-p` คือการแสดงผลข้อความที่ต้องการ  ส่วนค่าที่รับเข้ามาจะถูกจัดเก็บในตัวแปรที่ชื่อว่า `SCORE`

> Plase Enter you Score :

> Plase Enter you Score : 80

```bash
echo $SCORE
```

> 80

หรือ 
> Plase Enter you Score : 80 90 10

```bash
echo $SCORE
```

> 80 90 10

หรือก็คือ `SCORE="80 90 10"`

```bash
read -a SCORE_COUNTER <<< $SCORE
```

คือการอ่านค่าจากตัวแปร `SCORE` ให้มาเก็บไว้ตัวแปร `SCORE_COUNTER` เพื่อจะหาค่า n เพื่อนำไปคำนวณเกรดเฉลี่ยจากสูตร avg=(sum/n)
สมมุติว่า `SCORE="80 90 10"` เมื่อแปลงค่าจากคำสั่งแล้วจะกลายเป็น `SCORE_COUNTER=(80 90 10)` 


```bash
for iscore in ${SCORE};do
    .
    .
    .
done
```
สร้าง loop จากจำนวนของชุดคะแนนที่รับค่าเข้ามา `( in ${SCORE})` เช่น 
> Plase Enter you Score : 80 90 10

โปรแกรมจะทำการวน loop 3 รอบโดยแต่ละรอบจะมีตัวแปร iscore เก็บค่าของคะแนนในแต่ล่ะรอบ

> Loop 1 : iscore = 80

> Loop 2 : iscore = 90

> Loop 3 : iscore = 10

```bash
    if [[ ! $iscore =~ ^[0-9]+$ || $iscore -lt 0 || $iscore -gt 100 ]];then
         echo "invalid score plase enter only integer between 0-100" 
    else   
        grade_cal  
    fi
```

เป็นการตรวจสอบว่าค่า `SCORE` ที่รับเข้ามาเป็นตัวเลข 0-100 หรือไม่ถ้าใช่ ก็นำไปคำนวณต่อแต่ถ้าไม่ใช่จะมีการแจ้งเตือนทางหน้าจอว่า `invalid score plase enter only integer between 0-100`

โดยมีการตัวสอบเงื่อนไขที่เป็นจริงว่า `SCORE` ต้องไม่ `(!)` ขึ้นต้น`(^)`ด้วยตัวเลขและลงท้าย`(+)`ด้วยตัวอักษร เช่น 9a 8f 7b `( $iscore =~ ^[0-9]+$)`  หรือ `(||)` `SCORE` ต้องไม่ `(!)` มีค่าต่ำกว่า 0 หรือตัวเลขติดลบ `( $iscore -lt 0)`   หรือ `(||)` `SCORE` ต้องไม่ `(!)` มีค่าสูงกว่า 100 `($iscore -gt 100)`

```bash
GPA="$(echo $SUM_GRADE_DIGIT/${#SCORE_COUNTER[@]}|bc -l)"
printf "Your GPA is : %.2f\n" $GPA
```
`printf` คือการแสดงผลออกมาทางหน้าจอคล้ายๆ `echo` option `%.2f` หมายถึงแปลงผลจำนวนเต็ม (integer) ไปเป็น ทศนิยม (float) 2 ตำแหน่ง `\n` คือ option ในการจัดการการขึ้นบรรทัดใหม่  `${#SCORE_COUNTER[@]}` คือการนับจำนวน array member 

> Plase Enter you Score : 80 90 10

`echo ${#SCORE_COUNTER[@]}`

> 3

`SUM_GRADE_DIGIT` คือผลรวมตัวเลขของเกรด SUM_GRADE_DIGIT=3+4+0, SUM_GRADE_DIGIT=7 และ `$((SUM_GRADE_DIGIT/${#SCORE_COUNTER[@]}))` คือ 7/3=2.333333