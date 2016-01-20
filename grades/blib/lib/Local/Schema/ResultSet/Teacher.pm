package Local::Schema::ResultSet::Teacher;
use base 'DBIx::Class::ResultSet';
use DDP;
sub search_by_name {
  my $self = shift;
  my $name = shift;
  $name = "%".$name."%";
  return $self->search(
  {
    -or => [
    'first_name' => {like => $name},
    'last_name'  => {like => $name},
    ]
  }
    );
}

1;
