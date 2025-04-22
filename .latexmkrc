$latex = 'latex  -shell-escape';
$xelatex = 'xelatex -sehll-escape';
$miktex = 'miktex -shell-escape';
$latexmkrc = 'latexmk -shell-escape';
$pdflatex = 'pdflatex -shell-escape';

add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
$clean_ext .= " acr acn alg glo gls glg";

sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    my @args = ( "-d", $path, $base_name );
    if ($silent) { unshift @args, "-q"; }
    return system "makeglossaries", @args;
}
