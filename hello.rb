require 'sinatra' # require引入 檔案（模組化）
# 要先gem install sinatra
# gem install puma -v 6.0.0 ＃沒安裝的話會用WEBrick來跑
# 瀏覽器http://localhost:4567/
require 'sinatra/reloader' if development? 
# 流程控制倒裝句 ＃如果在開發模式下，才引入此套件（效能較差） # reloader可協助重新載入之套件

get '/' do # 遇到根目錄時
    "你好Hello World #{(1..43).to_a.sample}" # Rack三元素中的 HTML body ＃免寫state與header
end
# 每次更新完程式碼 都要control c 中斷 ruby hello.rb，再重啟 ruby hello.rb，重新整理，才會有效果
# ruby hello.rb：請ruby來執行hello.rb檔

# 用sinatra-contrib套件(輔助、協力套件)就不用 每次更新完程式碼 都要control c 中斷 ruby hello.rb，再重啟 ruby hello.rb，重新整理，才會有效果
# gem install sinatra-contrib

get '/hello.php' do # 網址為/hello.php時 ＃sinatra會來這裡看路徑，顯示對應的HTML body，所以這裡寫的路徑雖然.php，但跟他是用什麼語言寫的，其實無關，路徑名稱可以隨便取
    "I am not php!" # Rack三元素中的 HTML body
end

get '/cats' do
    "All cats!!"
end

get '/cats/:id' do
    "you picked No. #{params[:id]} cat" # params[:id]會產生一個Hash，並去找出:id key所對應的value
end 