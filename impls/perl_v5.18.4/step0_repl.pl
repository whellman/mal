#!/usr/bin/perl

sub READ {
    return $_[0];
}

sub EVAL {
    return $_[0];
}

sub PRINT {
    return $_[0];
}

sub rep {
    $MyInput = $_[0];
    $MyReaded = READ($MyInput);
    $MyEvaled = EVAL($MyReaded);
    $MyPrinted = PRINT($MyEvaled);
    return $MyPrinted;
}

# Main loop needs to grab input from user, pass it to rep, and print result.
# It should start with a prompt that is specified by the Mal project: 'user> '
# (in order to pass automated tests provided by Mal).
$MyUserPrompt = "user> ";

print $MyUserPrompt;
while (<>) {
    chomp;
    $MyREPL = rep($_);
    print $MyREPL, "\n", $MyUserPrompt;
    last if eof;
}
