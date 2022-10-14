#general
hashes=$(gbd get "local like %unif%")
gbd set -f -n family -v uniform-random $hashes
hashes=$(gbd get "local like %fla-%")
gbd set -f -n family -v random-planted-solution $hashes
hashes=$(gbd get "local like %modgen-%")
gbd set -f -n family -v random-modularity $hashes
hashes=$(gbd get "local like %/sgen-%")
gbd set -f -n family -v generator $hashes
hashes=$(gbd get "local like %/edges-%")
gbd set -f -n family -v generator $hashes
hashes=$(gbd get "local like %md5-%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %hwmcc%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %cbmc%")
gbd set -f -n family -v software-verification $hashes
hashes=$(gbd get "local like %agile%")
gbd set -f -n family -v agile $hashes
#sat2019
hashes=$(gbd get "local like %sat2019/new/Bebel%")
gbd set -f -n family -v integer-factoring $hashes
hashes=$(gbd get "local like %sat2019/new/Biere%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %sat2019/new/Zaikin%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %sat2019/new/Skladanivskyy%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %sat2019/new/Manthey%")
gbd set -f -n family -v software-verification $hashes
hashes=$(gbd get "local like %sat2019/new/Chen%")
gbd set -f -n family -v knights-problem $hashes
#sat2018
hashes=$(gbd get "local like %sat2018/main/Biere%")
gbd set -f -n family -v bitvector $hashes
hashes=$(gbd get "local like %sat2018/main/Harder%")
gbd set -f -n family -v cellular-automata $hashes
hashes=$(gbd get "local like %sat2018/main/Liang%")
gbd set -f -n family -v software-verification $hashes
hashes=$(gbd get "local like %sat2018/main/Chowdhury%")
gbd set -f -n family -v grandtour-puzzle $hashes
hashes=$(gbd get "local like %sat2018/main/Xiao%")
gbd set -f -n family -v polynomial-multiplication $hashes
hashes=$(gbd get "local like %sat2018/main/Chen%")
gbd set -f -n family -v pigeonhole $hashes
hashes=$(gbd get "local like %sat2018/main/Devriendt%")
gbd set -f -n family -v k-coloring $hashes
hashes=$(gbd get "local like %sat2018/main/Heule%")
gbd set -f -n family -v k-coloring $hashes
hashes=$(gbd get "local like %sat2018/main/Heusser%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %sat2018/main/Scheel%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %sat2018/main/Ehlers%")
gbd set -f -n family -v tree-decomposition $hashes
hashes=$(gbd get "local like %sat2018/main/Manthey%")
gbd set -f -n family -v software-verification $hashes
#sat2017
hashes=$(gbd get "local like %sat2017/Main/mp1-klieber%")
gbd set -f -n family -v crafted-equivalence-checking $hashes
hashes=$(gbd get "local like %rubikcube%")
gbd set -f -n family -v rubikcube $hashes
hashes=$(gbd get "local like %mp1-ps%")
gbd set -f -n family -v popularity-similarity-random $hashes
#sat2016
hashes=$(gbd get "local like %sat2016/crafted16/Ptn%")
gbd set -f -n family -v pythagorean-triples $hashes
hashes=$(gbd get "local like %sat2016/crafted16/Schur%")
gbd set -f -n family -v schur-coloring $hashes
hashes=$(gbd get "local like %sat2016/app16/Ehlers%")
gbd set -f -n family -v sorting-networks $hashes
hashes=$(gbd get "local like %sat2016/app16/Ledoux%")
gbd set -f -n family -v railway-safety $hashes
hashes=$(gbd get "local like %sat2016/app16/Balabanov%")
gbd set -f -n family -v combinational-equivalence-checking $hashes
#sat2014
hashes=$(gbd get "local like %sat2014/application/atco%")
gbd set -f -n family -v scheduling $hashes
#sat2013
hashes=$(gbd get "local like %bebel_yuen--factoring%")
gbd set -f -n family -v integer-factorization $hashes
hashes=$(gbd get "local like %biere--tph%")
gbd set -f -n family -v pigeonhole $hashes
hashes=$(gbd get "local like %biere_heule_jarvisalo_manthey--hwmcc12miters%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %heule--randomMUS%")
gbd set -f -n family -v random-mus $hashes
hashes=$(gbd get "local like %heule_szeider--cwd%")
gbd set -f -n family -v clique-width $hashes
hashes=$(gbd get "local like %kovasznai_frohlich_biere--smtbench%")
gbd set -f -n family -v bitvector $hashes
hashes=$(gbd get "local like %kummling_grosmann--pesp%")
gbd set -f -n family -v scheduling $hashes
hashes=$(gbd get "local like %manthey--hidoku%")
gbd set -f -n family -v scheduling $hashes
hashes=$(gbd get "local like %mayer-eichberger--4col%")
gbd set -f -n family -v k-coloring $hashes
hashes=$(gbd get "local like %mayer-eichberger--carseq%")
gbd set -f -n family -v scheduling $hashes
hashes=$(gbd get "local like %mugrauer_balint--GI%")
gbd set -f -n family -v graph-isomorphism $hashes
hashes=$(gbd get "local like %mugrauer_balint--LABS%")
gbd set -f -n family -v autocorrelation $hashes
hashes=$(gbd get "local like %nossum--sha1%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %soos--grainofsalt%")
gbd set -f -n family -v generator $hashes
hashes=$(gbd get "local like %surynek--gridMRPP%")
gbd set -f -n family -v planning $hashes
hashes=$(gbd get "local like %heule_weaver--arc4%")
gbd set -f -n family -v cryptography $hashes




#general
hashes=$(gbd get "local like %sokoban%")
gbd set -f -n family -v planning $hashes
hashes=$(gbd get "local like %sortnet%")
gbd set -f -n family -v sorting-networks $hashes
hashes=$(gbd get "local like %/sgen%")
gbd set -f -n family -v generator $hashes
hashes=$(gbd get "local like %/Schur%")
gbd set -f -n family -v schur-coloring $hashes
hashes=$(gbd get "local like %/php% or local like %/phnf%")
gbd set -f -n family -v pigeonhole $hashes
hashes=$(gbd get "local like %/fdmus%")
gbd set -f -n family -v fdmus $hashes
hashes=$(gbd get "local like %/rbsat%")
gbd set -f -n family -v generator $hashes

#general
hashes=$(gbd get "local like %/velev%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %vliw_%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %/manol-%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %/ibm-%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %/goldb-%")
gbd set -f -n family -v hardware-model-checking $hashes
hashes=$(gbd get "local like %/llbmc-%")
gbd set -f -n family -v software-verification $hashes
hashes=$(gbd get "local like %/vmpc%")
gbd set -f -n family -v cryptography $hashes
hashes=$(gbd get "local like %/transport%")
gbd set -f -n family -v planning $hashes
hashes=$(gbd get "local like %/openstacks%")
gbd set -f -n family -v planning $hashes
hashes=$(gbd get "local like %/aaai10-%")
gbd set -f -n family -v planning $hashes
hashes=$(gbd get "local like %/rphp%")
gbd set -f -n family -v pigeonhole $hashes

#general
hashes=$(gbd get "local like %/VanDerWaerden%")
gbd set -f -n family -v waerden-numbers $hashes

