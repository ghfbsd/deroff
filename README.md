deroff
======
One of the venerable BSD document writing tools, which I am forking for my
own use on MacOS, and perhaps for use in other projects.

Source
------
This source was gathered from NetBSD.org, src.usr.bin/deroff.

No effort is currently being make to track the original, which is
decades old.

### Notes

* Rewrote the Makefile.

* Modified the man page to reflect changed behavior.

### Bug fixes

* Handles the .ig request properly.

* Ignores troff requests in block text.  Request processing should be
incorporated into the general request handling framework, but the present
code lacks generality.

* Put out macro args that follow a text string if long enough.  Long macro
args that follow text are probably additional text no matter if they aren't
alphabetic (numbers or punctuation).

* Process in-line equations even in .so inclusions.  This seems reasonable
since eqn input usually is piped from soelim, so in-line equations should
get processed there by troff too.

* Expanded the list of troff requests ignored by deroff.
    
    - if, ie, el (conditional)
    - sp (vertical space)
    - nr (register assign)
    - ds (string definition)

* Did not handle EQ/EN delimited in-line equation text
    
    - did not turn in-line equation into "x"
    - did not output text after in-line equation properly
    - did not handle in-line equation at end of line-ending sentence

  deroff handles these omissions properly now.

* Fix mistaken parsing of \\\\$n in macro definition as in-line equation.

* Print out what is in blocks of text in the various macro packages
(-me, -ms, etc.) by default.  Previously, these were, oddly, left out.
