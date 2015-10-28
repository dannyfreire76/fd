#!C:/indigoampp/perl-5.12.1/bin/perl.exe
#!/usr/bin/perl -w

#$dbh = DBI->connect('DBI:mysql:danny_portfolio:localhost','danny_danny','redbird1');
$dbh = DBI->connect('DBI:mysql:test:localhost','','');

		$sql = qq!SELECT * FROM Main ORDER BY order_of;!;
		$command = $dbh->prepare($sql) || die "Cannot prepare statement: $DBI::errstr\n";
		$command->execute();
print qq!Content-type: text/html\n\n!;

print qq!
<div class="uk-grid uk-text-center" data-uk-grid-margin>
!;
$i=0;
while(@row = $command->fetchrow_array) {
			($order_of,$title,$name,$url,$cat,$desc,$dimensions)=@row;

$i++;

	print qq!
	<div class="uk-width-medium-1-2">
		<a class="uk-thumbnail uk-border-rounded">
			<figure class="uk-overlay uk-overlay-hover">
				<img class="fd-bw" src="/images/$name\_full.gif" border="0" name="$name">
				<figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom uk-overlay-slide-bottom">
					<h3>$title</h3>
					<\!--<div class="">$desc</div>-->
				</figcaption>
			</figure>
		</a>
	</div>
	!;

	if ($i % 2 ==0 ) {
		print qq!</div><div class="uk-grid uk-text-center" data-uk-grid-margin>!;
	}
}

$command -> finish();
$dbh->disconnect();
exit(0);

print qq!</div>!;