#!C:/indigoampp/perl-5.12.1/bin/perl.exe
#!/usr/bin/perl -w
use DBI;
print qq!Content-type: text/html\n\n!;

#$dbh = DBI->connect('DBI:mysql:danny_portfolio:localhost','danny_danny','redbird1');
$dbh = DBI->connect('DBI:mysql:test:localhost','','');

		$sql = qq!SELECT * FROM main ORDER BY order_of;!;
		$command = $dbh->prepare($sql) || die "Cannot prepare statement: $DBI::errstr\n";
		$command->execute();

print qq!
<html>
<head>
	<title>Danny Freire &nbsp;|&nbsp; Experienced Web developer located in Ithaca, NY</title>
	<meta NAME="keywords" CONTENT="Ithaca web design, Ithaca website, Ithaca web developer, web design, web developer, web changes, web presence, web hosting, website hosting, website host, Ithaca web hosting, Ithaca website hosting." />
	<meta NAME="description" CONTENT="Web design company located in Ithaca, NY specializing in database-driven, dynamic web sites." />
	<Meta name="robots" content="follow" />
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width" />
	<meta name="google-site-verification" content="NnaTCFq8OqoWB8tycZB9nu5JW1ZvYlsFPgDIixZ7pNc" />
	<link rel="stylesheet" type="text/css" href="/css/fd.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/2.23.0/js/uikit.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/2.23.0/js/components/tooltip.js" type="text/javascript"></script>
	<script src="/js/fd.js"></script>
</head>
<body>

<nav class="uk-navbar">
	<div class="uk-container uk-container-center">
		<div class="uk-grid">
			<div class="uk-width-9-10 uk-width-medium-4-6">
				<div href="#" data-uk-smooth-scroll class="uk-navbar-brand uk-padding-remove">DANNY FREIRE &nbsp;&nbsp;<span class="nav-contrast uk-display-inline-block uk-hidden-small">Web Developer since 2000</span></div>
			</div>
			<div class="uk-width-1-10 uk-width-medium-2-6">
				<div class="uk-navbar-flip">
					<div class="uk-visible-small">
						<a href="#ocMenu" class="uk-navbar-toggle" data-uk-offcanvas></a>
					</div>
					<ul class="uk-navbar-nav uk-hidden-small">
						<li><a href="#aboutMe" data-uk-smooth-scroll>about</a></li>
						<li><a href="#contactMe" data-uk-smooth-scroll>contact</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="uk-grid uk-visible-small uk-margin-top-remove">
				<div class="nav-contrast uk-width-1-1 uk-margin-bottom">web developer since 2000</div>
		</div>
	</div>
</nav>

<div id="ocMenu" class="uk-offcanvas uk-visible-small">
	<div class="uk-offcanvas-bar uk-offcanvas-bar-flip">
		<ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon" data-uk-nav="{multiple:true}">
			<li><a href="#aboutMe">About</a></li>
			<li><a href="#contactMe">Contact</a></li>
		</ul>
	</div>
</div>

<div id="mainContainer">
	<div class="uk-container uk-container-center">!;
		$modals = '';
		$i=0;
		print qq!<div class="uk-grid uk-text-center" data-uk-grid-margin>!;

			while(@row = $command->fetchrow_array) {
					($order_of,$title,$name,$url,$cat,$desc,$dimensions,$subtitle)=@row;
			$i++;

			print qq!
			<div class="uk-width-medium-1-2">
				<a class="alt-thumb" href="#$name\_modal" data-uk-modal="{center:true}">
					<figure class="uk-overlay uk-overlay-hover uk-hidden-touch uk-border-rounded fd-border">
						<img src="/images/$name\_full.gif" border="0" name="$name">
						<figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom uk-overlay-slide-bottom">
							<h2 class="uk-margin-small-bottom">$title</h2>
							<h4 class="uk-margin-top-remove" style="text-transform: lowercase;">$subtitle</h4>
						</figcaption>
					</figure>
					<img class="uk-hidden-notouch fd-border" src="/images/$name\_full.gif" border="0" name="$name">
				</a>
			</div>
			!;

			$modals .= qq!
			<div class="uk-modal" id="$name\_modal">
				<div class="uk-modal-dialog uk-text-center">
					<a class="uk-modal-close uk-close"></a>
					<div class="uk-modal-header">
						<h3 class="uk-margin-small-bottom">$title</h3>
					</div>
					<div class="uk-thumbnail uk-border-rounded">
						<img src="/images/$name\_full.gif" border="0" name="$name">
					</div>
					<div class="uk-text-left uk-margin-top uk-display-inline-block">
						$desc
					</div>
				</div>
			</div>!;
		}
		print qq!</div><\!-- /uk-grid -->!;

		$command -> finish();
		$dbh->disconnect();

		print qq!
	</div><\!-- uk-container uk-container-center -->
</div><\!-- /mainContainer -->
$modals
<footer>
	<div class="uk-container uk-container-center uk-contrast uk-margin-large uk-margin-top">
		<div class="uk-grid uk-margin-top" data-uk-grid-margin>
			<div class="uk-width-medium-1-2 uk-text-justify">
				<h1 id="aboutMe"><i class="uk-icon-user uk-display-inline-block"></i> &nbsp;About Me</h1>
				<img class="uk-border-circle uk-float-left uk-width-1-5 uk-margin-right" src="/images/DannyFreire_profile_bw.png" />
				Since 2000 I've been providing Web design and development services to all types of clients, big and small. From logo design to unique graphical user interfaces, from complete site development to contract work as part of a large team, I've enjoyed a broad range of experiences in Web programming.
				<p>I'm a native of New York City, now located in beautiful upstate NY where I live with my wife and two sons.</p>
			</div>
			<div class="uk-width-medium-1-2">
				<h1 id="contactMe"><i class="uk-icon-envelope uk-display-inline-block"></i> &nbsp;Contact Me</h1>
				<form class="uk-form uk-form-stacked">
					<div class="uk-form-row">
						<label class="uk-form-label" for="email">Email Address</label>
						<div class="uk-form-controls">
							<input type="email" class="uk-width-1-1" id="email" name="email" required aria-required />
						</div>
					</div>
					<div class="uk-form-row">
						<label class="uk-form-label" for="msg">Message</label>
						<div class="uk-form-controls">
							<textarea class="uk-width-1-1" id="msg" name="msg" rows="5" required aria-required></textarea>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-form-controls">
							<button class="uk-button uk-button-primary" type="submit">SEND NOW</button><i class="uk-icon-spinner uk-icon-spin uk-hidden uk-margin-left"></i>
							<div class="form-msg uk-margin-small-top uk-contrast"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</footer>

</body>
</html>!;
exit(0);