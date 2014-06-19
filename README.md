#PairedCodingApp

* PairedCodingApp is a Ruby on Rails app for programmers of different levels to virtually code together

* It uses Devise for authentication, carrierwave for image upload, and sandboxed to safely evaluate Ruby code. It also uses the jquery-ace-rails gem to embed the Ace Code Editor into divs.

* There are 3 models: document, friendship, and user. 

![](http://i.imgur.com/PEzlAvY.png)

If you would like to run PairedCodingApp locally, just clone this repo:

```
git clone https://github.com/stevenmiller888/PairedCodingApp.git
```

Run bundle install:

```
bundle install
```

And start the server:

```
rails s
```

