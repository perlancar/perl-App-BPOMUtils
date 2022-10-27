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
                       bpom_list_reg_code_prefixes
                       bpom_show_nutrition_facts
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

sub _nearest {
    require Math::Round;
    Math::Round::nearest(@_);
}

sub _fmt_num_id {
    require Number::Format;
    state $nf = Number::Format->new(THOUSANDS_SEP=>".", DECIMAL_POINT=>",");
    $nf->format_number(@_);
}

$SPEC{bpom_show_nutrition_facts} = {
    v => 1.1,
    summary => 'Round values and format them as nutrition fact table (ING - informasi nilai gizi)',
    args => {
        name => {schema=>'str*'},

        # XXX output_format: vertical table, horizontal table, simple table, csv. currently only simple table is supported
        output_format => {
            schema => ['str*', {in=>[qw/
                                           raw_table
                                           vertical_html_table vertical_text_table
                                           linear_html linear_text
                                       /]}],
            # horizontal_html_table horizontal_text_table formats not supported yet
            default => 'vertical_text_table',
            cmdline_aliases => {
                f=>{},
            },
            tags => ['category:output'],
        },

        browser => {
            summary => 'View output HTML in browser instead of returning it',
            schema => 'true*',
            tags => ['category:output'],
        },

        color => {
            schema => ['str*', in=>[qw/always auto never/]],
            default => 'auto',
            tags => ['category:output'],
        },

        fat           => {summary => 'Total fat, in g/100g'           , schema => 'ufloat*', req=>1},
        saturated_fat => {summary => 'Saturated fat, in g/100g'       , schema => 'ufloat*', req=>1},
        protein       => {summary => 'Protein, in g/100g'             , schema => 'ufloat*', req=>1},
        carbohydrate  => {summary => 'Total carbohydrate, in g/100g'  , schema => 'ufloat*', req=>1},
        sugar         => {summary => 'Total sugar, in g/100g'         , schema => 'ufloat*', req=>1},
        sodium        => {summary => 'Sodium, in mg/100g'             , schema => 'ufloat*', req=>1, cmdline_aliases=>{salt=>{}}},

        serving_size  => {summary => 'Serving size, in g'             , schema => 'ufloat*', req=>1},
        package_size  => {summary => 'Packaging size, in g'           , schema => 'ufloat*', req=>1},
    },

    examples => [
        {
            summary => 'An example, in linear text format (color/emphasis is shown with markup)',
            args => {fat=>0.223, saturated_fat=>0.010, protein=>0.990, carbohydrate=>13.113, sugar=>7.173, sodium=>0.223, serving_size=>175, package_size=>20, output_format=>"linear_text", color=>"never"},
            test => 0,
        },
        {
            summary => 'The same example in vetical HTML table format',
            args => {fat=>0.223, saturated_fat=>0.010, protein=>0.990, carbohydrate=>13.113, sugar=>7.173, sodium=>0.223, serving_size=>175, package_size=>20, output_format=>"vertical_html_table"},
            test => 0,
        },
        {
            summary => 'The same example, in vertical text format (color/emphasis is shown with markup)',
            args => {fat=>0.223, saturated_fat=>0.010, protein=>0.990, carbohydrate=>13.113, sugar=>7.173, sodium=>0.223, serving_size=>175, package_size=>20, output_format=>"vertical_text_table", color=>"never"},
            test => 0,
        },
    ],
};
sub bpom_show_nutrition_facts {
    my %args = @_;
    my $output_format = $args{output_format} // 'raw_table';

    my $color = $args{color} // 'auto';
    my $is_interactive = -t STDOUT; ## no critic: InputOutput::ProhibitInteractiveTest
    my $use_color = $color eq 'never' ? 0 : $color eq 'always' ? 1 : $is_interactive;

    my @rows;


    my $attr = $output_format =~ /html/ ? "raw_html" : "text";
    my $code_fmttext = sub {
        my $text = shift;
        if ($output_format =~ /html/) {
            require Org::To::HTML;
            my $res = Org::To::HTML::org_to_html(source_str => $text, naked=>1);
            die "Can't convert Org to HTML: $res->[0] - $res->[1]" if $res->[0] != 200;
            $res->[2];
        } else {
            my $res;
            if ($use_color) {
                require Org::To::ANSIText;
                $res = Org::To::ANSIText::org_to_ansi_text(source_str => $text);
                die "Can't convert Org to ANSI text: $res->[0] - $res->[1]" if $res->[0] != 200;
            } else {
                require Org::To::Text;
                $res = Org::To::Text::org_to_text(source_str => $text);
                die "Can't convert Org to text: $res->[0] - $res->[1]" if $res->[0] != 200;
            }
            $res->[2];
        }
    };

    my $per_package_ing = $args{serving_size} > $args{package_size} ? 1:0;
    my $size_key = $per_package_ing ? 'package_size' : 'serving_size';
    my $BR = $output_format =~ /html/ ? "<br />" : "\n";

    if ($output_format =~ /vertical/) {
        push @rows, [{colspan=>5, align=>'middle', $attr => $code_fmttext->("*INFORMASI NILAI GIZI*")}];
    } elsif ($output_format =~ /linear/) {
        if ($output_format =~ /html/) {
            push @rows, "<big><b>INFORMASI NILAI GIZI</b></big>&nbsp;&nbsp; ";
        } else {
            push @rows, $code_fmttext->("*INFORMASI NILAI GIZI*  ");
        }
    }

    if ($per_package_ing) {
    } else {
        if ($output_format =~ /vertical/) {
            push @rows, [{colspan=>5, text=>''}];
            push @rows, [{colspan=>5, align=>'left', bottom_border=>1,
                          $attr =>
                          $code_fmttext->("Takaran saji "._fmt_num_id($args{serving_size})." g"). $BR .
                          $code_fmttext->(_fmt_num_id(_nearest(0.5, $args{package_size} / $args{serving_size}))." Sajian per kemasan")
                      }];
            push @rows, [{colspan=>5, align=>'left', $attr => $code_fmttext->("*JUMLAH PER SAJIAN*")}];
            push @rows, [{colspan=>5, text=>''}];
        } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("Takaran saji : " . _fmt_num_id($args{serving_size}) . " g, " .
                                        _fmt_num_id(_nearest(0.5, $args{package_size} / $args{serving_size}))." Sajian per kemasan  ");
        }
    }


  ENERGY: {
        my $code_round_energy = sub {
            my $val = shift;
            if ($val < 5)      { 0 }
            elsif ($val <= 50) { _nearest( 5, $val) }
            else               { _nearest(10, $val) }
        };

        if ($per_package_ing) {
            if ($output_format eq 'raw_table') {
            } elsif ($output_format =~ /vertical/) {
                push @rows, [{colspan=>5, $attr=>$code_fmttext->("*JUMLAH PER KEMASAN ("._fmt_num_id($args{package_size})." g*)")}];
            } elsif ($output_format =~ /linear/) {
                push @rows, $code_fmttext->("*JUMLAH PER KEMASAN ("._fmt_num_id($args{package_size})." g*) : ");
            }
        }

        my $val0 = $args{fat} * 9 + $args{protein} * 4 + $args{carbohydrate} * 4;
        my $val  = $val0*$args{$size_key}/100;
        my $valr = $code_round_energy->($val);
        my $pct_dv_R = _nearest(1, $val/2150*100);
        if ($output_format eq 'raw_table') {
            push @rows, {
                name_eng => 'Total energy',
                name_ind => 'Energi total',
                val_per_100g  => $val0,
                (val_per_srv   => $val,
                 val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                (val_per_pkg   => $val,
                 val_per_pkg_R => $valr) x $per_package_ing,
                pct_dv        => $val/2150*100,
                pct_dv_R      => $pct_dv_R,
            };
        } elsif ($output_format =~ /vertical/) {
            if ($per_package_ing) {
                push @rows, [{bottom_border=>1, colspan=>5, $attr=>$code_fmttext->("*Energi total $valr kkal*")}];
            } else {
                push @rows, [{colspan=>3, $attr=>$code_fmttext->("*Energi total*")}, {colspan=>2, align=>'right', $attr=>$code_fmttext->("*$valr kkal*")}];
            }
        } elsif ($output_format =~ /linear/) {
            if ($per_package_ing) {
                push @rows, $code_fmttext->("*Energi total $valr kkal*, ");
            } else {
                push @rows, $code_fmttext->("*Energi total $valr kkal*, ");
            }
        }

      ENERGY_FROM_FAT: {
            my $val0 = $args{fat} * 9;
            my $val  = $val0*$args{serving_size}/100;
            my $valr = $code_round_energy->($val);
            if ($output_format eq 'raw_table') {
                push @rows, {
                    name_eng => 'Energy from fat',
                    name_ind => 'Energi dari lemak',
                    val_per_100g  => $val0,
                    (val_per_srv   => $val,
                     val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                    (val_per_pkg   => $val,
                     val_per_pkg_R => $valr) x $per_package_ing,
                };
            } elsif ($output_format =~ /vertical/) {
                if ($per_package_ing) {
                } else {
                    push @rows, ['', {colspan=>2, $attr=>$code_fmttext->("Energi dari lemak")}, {colspan=>2, align=>'right', $attr=>$code_fmttext->("$valr kkal")}];
                }
            } elsif ($output_format =~ /linear/) {
                push @rows, $code_fmttext->("Energi dari lemak $valr kkal, ");
            }
        }

      ENERGY_FROM_SATURATED_FAT: {
            my $val0 = $args{saturated_fat} * 9;
            my $val  = $val0*$args{$size_key}/100;
            my $valr = $code_round_energy->($val);
            if ($output_format eq 'raw_table') {
                push @rows, {
                    name_eng => 'Energy from saturated fat',
                    name_ind => 'Energi dari lemak jenuh',
                    val_per_100g  => $val0,
                    (val_per_srv   => $val,
                     val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                    (val_per_pkg   => $val,
                     val_per_pkg_R => $valr) x $per_package_ing,
                };
            } elsif ($output_format =~ /vertical/) {
                if ($per_package_ing) {
                } else {
                    push @rows, [{bottom_border=>1, text=>''}, {colspan=>2, $attr=>$code_fmttext->("Energi dari lemak jenuh")}, {colspan=>2, align=>'right', $attr=>$code_fmttext->("$valr kkal")}];
                }
            } elsif ($output_format =~ /linear/) {
                push @rows, $code_fmttext->("Energi dari lemak jenuh $valr kkal, ");
            }
        }
    } # ENERGY

    if ($output_format eq 'raw_table') {
    } elsif ($output_format =~ /vertical/) {
        push @rows, [{colspan=>3, text=>''}, {colspan=>2, align=>'middle', $attr=>$code_fmttext->("*\% AKG**")}];
    } elsif ($output_format =~ /linear/) {
    }

  FAT: {
        my $code_round_fat = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            elsif ($val <= 5)  { sprintf("%.1f", _nearest(0.5, $val)) }
            else               { _nearest(1  , $val) }
        };
        my $code_round_fat_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{fat};
        my $val  = $val0*$args{$size_key}/100;
        my $valr = $code_round_fat->($val);
        my $pct_dv_R = $code_round_fat_pct_dv->($val/67*100, $valr);
        if ($output_format eq 'raw_table') {
            push @rows, {
                name_eng => 'Total fat',
                name_ind => 'Lemak total',
                val_per_100g  => $val0,
                (val_per_srv   => $val,
                 val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                (val_per_pkg   => $val,
                 val_per_pkg_R => $valr) x $per_package_ing,
                pct_dv   => $val/67*100,
                pct_dv_R => $pct_dv_R,
            };
        } elsif ($output_format =~ /vertical/) {
            push @rows, [{colspan=>2, $attr=>$code_fmttext->("*Lemak total*")}, {align=>'right', $attr=>$code_fmttext->("*$valr g*")}, {align=>'right', $attr=>"$pct_dv_R %"}, ''];
        } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("*Lemak total $valr g ($pct_dv_R% AKG)*, ");
        }

      SATURATED_FAT: {
            my $val0 = $args{saturated_fat};
            my $val  = $val0*$args{$size_key}/100;
            my $valr = $code_round_fat->($val);
            my $pct_dv_R = $code_round_fat_pct_dv->($val/20*100, $valr);
            if ($output_format eq 'raw_table') {
                push @rows, {
                    name_eng => 'Saturated fat',
                    name_ind => 'Lemak jenuh',
                    val_per_100g  => $val0,
                    (val_per_srv   => $val,
                     val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                    (val_per_pkg   => $val,
                     val_per_pkg_R => $valr) x $per_package_ing,
                    pct_dv   => $val/20*100,
                    pct_dv_R => $pct_dv_R,
                };
            } elsif ($output_format =~ /vertical/) {
                push @rows, [{colspan=>2, $attr=>$code_fmttext->("*Lemak jenuh*")}, {align=>'right', $attr=>$code_fmttext->("*$valr g*")}, {align=>'right', $attr=>"$pct_dv_R %"}, ''];
            } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("*Lemak jenuh $valr g ($pct_dv_R% AKG)*, ");
            }
        }
    } # FAT

  PROTEIN: {
        my $code_round_protein = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            else               { _nearest(1  , $val) }
        };
        my $code_round_protein_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{protein};
        my $val  = $val0*$args{$size_key}/100;
        my $valr = $code_round_protein->($val);
        my $pct_dv_R = $code_round_protein_pct_dv->($val/60*100, $valr);
        if ($output_format eq 'raw_table') {
            push @rows, {
                name_eng => 'Protein',
                name_ind => 'Protein',
                val_per_100g  => $val0,
                (val_per_srv   => $val,
                 val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                (val_per_pkg   => $val,
                 val_per_pkg_R => $valr) x $per_package_ing,
                pct_dv   => $val/60*100,
                pct_dv_R => $pct_dv_R,
            };
        } elsif ($output_format =~ /vertical/) {
            push @rows, [{colspan=>2, $attr=>$code_fmttext->("*Protein*")}, {align=>'right', $attr=>$code_fmttext->("*$valr g*")}, {align=>'right', $attr=>"$pct_dv_R %"}, ''];
        } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("*Protein $valr g ($pct_dv_R% AKG)*, ");
        }
    }

  CARBOHYDRATE: {
        my $code_round_carbohydrate = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            else               { _nearest(1  , $val) }
        };
        my $code_round_carbohydrate_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{carbohydrate};
        my $val  = $val0*$args{$size_key}/100;
        my $valr = $code_round_carbohydrate->($val);
        my $pct_dv_R = $code_round_carbohydrate_pct_dv->($val/325*100, $valr);
        if ($output_format eq 'raw_table') {
            push @rows, {
                name_eng => 'Total carbohydrate',
                name_ind => 'Karbohidrat total',
                val_per_100g  => $val0,
                (val_per_srv   => $val,
                 val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                (val_per_pkg   => $val,
                 val_per_pkg_R => $valr) x $per_package_ing,
                pct_dv   => $val/325*100,
                pct_dv_R => $pct_dv_R,
            };
        } elsif ($output_format =~ /vertical/) {
            push @rows, [{colspan=>2, $attr=>$code_fmttext->("*Karbohidrat total*")}, {align=>'right', $attr=>$code_fmttext->("*$valr g*")}, {align=>'right', $attr=>"$pct_dv_R %"}, ''];
        } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("*Karbohidrat total $valr g ($pct_dv_R% AKG)*, ");
        }
    }

  SUGAR: {
        my $code_round_sugar = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            else               { _nearest(1  , $val) }
        };

        my $val0 = $args{sugar};
        my $val  = $val0*$args{$size_key}/100;
        my $valr = $code_round_sugar->($val);
        if ($output_format eq 'raw_table') {
            push @rows, {
                name_eng => 'Total sugar',
                name_ind => 'Gula total',
                val_per_100g  => $val0,
                (val_per_srv   => $val,
                 val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                (val_per_pkg   => $val,
                 val_per_pkg_R => $valr) x $per_package_ing,
            };
        } elsif ($output_format =~ /vertical/) {
            push @rows, [{colspan=>2, $attr=>$code_fmttext->("*Gula*")}, {align=>'right', $attr=>$code_fmttext->("*$valr g*")}, '', ''];
        } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("*Gula $valr g*, ");
        }
    }

  SODIUM: {
        my $code_round_sodium = sub {
            my $val = shift;
            if ($val < 5)       { 0 }
            elsif ($val <= 140) { _nearest( 5, $val) }
            else                { _nearest(10, $val) }
        };
        my $code_round_sodium_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{sodium};
        my $val  = $val0*$args{$size_key}/100;
        my $valr = $code_round_sodium->($val);
        my $pct_dv_R = $code_round_sodium_pct_dv->($val/325*100, $valr);
        if ($output_format eq 'raw_table') {
            push @rows, {
                name_eng => 'Salt (Sodium)',
                name_ind => 'Garam (Natrium)',
                val_per_100g  => $val0,
                (val_per_srv   => $val,
                 val_per_srv_R => $valr) x ($per_package_ing ? 0:1),
                (val_per_pkg   => $val,
                 val_per_pkg_R => $valr) x $per_package_ing,
                pct_dv   => $val/325*100,
                pct_dv_R => $pct_dv_R,
            };
        } elsif ($output_format =~ /vertical/) {
            push @rows, [{bottom_border=>1, colspan=>2, $attr=>$code_fmttext->("*Garam (Natrium)*")}, {align=>'right', $attr=>$code_fmttext->("*$valr mg*")}, {align=>'right', $attr=>"$pct_dv_R %"}, ''];
        } elsif ($output_format =~ /linear/) {
            push @rows, $code_fmttext->("*Garam (Natrium) $valr mg ($pct_dv_R% AKG)*. ");
        }
    }

    if ($output_format eq 'raw_table') {
    } elsif ($output_format =~ /vertical/) {
        push @rows, [{colspan=>5, $attr=>$code_fmttext->("/*Persen AKG berdasarkan kebutuhan energi 2150 kkal. Kebutuhan energi Anda mungkin lebih tinggi atau lebih rendah./")}];
    } elsif ($output_format =~ /linear/) {
        push @rows, $code_fmttext->(                      "/Persen AKG berdasarkan kebutuhan energi 2150 kkal. Kebutuhan energi Anda mungkin lebih tinggi atau lebih rendah./");
    }


  OUTPUT:
    if ($output_format eq 'raw_table') {
        return [200, "OK", \@rows, {'table.fields'=>[qw/name_eng name_ind val_per_100g val_per_srv val_per_srv_R val_per_pkg val_per_pkg_R pct_dv pct_dv_R/]}];
    }

    my $text;
    if ($output_format =~ /vertical/) {
        if ($output_format =~ /html/) {
            require Text::Table::HTML;
            my $table = Text::Table::HTML::table(rows => \@rows, header_row=>0);
            $table =~ s!<table>!<table><colgroup><col style="width:16pt;"><col style="width:200pt;"><col style="width:48pt;"><col style="width:48pt;"><col style="width:36pt;"></colgroup>!;
            $text = "
<style>
  table { border-collapse: collapse; border: 1px solid; }
  tr.has_bottom_border { border-bottom: 1pt solid black; }
  // td:first-child { background: red; }
</style>\n" . $table;
        } else {
            require Text::Table::More;
            $text = Text::Table::More::generate_table(rows => \@rows, color=>1, header_row=>0);
        }
    } elsif ($output_format =~ /linear/) {
        $text = join("", @rows). "\n";
    }

    if ($output_format =~ /html/ && $args{browser}) {
        require Browser::Open;
        require File::Slurper;
        require File::Temp;

        my $tempdir = File::Temp::tempdir();
        my $temppath = "$tempdir/ing.html";
        File::Slurper::write_text($temppath, $text);

        my $url = "file:$temppath";
        my $err = Browser::Open::open_browser($url);
        return [500, "Can't open browser"] if $err;
        return [200];
    }

    return [200, "OK", $text, {'cmdline.skip_format'=>1}];
}

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
