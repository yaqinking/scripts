use utf8;
use Encode;

my $output ="tmp_output_file.tmp";
@ext = ("*.tjs", "*.ks", "*.txt");
foreach( @ext ) {
	foreach( glob($_) ) {
		my $input = $_;
		open (IN, "<:encoding(shift_jis)", $input) or die "$!";
		open (OUT, ">:utf8", $output) or die "$!";
		while( <IN> ) {
			print OUT $_;
		}
		close(IN);
		close(OUT);
		unlink $input;
		rename $output, $input;
	}
}