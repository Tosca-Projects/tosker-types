#!/bin/perl -w

open my $in, "<", "_README.md" or die $!;
open my $out, ">", "README.md" or die $!;

my $versions = "";
foreach $file (<*>) {
    if (-d $file) {
        $versions .= "- $file\n";
    }
}

my $document = '';
while (<$in>) { $document .= $_ }

$document =~ s/<!--version_list-->/$versions/;

print $out $document;

print "done.\n";