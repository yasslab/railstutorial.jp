# Translation of the Ruby on Rails Tutorial, 2nd Edition

This repository contains the HTML source for the [Ruby on Rails Tutorial, 2nd edition](http://railstutorial.org/), with the goal of allowing translation of the tutorial to languages other than the [*lingua franca*](http://en.wikipedia.org/wiki/Lingua_franca). 

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