package Local::Schema::ResultSet::Grade;
use base 'DBIx::Class::ResultSet';
use DDP;

sub max_points {
    my $self = shift;   
    my $rs = $self->search(undef, { order_by => {-desc => 'points'}})->first;
    return $rs->points;
}

1;
