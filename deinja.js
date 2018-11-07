const validate = require("./validate");
const map = require("./map");

const xxx = (pre, newValues) => {
  const newWords = [];
  for (let i = 0; i < newValues.length; i++) {
    const word = pre + newValues[i];
    if (validate(word)) {
      newWords.push(word);
    }
  }
  return newWords;
};

const deinja = word => {
  const result = [];
  for (let i = 0; i < word.length; i++) {
    const part = word.substring(i);
    const newValues = map[part];
    if (newValues) {
      const pre = word.substring(0, i);
      const newWords = xxx(pre, newValues);
      result.push(...newWords);
    }
  }
  return result;
};

// 美しくありませんでした -> [美しくありる [2], 美しくある [1], 美しい [6]]

//console.info(deinja("来ました"));
console.info(deinja("美しくありませんでした"));
//console.info(deinja("食べたければ"));
