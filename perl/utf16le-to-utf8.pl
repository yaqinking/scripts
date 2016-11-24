use Encode;

my $output ="tmp_output_file.tmp";
@ext = ("*.tjs", "*.ks", "*.txt");
foreach( @ext ) {
	foreach( glob($_) ) {
		my $input = $_;
		open (IN, "<:encoding(UCS-2LE)", $input) or die "$!";
		open (OUT, ">:raw:encoding(utf8)", $output) or die "$!";
		while( <IN> ) {
			print OUT $_;
		}
		close(IN);
		close(OUT);
		unlink $input;
		rename $output, $input;
	}
}