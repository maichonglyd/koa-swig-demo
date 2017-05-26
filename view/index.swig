<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <script src="/js/jquery.min.js" type="text/javascript"></script>
  <script src="/js/bootstrap.min.js" type="text/javascript"></script>
  <title>脉冲云NodeDemo</title>
</head>
<body>
  <div class="container">
    <div class="form-group">
      <label class="control-label col-xs-12" style="font-size: 30px;padding-bottom: 10px">脉冲云</label>
    </div>
      <div class="form-group add-block">
        <div class="col-xs-10">
          <input id="addInput" type="text" class="form-control">
        </div>
        <a id="addBtn" class="btn btn-primary col-xs-2">添加</a>
      </div>
    {% for item in list %}
        <div class="form-group item-block">
          <label class="control-label col-xs-10 label-n">{{ item }}</label>
          <a href="/remove?title={{ item }}" class="btn btn-danger col-xs-2">删除</a>
        </div>
    {% endfor %}
  </div>
<script>
  var addBtn = document.getElementById('addBtn');
  var addInput = document.getElementById('addInput');
  addBtn.addEventListener('click',function(){
    console.log(addInput.value);
    location.href = '/plus?title=' + addInput.value;
  });
</script>
</body>
</html>
