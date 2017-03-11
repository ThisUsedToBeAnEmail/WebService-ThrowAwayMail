use Test::More;

use WebService::ThrowAwayMail;

use Test::MockObject;

(my $tiny = Test::MockObject->new)->mock('get', sub { return { content => 'meh', success => 1 } });

my $client = WebService::ThrowAwayMail->new(
    tiny => $tiny,
);

my $alias = $client->get_alias();

is $alias, 'meh', 'okay a simple test';

done_testing();

1;
