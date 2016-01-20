use utf8;
package Local::Schema::Result::Homework;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Local::Schema::Result::Homework

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<homework>

=cut

__PACKAGE__->table("homework");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 path

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 max_points

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "path",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "max_points",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 grades

Type: has_many

Related object: L<Local::Schema::Result::Grade>

=cut

__PACKAGE__->has_many(
  "grades",
  "Local::Schema::Result::Grade",
  { "foreign.homework_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-12-11 02:15:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:na+wcpcoa9TlZe+yNm99dA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
