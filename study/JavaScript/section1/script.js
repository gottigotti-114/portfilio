//script.js

//シンプルソースコード
console.log("Hello World!!");

//変数宣言と基本例
let greeting = "こんにちは！javascript！";
console.log(greeting);

//様々なデータ型
let number = 5; //数値
const name = "JavaScript"; //文字列
let list = [1,2,3,4,5]; //配列
let user = { id: 1, username: "coder"}; //オブジェクト
console.log(user.id);
console.log(user.username);

//if文などを使った条件分岐
if (number > 3){
  console.log("number is greater than 3")
}

//for文等を使った繰り返し構文
for(let i = 0; i < list.length; i++){
  console.log("ListItem:",list[i]);
}

//関数
function greet(name){
  return "Hello" + name + "!";
}
console.log(greet("藤原さん"));

