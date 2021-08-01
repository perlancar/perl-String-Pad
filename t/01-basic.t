#!perl -T

use 5.010;
use strict;
use warnings;
use Test2::Bundle::More;

use String::Pad qw(
                      pad
              );
                      #pad_numbers

subtest "pad" => sub {
    is(pad("1234", 4), "1234");
    is(pad("1234", 6), "1234  ", "right");
    is(pad("1234", 6, "l"), "  1234", "left");
    is(pad("1234", 6, "c"), " 1234 ", "center");
    is(pad("1234", 6, "c", "x"), "x1234x", "padchar");
    is(pad("1234", 1), "1234", "trunc=0");
    is(pad("1234", 1, undef, undef, 1), "1", "trunc=1");

    subtest "multiple strings" => sub {
        is_deeply(pad(["1234", "12", "12345"]), ["1234 ", "12   ", "12345"]);
        is_deeply(pad(["1234", "12", "12345"], 6), ["1234  ", "12    ", "12345 "]);
        is_deeply(pad(["1234", "12", "12345"], 2, undef, undef, 1), ["12", "12", "12"]);
    };
};

if (0) {
subtest "pad_numbers" => sub {
    my $numbers = [
        "1",
        "-20",
        "3.1",
        "-400.56",
        "5e1",
        "6.78e02",
        "-7.8e-10",
        "Inf",
        "NaN",
    ];

    is_deeply(pad_numbers($numbers), [
        "   1      ",
        " -20      ",
        "   3.1    ",
        "-400.56   ",
        "   5e1    ",
        "   6.78e02",
        "  -7.8e-10",
        " Inf      ",
        " NaN      ",
    ]);
};
} # if 0

DONE_TESTING:
done_testing;
