use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Algorithm::MedianSelect',
    VERSION_FROM => 'lib/Algorithm/MedianSelect.pm',
    PREREQ_PM    => { Exporter => 0 },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/Algorithm/MedianSelect.pm') : ()
    ),
);
