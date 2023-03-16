const jsonDiff = require("json-diff");
const fs = require("fs-extra")
const path = require("path");
const jsonSort = (json) => {
    if (json) {
        const flattenDataValues = (data) => {
            const flattenedObject = new Object();
            Object.keys(data).sort().forEach(key => {
                const value = data[key];
                if (Array.isArray(value)) {
                    flattenedObject[key] = value.map(flattenDataValues);
                } else {
                    flattenedObject[key] = value;
                }
            });
            return flattenedObject;
        };
        if (Array.isArray(json)) {
            return json.sort().map(flattenDataValues);
        } else {
            return flattenDataValues(json);
        }
    }
    return json
}

console.log(jsonDiff.diffString(
    jsonSort(fs.readJSONSync(path.resolve(__dirname, './a.json'))),
    jsonSort(fs.readJSONSync(path.resolve(__dirname, './b.json'))),
    {color: false}
));