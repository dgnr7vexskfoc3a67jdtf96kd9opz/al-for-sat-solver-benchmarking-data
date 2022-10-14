gbd group competition_track
gbd set -n competition_track -v main_2006 $(gbd get "local like %sat2006/SAT-Race-Benchmarks%")
gbd set -n competition_track -v crafted_2007 $(gbd get "local like %sat2007/crafted%")
gbd set -n competition_track -v random_2007 $(gbd get "local like %sat2007/random%")
gbd set -n competition_track -v industrial_2007 $(gbd get "local like %sat2007/industrial% or local like %sat2007/vliw%")
gbd set -n competition_track -v main_2008 $(gbd get "local like %sat2008%")
gbd set -n competition_track -v application_2009 $(gbd get "local like %sat2009/application%")
gbd set -n competition_track -v crafted_2009 $(gbd get "local like %sat2009/crafted%")
gbd set -n competition_track -v random_2009 $(gbd get "local like %sat2009/random%")
gbd set -n competition_track -v main_2010 $(gbd get "local like %sat2010%")
gbd set -n competition_track -v random_2011 $(gbd get "local like %sat2011/application/selected% and local like %unif%")
gbd set -n competition_track -v crafted_2011 $(gbd get "local like %sat2011/application/selected% and (local like %crafted% or local like %handmade%)")
gbd set -n competition_track -v application_2011 $(gbd get "local like %sat2011/application/selected% and (local like %industrial% or local like %APPLICATIONS% or local like %RACE% or local like %SAT11/app%)")
gbd set -n competition_track -v mus_2011 $(gbd get "local like %sat2011/mus/selected/%")
gbd set -n competition_track -v application_2012 $(gbd get "local like %sat2012/application%")
gbd set -n competition_track -v crafted_2012 $(gbd get "local like %sat2012/crafted%")
gbd set -n competition_track -v portfolio_2012 $(gbd get "local like %sat2012/portfolio%")
gbd set -n competition_track -v random_2012 $(gbd get "local like %sat2012/random%")
gbd set -n competition_track -v application_2013 $(gbd get "local like %sat2013/application%")
gbd set -n competition_track -v crafted_2013 $(gbd get "local like %sat2013/combinatoral%")
gbd set -n competition_track -v random_2013 $(gbd get "local like %sat2013/random%")
gbd set -n competition_track -v application_2014 $(gbd get "local like %sat2014/application%")
gbd set -n competition_track -v crafted_2014 $(gbd get "local like %sat2014/crafted%")
gbd set -n competition_track -v random_2014 $(gbd get "local like %sat2014/random%")
gbd set -n competition_track -v main_2015 $(gbd get "local like %sat2015/main%")
gbd set -n competition_track -v parallel_2015 $(gbd get "local like %sat2015/hard%")
gbd set -n competition_track -v agile_2016 $(gbd get "local like %sat2016/Agile%")
gbd set -n competition_track -v application_2016 $(gbd get "local like %sat2016/app16%")
gbd set -n competition_track -v crafted_2016 $(gbd get "local like %sat2016/crafted16%")
gbd set -n competition_track -v random_2016 $(gbd get "local like %sat2016/RandomSat%")
gbd set -n competition_track -v agile_2017 $(gbd get "local like %sat2017/Agile%")
gbd set -n competition_track -v main_2017 $(gbd get "local like %sat2017/Main%")
gbd set -n competition_track -v random_2017 $(gbd get "local like %sat2017/RandomSat%")
gbd set -n competition_track -v main_2018 $(gbd get "local like %sat2018/main%")
gbd set -n competition_track -v random_2018 $(gbd get "local like %sat2018/random%")
gbd set -n competition_track -v main_2019 $(gbd get "local like %sat2019%")