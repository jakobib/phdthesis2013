#!/usr/bin/env perl
use v5.14;
use List::MoreUtils qw(natatime);
use Catmandu qw(importer);

my %cite;

# extract cited entries from TeX the hard way
while(<>) {
    my @matches = $_ =~ qr!\\(textcite|citeyear|cite)(\[[^\]]*\])?{([^}]+)}!;
    my $iterator = natatime 3, @matches;
    while (my @capture = $iterator->()) {
        $cite{$_}++ for split /\s*,\s*/, $capture[2];
    }
}

# get ISBN and title of all cited books
importer('BibTeX', file => 'bibliography.bib')->each(sub {
  my $b = shift;
  if ($cite{$b->{_citekey}} && $b->{type} eq 'book' && $b->{isbn}) {
    $b->{title} =~ s/[{}]//g;
    say join '|', $b->{isbn}, $b->{title};
  }
});
