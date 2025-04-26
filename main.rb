require 'wasm_drb'

# サーバーに接続
DRb.start_service
remote = DRbObject.new_with_uri('drbws://localhost:8787')

# コメント送信処理
def submit_comment
  input = JS.global[:document].getElementById("comment")
  text = input[:value]
  input[:value] = ""

  remote = DRbObject.new_with_uri('drbws://localhost:8787')
  remote.add(text)
end

# コメント一覧更新処理
def update_comments
  remote = DRbObject.new_with_uri('drbws://localhost:8787')
  comments = remote.comments

  list = JS.global[:document].getElementById("comments")
  list.innerHTML = ""

  comments.each do |comment|
    li = JS.global[:document].createElement("li")
    li.innerText = comment
    list.appendChild(li)
  end
end

# 3秒おきにコメント一覧を更新
Thread.new do
  loop do
    update_comments
    sleep 3
  end
end