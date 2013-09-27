# Dasheets

Generate your own cheatsheets as docsets for [Dash](http://kapeli.com/dash)!
Use this simple command line tool and write your cheatsheets in an easy
language (Ruby DSL).

## Installation

    $ gem install dasheets

## Usage

Write a file (here `tmux.cheatsheet`) containing your cheatsheet-data, e. g.:

    cheatsheet do
      title 'TMUX-Cheatsheet'
      short_name 'tmux'

      category do
        id 'windows'
        entry do
          name 'create window'
          command 'PREFIX-c'
        end
        entry do
          name 'rename window'
          command 'PREFIX-,'
        end
        entry do
          name 'go to next window'
          command 'PREFIX-n'
        end
      end

      category do
        id 'panes'
        entry do
          name 'split horizontally'
          command 'PREFIX-|'
          notes 'custom mapping'
        end
        entry do
          name 'split horizontally'
          command 'PREFIX-%'
        end
        entry do
          name 'split vertically'
          command 'PREFIX-"'
        end
      end
    end

To convert this file to a docset, call

    $ dasheets generate tmux.cheatsheet


## Contributing

Yes, please! Open issues and pull requests on the
[GitHub page](https://github.com/Nix-wie-weg/dasheets)

## Thanks

[svenwin](https://github.com/svenwin) for the awesome name!
