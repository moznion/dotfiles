#!/bin/sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set repeat.wait 33
/bin/echo -n .
$cli set remap.swapcolons 1
/bin/echo -n .
$cli set option.extra_cursor_optionL_kjhl 1
/bin/echo -n .
$cli set remap.controlL2commandL 1
/bin/echo -n .
/bin/echo
