#!/usr/bin/perl

package Reader;

# A simple stateful reader object.
# It will store tokens, and a position.
# It will have two methods: next and peek.
# Next returns the token at position, and increments position.
# Peek just returns the token.

sub new
{
    my $class = shift;
    my $self = {
	$_position => 0,
	@_tokens => shift,
    };
    bless $self, $class;
    return $self;
}

sub next {
    # Returns the token at position, and increments position.
    return @_tokens[$_position++];
}

sub peek {
    # Just returns the token at position, without touching position itself.
    return @_tokens[$_position];
}

sub read_str {
    $mystring = shift;
    @newtokens = Reader::tokenize($mystring);
    $new_reader = new Reader(@newtokens);
    #then call read form with that new reader??
}

sub tokenize {
    $mystring = shift;
    print "sanity check\n";
    my @captured = $mystring =~ /[\s,]*(~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"?|;.*|[^\s\[\]{}('"`,;)]*)/g;
    return @captured;
}

1;
