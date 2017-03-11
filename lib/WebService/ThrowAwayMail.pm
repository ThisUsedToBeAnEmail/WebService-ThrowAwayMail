package WebService::ThrowAwayMail;

our $VERSION = '0.01';

use Moo;
use MooX::LazierAttributes;
 
use HTTP::Tiny;
use Carp qw/croak/;

attributes (
    tiny => [rw, HTTP::Tiny->new(),{lzy}],
    base_url => [ro, 'https://throwawaymail.org/getalias/text', { lzy }],
);

sub get {
    my $response = $_[0]->tiny->get($_[0]->base_url);
    $response->{success} and return $response;
    croak "something went terribly wrong" . $response;
}

sub get_alias {
    return $_[0]->get->{content};
}

1;

__END__

=head1 NAME

WebService::ThrowAwayMail - Perl client for throwawaymail.org API

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

    use WebService::ThrowAwayMail;

    my $client = WebService::ThrowAwayMail->new();
    
    $client->get_alias;
    # pointedtomahawk547
    ...

=head2 Description

throwawaymail.org's API allows you to generate aliases and/or usernames at will such as monumentalboo553, fussychild1998, ethicalminiskirt931 and many more *\o/*!. 

=head1 SUBROUTINES/METHODS

=head2 get_alias

Makes a get request to L<https://throwawaymail.org/getalias/text> and returns a new alias/username.

=cut

=head1 AUTHOR

Robert Acock, C<< <thisusedtobeanemail at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-webservice-throwawaymail at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WebService-ThrowAwayMail>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WebService::ThrowAwayMail


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WebService-ThrowAwayMail>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WebService-ThrowAwayMail>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WebService-ThrowAwayMail>

=item * Search CPAN

L<http://search.cpan.org/dist/WebService-ThrowAwayMail/>

=back

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Robert Acock.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut

1; # End of WebService::ThrowAwayMail
