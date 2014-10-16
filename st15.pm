package ST15;
use strict;

my @MenuItems = 
(
	"\nMenu\n_______________________\n1. Add",
	"2. Edit",
	"3. Delete",
	"4. Display",
	"5. Save to file",
	"6. Load from file\n_______________________\n",
	"Please enter the number of steps:\n",
);

my @ReferencesToMenuItems =
(
	\&Add,	
	\&Edit,
	\&Delete,
	\&Display,
	\&SaveToFile,
	\&LoadFromFile,	  
);

sub Menu
{
	foreach (@MenuItems){
		print "$_\n";
	}
	my $ch = <STDIN>;
	return ($ch-1)
};
my @Objects=();
undef @Objects;
sub Add
{	
 	my @Attributes=();
	print "\nPlease enter the value of the first attribute: "; push(@Attributes,<STDIN>+"\cZ");  
	print "Please enter the value of the second attribute: "; push(@Attributes,<STDIN>+"\cZ"); 
	print "Please enter the value of the third attribute: "; push(@Attributes,<STDIN>+"\cZ"); 
	print "Please enter the value of the fourth attribute: "; push(@Attributes,<STDIN>+"\cZ"); 
	my $object={
		Attribute1=>$Attributes[0],
		Attribute2=>$Attributes[1],
		Attribute3=>$Attributes[2],
		Attribute4=>$Attributes[3],
	};
	push(@Objects,$object);	
	return 1;
};

sub Edit
{
	Display();
	if(scalar(@Objects)!=0){
		while(1){
			print"\nPlease enter the number of the object for editing:\n";
			my $i=<STDIN>;
			if(scalar(@Objects[$i-1])!=0){
				my @Attributes=();
				print "\nPlease enter the value of the first attribute: "; $Attributes[0]=<STDIN>;
				print "Please enter the value of the second attribute: "; $Attributes[1]=<STDIN>;
				print "Please enter the value of the third attribute: "; $Attributes[2]=<STDIN>;
				print "Please enter the value of the fourth attribute: "; $Attributes[3]=<STDIN>;
				my $object={
					Attribute1=>$Attributes[0],
					Attribute2=>$Attributes[1],
					Attribute3=>$Attributes[2],
					Attribute4=>$Attributes[3],
				};
				@Objects[$i-1]= $object;
				Display();
				last;	
			}
			else{
				print"\nEnter the correct number of object:\n";
			}
		}
	}
	
};

sub Delete
{
	Display();
	if(scalar(@Objects)!=0){
		while(1){
			print"\nPlease enter the number of the object to delete:\n";
			my $i=<STDIN>;
			if(scalar(@Objects[$i-1])!=0){
				splice(@Objects,$i-1,1);
				Display();
				last;
			}
			else{
				print"\nEnter the correct number of object:\n";
			}
		}
	}
		
};

sub Display
{	
	if(scalar(@Objects)==0){
		print"\nThere are no objects in the list. ";
		print"Please add objects to the list, or load them from the file.\n\n";
	}
	else{
		my $counter=1;
		foreach (@Objects)
		{
			print "\n\n_______________________\nObject $counter\n";
			print "Attribute1 - $_->{Attribute1}\n";
			print "Attribute2 - $_->{Attribute2}\n";
			print "Attribute3 - $_->{Attribute3}\n";
			print "Attribute4 - $_->{Attribute4}\n_______________________\n";
			$counter++;
		}	
	}
	return 1;
};

sub SaveToFile
{	
};

sub LoadFromFile
{	
};

while(1)
{
	my $ch = Menu();
	if(defined $ReferencesToMenuItems[$ch])
	{	
		$ReferencesToMenuItems[$ch]->();		
	}
	else
	{
		exit();
	}
}
