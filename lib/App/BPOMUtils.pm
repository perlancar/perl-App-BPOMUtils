package App::BPOMUtils;

use 5.010001;
use strict 'subs', 'vars';
use utf8;
use warnings;
use Log::ger;

use Exporter 'import';
use Perinci::Sub::Gen::AccessTable qw(gen_read_table_func);

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(
                       bpom_list_food_categories
                       bpom_list_food_types
                       bpom_list_food_additives
                       bpom_list_food_ingredients
                       bpom_list_reg_code_prefixes
                       bpom_list_microbe_inputs
                       bpom_list_inputs
               );

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Utilities related to BPOM',
};

my $res;

require App::BPOMUtils::Table;
$res = gen_read_table_func(
    name => 'bpom_list_food_categories',
    summary => 'List food categories in BPOM processed food division',
    table_data => $App::BPOMUtils::Table::data_idn_bpom_kategori_pangan,
    table_spec => $App::BPOMUtils::Table::meta_idn_bpom_kategori_pangan,
    description => <<'_',
_
    extra_props => {
        examples => [
            {
                summary => 'Print active categories codes matching "cokelat"',
                src_plang => "bash",
                src => "[[prog]] --status-is Aktif 'cokelat hitam'",
                test => 0,
            },
            {
                summary => 'Print active records matching "cokelat hitam" in a formatted text table',
                src_plang => "bash",
                src => "[[prog]] --status-is Aktif 'cokelat hitam' -l --format text-pretty",
                test => 0,
            },
            {
                summary => 'Print all category records with code 14.1.4.2',
                src_plang => "bash",
                src => "[[prog]] --code-matches '^14010402' -l --format text-pretty",
                test => 0,
            },
            {
                summary => 'How many categories are active vs inactive?',
                src_plang => "bash",
                src => "echo -n 'Aktif: '; [[prog]] --status-is Aktif | wc -l; echo -n 'Tidak Aktif: '; [[prog]] --status-isnt Aktif | wc -l",
                test => 0,
            },
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_food_types',
    summary => 'List food types in BPOM processed food division',
    table_data => $App::BPOMUtils::Table::data_idn_bpom_jenis_pangan,
    table_spec => $App::BPOMUtils::Table::meta_idn_bpom_jenis_pangan,
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_reg_code_prefixes',
    summary => 'List known alphabetical prefixes in BPOM registered product codes',
    table_data => $App::BPOMUtils::Table::data_reg_code_prefixes,
    table_spec => $App::BPOMUtils::Table::meta_reg_code_prefixes,
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_food_ingredients',
    summary => 'List ingredients in BPOM processed food division',
    table_data => $App::BPOMUtils::Table::data_idn_bpom_bahan_baku_pangan,
    table_spec => $App::BPOMUtils::Table::meta_idn_bpom_bahan_baku_pangan,
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_food_additives',
    summary => 'List additives in BPOM processed food division',
    table_data => $App::BPOMUtils::Table::data_idn_bpom_bahan_tambahan_pangan,
    table_spec => $App::BPOMUtils::Table::meta_idn_bpom_bahan_tambahan_pangan,
    description => <<'_',
_
    extra_props => {
        examples => [
            {
                summary => 'Check for additives that contain "dextrin" but do not contain "gamma"',
                src_plang => 'bash',
                src => '[[prog]] -l --format text-pretty -- dextrin -gamma',
                test => 0,
            },
            {
                summary => 'Check for additives that contain "magnesium" or "titanium"',
                src_plang => 'bash',
                src => '[[prog]] -l --format text-pretty --or -- magnesium titanium',
                test => 0,
            },
            {
                summary => 'Check for additives that match some regular expressions',
                src_plang => 'bash',
                src => q{[[prog]] -l --format text-pretty -- /potassium/ '/citrate|phosphate/'},
                test => 0,
            },
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_food_microbe_inputs',
    summary => 'List of microbe specification in BPOM processed food division',
    table_data => $App::BPOMUtils::Table::data_idn_bpom_cemaran_mikroba_pangan,
    table_spec => $App::BPOMUtils::Table::meta_idn_bpom_cemaran_mikroba_pangan,
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_food_inputs',
    summary => 'List of basic characteristic and heavy metal pollutant references in BPOM processed food division',
    table_data => $App::BPOMUtils::Table::data_idn_bpom_karakteristik_dasar_dan_cemaran_logam_pangan,
    table_spec => $App::BPOMUtils::Table::meta_idn_bpom_karakteristik_dasar_dan_cemaran_logam_pangan,
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

1;
#ABSTRACT:

=head1 SYNOPSIS

 # Use via the included scripts


=head1 DESCRIPTION

This distribution includes CLI utilities related to BPOM (Badan Pengawas Obat
dan Makanan, Indonesian equivalent of Food & Drug Administration authority).

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<https://pom.go.id>

L<Business::ID::BPOM>

=cut
