# pianobar-scripts #

[pianobar](https://github.com/PromyLOPh/pianobar) allows you to use a FIFO to
control it. I wrote these scripts that send simple commands to
[pianobar](https://github.com/PromyLOPh/pianobar) via that FIFO, but are
discretely named so that I can just map different key presses to a particular
script.

`pianobar-control` mimics the main interface of
[pianobar](https://github.com/PromyLOPh/pianobar) without any feedback,  only
allowing the commands that don't need two way communication (mainly, it allows
transport controls).

`pianobar-stop` uses the changes introduced in [axelson's
scripting-support](https://github.com/axelson/pianobar/tree/scripting-support)
branch.
