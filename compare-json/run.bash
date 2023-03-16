echo "" > out.txt

ls ./src/ |awk -F'_' '{print $1}'|uniq| while read iFile ;do

    echo "BEGIN $iFile" >> out.txt

    cat ./src/${iFile}_PREM.json >a.json
    cat ./src/${iFile}_CLOUD.json >b.json

    node index.js >> out.txt

    echo "END $iFile" >> out.txt
done