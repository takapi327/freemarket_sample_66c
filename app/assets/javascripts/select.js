$(function(){

  function buildHTML(){
    let html = `<div class="category_sub1">
                <div action="" class="select-box box" name="form1">
                  <select id="select2">
                    <option value="">---</option>
                    <option value="13">トップス</option>
                    <option value="14">ジャケット/アウター</option>
                    <option value="15">パンツ</option>
                    <option value="16">スカート</option>
                    <option value="17">ワンピース</option>
                    <option value="18">靴</option>
                    <option value="19">ルームウェア/パジャマ</option>
                    <option value="20">レッグウェア</option>
                    <option value="21">帽子</option>
                    <option value="22">バッグ</option>
                    <option value="23">アクセサリー</option>
                    <option value="24">ヘアアクセサリー</option>
                    <option value="25">小物</option>
                    <option value="26">時計</option>
                    <option value="27">ウィッグ/エクステ</option>
                    <option value="28">浴衣/水着</option>
                    <option value="29">スーツ/フォーマル/ドレス</option>
                    <option value="30">マタニティ</option>
                    <option value="31">その他</option>
                  </select>
                </div>
                </div>
                <div id="sub"></div>`
    return html;
  }

  $("#select1").change(function(e){
    e.preventDefault()

    let val = $('option:selected').val();
    let html = buildHTML();
    if(val == 1){
      $("#add").addClass("select")
      $(".select").append(html)
    }else{
      $(".category_sub1").remove()
      $(".select").removeClass("select");
      $("#sub").remove()
    }

  });
});