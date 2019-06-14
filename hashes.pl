    use strict;
    use warnings;
     
    use 5.010;
     
    my %employee = (
        jack  => 980144,
        peter => 128756,
        john  => 903610    
    );
     
    #Assign a hash slice to @id1 array
    my @id1 = ($employee{"jack"}, $employee{"peter"}, $employee{"john"});
     
    #Print all employee ids from array @id1
    say join ',', @id1;
     
    #Assign a hash slice to @id2 array
    my @id2 = @employee{ qw/jack peter john/ };
     
    #Print all employee ids from array @id2
    say join ',', @id2;
     
    my %employee2 = (
        #Name, Employee Id, Department, Location
        jack  => [980144,'Marketing','London'],
        peter => [128756,'Research', 'Detroit'],
        john  => [903610, 'Development', 'Sydney']    
    );
     
    #Retrieve the location of all employees
    my @location = ($employee2{"jack"}->[2], $employee2{"peter"}->[2], $employee2{"john"}->[2]);
     
    #Print all employee's location
    say join ',', @location;