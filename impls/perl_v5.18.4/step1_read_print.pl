#!/usr/bin/perl

use Reader;

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


# TODO: Use Term::ReadLine or something. But... ehhh? There's a perlescent elegance to <>
print $MyUserPrompt;
while (<>) {
    chomp;
    $MyREPL = rep($_);
    @things = Reader::tokenize($MyREPL);
    print "@things\n";
    #my @matches = $MyREPL=~/[\s,]*(~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"?|;.*|[^\s\[\]{}('"`,;)]*)/g; # and @captured = @{^CAPTURE};
    #print "@matches\n";
    #print "@captured\n";
    print $MyREPL, "\n", $MyUserPrompt;
    last if eof;
}
