# Ruby on Rails Tutorial (第２版) - 日本語訳

## はじめに

このリポジトリには、[Ruby on Rails Tutorial, 2nd edition](http://railstutorial.org/) を
翻訳するために必要なHTMLおよびCSSが含まれています。
現在、[Google Translator Toolkit](http://translate.google.com/toolkit/) と
[Facebook グループ](https://www.facebook.com/groups/japanese.railstutorial.org/) を用いて、
同書の日本語版を作成しています。

もし「翻訳手伝ってもいいよ！」って方がいれば、お気軽に次のグループにご参加下さい :D

- [Ruby on Rails Tutorial 翻訳グループ - Facebook](https://www.facebook.com/groups/japanese.railstutorial.org/)

なお、各章のラフな翻訳が終わり次第、随時次のページに反映させています。
もし誤字／脱字、誤訳などを見つけましたら、[@yasulab](http://twitter.com/yasulab) までご報告して頂けると幸いです。

- [Ruby on Rails Tutorial 第２版 - 日本語](http://railstutorial-ja.herokuapp.com/)

よろしくお願いします。

## Getting started

To translate the Ruby on Rails Tutorial, simply fork this repository, clone it to your local machine, and get started translating it to your language of choice. If you want to work with other translators (which I certainly encourage), add them as collaborators to the repository as needed. At any time, you are free to deploy the result to a URL of your choice. Once it's up and ready for public consumption, send the URI to `admin@railstutorial.org` and I'll link to it from the main Rails Tutorial website.

Since I often make minor fixes to the book, I recommend occasionally merging in changes from the master branch. If merging causes too many conflicts, you can omit this optional step.

## Source files

The repository contains an HTML source file for each chapter of the Ruby on Rails Tutorial, as well as two CSS files for styling and an images directory with all of the book's figures. Note that the image URIs in the HTML files are *relative*, i.e., they appear as

    images/figures/foo.png

with no leading slash. This is so that when you view the HTML files locally all the images load correctly. 

For a fully deployed version of the book, you may have to change the image paths from relative to absolute, such as

    /images/figures/foo.png

If this ends up being the case, I recommend writing a script to build the production output. You may find the Ruby line

```ruby
text.gsub!('"images/', '"/images/')
```

to be useful in this context.

## License

*Ruby on Rails Tutorial, 2nd Edition*. Copyright &copy; 2012 by Michael Hartl.

The HTML source of the Ruby on Rails Tutorial book is available under the [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/), which allows translation of the book as long as you give attribution to the original author ([Michael Hartl](http://michaelhartl.com/)) and distribute the translation under the same license.
