Please make sure that you are using Ruby 3.2.0 or higher version in your environment.

Execute the following command in the root of the project
```
ruby -r webrick -e "WEBrick::HTTPServer.new(:Port => 8080, :DocumentRoot => Dir.pwd).start"
```

You can access the site from your browser at `http://localhost:8080`