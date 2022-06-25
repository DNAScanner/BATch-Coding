# SelectionMenu v2

## About this project
This project is an upgraded Version of the [original one](https://github.com/DNAScanner/BATch-Coding/tree/main/SelectionMenu), also by me


## How to use
- You can set the maximum amount of displayed and saved options (`Line 10`)
- Add new options below `Line 13`. Syntax: `set "menuOption1=Option"`
- Later to read out the variable you need to use the `%menuOption1Raw%` instead of just `%menuOption1%`
- You can edit the Message-/Information-Text at `Line 48`
- Starting from `Line 83` you can add your code which will be executed if `Option1` is proceeded (`A`/`D`)


Everywhere, where I mentioned `menuOption1`, it's just meant as an example. This will normally also work with `menuOption2`, `menuOption3`, etc