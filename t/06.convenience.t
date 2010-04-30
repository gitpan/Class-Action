use Test::More tests => 5;
use Test::Carp;

use lib 'lib', '../lib';

BEGIN {
use_ok( 'Class::Action::Step' );
}

diag( "Testing Class::Action::Step $Class::Action::Step::VERSION" );

package TestAct;

@TestAct::ISA = qw(Class::Action::Step);
sub new { return bless {}, $_[0] }
sub clone_obj { return bless {}, $_[0] }
sub state { return '' }
sub reset_obj_state { %{ $_[0] } = () }
sub execute { return 1 }
sub exec_stack_runtime_handler {
    Test::More::ok(ref($_[1]) eq 'HASH', ref($_[0]) . " calls exec_stack_runtime_handler w/ HASH");
}

sub get_class_action_steps {
    
    return [
        __PACKAGE__->setup_class_execute_and_get_class_action_steps(
            ['A' => \&execute],
            ['B' => \&execute],
            ['C' => \&execute],
            ['D' => \&execute],
        )
    ];
}

package main;

my $act = TestAct->get_action_object();
$act->execute();