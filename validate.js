const INVALID_INFLECTIONS = [
  "あつ",
  "あぐ",
  "あす",
  "あず",
  "あぬ",
  "あふ",
  "あぶ",
  "いつ",
  "えつ",
  "きう",
  "くなかう",
  "くなかる",
  "させられる",
  "しつ",
  "しう",
  "じう",
  "じつ",
  "たいる",
  "たかつ",
  "たくなう",
  "ちゃつ",
  "てう",
  "てつ",
  "っつ",
  "ってる",
  "です",
  "ないる",
  "なかつ",
  "なさう",
  "さいる",
  "ましる",
  "っる",
  "べう",
  "べす",
  "べつ",
  "やつ",
  "らる",
  "んでしる"
];

module.exports = word => {
  let isValid = true;
  for (let i = 0; i < INVALID_INFLECTIONS.length; i++) {
    if (word.endsWith(INVALID_INFLECTIONS[i])) {
      isValid = false;
      break;
    }
  }
  return isValid;
};
