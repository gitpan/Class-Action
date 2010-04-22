package Class::Action::Step;

use warnings;
use strict;

$Class::Action::Step::VERSION = '0.1';

# get a collection of step objects:

sub get_class_action_steps {
    my ( $class, @args ) = @_;
    return $class->_not_imp('get_class_action_steps');
}

#### mandatory step object methods ##

sub new {
    my ($step_obj) = @_;
    return $step_obj->_not_imp('new');
}

sub clone_obj {
    my ($step_obj) = @_;
    return $step_obj->_not_imp('clone_obj');

    # return a cloned $step_obj
}

sub state {
    my ($step_obj) = @_;
    return $step_obj->_not_imp('state');

    # return string/data struct representing any important messages and status that you might want to examine after reset_obj_state() has wiped the object clean
}

sub reset_obj_state {
    my ($step_obj) = @_;
    return $step_obj->_not_imp('reset_obj_state');

    # my ($step_obj) = @_;
    # resets the intrnal state of the obj
    # void context
}

sub execute {
    my ($step_obj) = @_;
    $step_obj->_not_imp('execute');
    return 1;

    # my ($step_obj, $global_data_hr, @args_to_execute) = @_;
    # return 1 if what it does worked
    # return;
}

#### optional step object methods ##

sub retry_execute {
    return;

    # my ($step_obj, $global_data_hr, @args_to_execute) = @_;
    # Address $step_obj->execute() failure as needed
    # return 1 if $retry; # i.e. we should try $step_obj->execute() again
    # return;
}

sub clean_failed_execute {
    return;

    # my ($step_obj, $global_data_hr, @args_to_execute) = @_;
    # final $step_obj->execute() cleanup since the $step_obj->execute() failed and we are not retrying
    # void context
}

# same idea as the execute equivalents (sans that undo() is optional)

sub undo {
    return 1;

    # my ($step_obj, $global_data_hr, @args_to_execute) = @_;
    # return 1 if what it does worked
    # return;
}

sub retry_undo {
    return;

    # my ($step_obj, $global_data_hr, @args_to_execute) = @_;
    # Address $step_obj->undo() failure as needed
    # return 1 if $retry; # i.e. we should try $step_obj->undo() again
    # return;
}

sub clean_failed_undo {
    return;

    # my ($step_obj, $global_data_hr, @args_to_execute) = @_;
    # final $step_obj->undo() cleanup since the $step_obj->undo() failed and we are not retrying
    # void context
}

#### Internal ##

sub _not_imp {
    my ( $step_obj, $method ) = @_;
    require Carp;
    local $Carp::CarpLevel = $Carp::CarpLevel + 1;
    Carp::carp( ( ref($step_obj) || $step_obj ) . " does not implement $method()" );
    return;
}

1;
