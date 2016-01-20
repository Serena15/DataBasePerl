package Local::Schema::ResultSet::Grade;
use base 'DBIx::Class::ResultSet';
use DDP;

sub max_points {
    my $self = shift;   
    my @rs = $self->search(undef, { order_by => {-desc => 'points'} })->all();
    my $first_max = $rs[0]->points;
    return $first_max;
}

1;
