use ExtUtils::MakeMaker;
WriteMakefile(
    DISTNAME     => 'Algorithm-MedianSelect',
    NAME         => 'Algorithm::MedianSelect',
    VERSION_FROM => 'lib/Algorithm/MedianSelect.pm',
    PREREQ_PM    => { Exporter => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/Algorithm/MedianSelect.pm') : ()
    ),
);
