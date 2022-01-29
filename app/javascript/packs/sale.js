// $(function () {
//   console.log("hello hello");
// });

$( function() {
  var places = ['asdf','品川','有楽町','浜松町','江戸川'];
  $( '#client_name' ).autocomplete({
      autoFocus: true,  //テキストフィールドの値をフォーカスされたアイテムの値で置き換える
      source: places,  //サジェストのデータを呼び出す
      minLength: 1  //オートコンプリートが動作する文字数を指定
  });
});