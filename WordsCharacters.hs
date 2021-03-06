module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/question/conversation/work/summer/Summer.pgf"

cat2funs :: String -> IO [CId]
cat2funs cat = do
	gr' <- gr
	let fs = functionsByCat gr' (mkCId cat)
	let ws = filter (isLower . head . showCId) fs
	let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x || isNumber x) . reverse .showCId ) ws
	return (map mkCId is )

gfWords :: [(String, IO [CId])]
gfWords = [
	("A",a)
	, ("Adv",adv)
	-- , ("Aux",aux)
	, ("Conj",conj)
	, ("Det",det)
	, ("N",n)
	, ("CN",cn)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	-- , ("Rel",rel)
	, ("Tag",tag)
	, ("V",v)
	, ("V2",v2)
	, ("V3",v3)
	, ("VV",vv)
	, ("VS",vs)
	, ("V2A",v2a)
	]

posName :: String -> String
posName "A"	= "Adjective"
posName "Adv"	= "Adverb"
posName "Aux"	= "Auxiliary"
posName "Conj"	= "Conjunction"
posName "Det"	= "Determiner"
posName "N"	= "Uncount Noun"
posName "CN"	= "Count Noun"
posName "PN"	= "Proper Noun"
posName "Pron"	= "Pronoun"
posName "Prep"	= "Preposition"
posName "Rel"	= "Relative Pronoun"
posName "Tag"	= "Question Tag"
posName "V"	= "Verb"
posName "V2"	= "Verb + object"
posName "V3"	= "Verb + obj1 + obj2"
posName "VV"	= "Verb + verb"
posName "VS"	= "Verb + sentence"
posName "V2S"	= "Verb + object + sentence"
posName "V2A"	= "Verb + object + adjective"


a	= cat2funs "AP"
adv	= cat2funs "Adv"
conj	= cat2funs "Conj"
det	= cat2funs "Det"
n	= cat2funs "N"
cn	= cat2funs "CN"
pn	= cat2funs "PN"
prep	= cat2funs "Prep"
pron	= cat2funs "NP"
v	= cat2funs "V"
v2	= cat2funs "V2"
v3	= cat2funs "V3"
vv	= cat2funs "VV"
vs	= cat2funs "VS"
v2a	= cat2funs "V2A"
tag = return ( map mkCId tags )





aux = [
	"doesn't"
	, "don't"
	, "does"
	, "do"
	, "is"
	, "are"
	, "isn't"
	, "aren't"
	, "would"
	, "should"
	]
	

rel = [


	]

tags = [
	"doesn't he"
	, "doesn't she"
	, "doesn't it"
	, "don't they"
	, "does he"
	, "does she"
	, "does it"
	, "do they"
	, "isn't he"
	, "isn't she"
	, "isn't it"
	, "aren't they"
	, "is he"
	, "is she"
	, "is it"
	, "are they"
	]

{-


activity	: CN;
adult	: CN;
afternoon	: CN;
again	: Adv_time;
also	: AdV;
a lot of	: Predet;
amusement park	: CN;
answer	: V2;
around_PREP	: Prep;
as_ATTRIBUTEPREP	: AttributePrep;
as long as	: Subj;
at_LOCPREP	: LocPrep;
at_TIMEPREP	: TimePrep;
by_THEMEPREP	: ThemePrep;
call	: CN;
call	: V2;
Carlos	: PN;
cartoon character	: CN;
chef	: CN;
choose	: V2;
company	: CN;
computer	: CN;
costume	: CN;
crazy	: AP;
cut up	: V;
dish	: CN;
drive	: V2A;
earn	: V2;
easy	: AP;
educational	: AP;
eight	: Det;
eleven	: Det;
for_BENEFICIARYPREP	: BeneficiaryPrep;
from_SOURCEPREP	: SourcePrep;
from_TIMEPREP	: TimePrep;
full-time	: Adv_manner;
fun	: N;
game	: CN;
get	: V2;
get	: VV;
get	: VA;
help	: V2V;
hot	: AP;
hour	: CN;
how
in_TIMEPREP	: TimePrep;
in_LOCPREP	: LocPrep;
in_MANNERPREP	: MannerPrep;
interesting	: AP;
intern	: CN;
into_STIMULUSPREP	: StimulusPrep;
job	: CN;
just	: AdV;
kid	: CN;
kitchen	: PlaceNoun;
landscaper	: CN;
landscaping	: N;
learning center	: PlaceNoun;
make	: V2;
Mark	: PN;
marketer	: CN;
marketing	: N;
meat	: N;
money	: N;
much more	: Adv;
much	: AdA;
at night	: Adv_time;
not
of
on_THEMEPREP	: ThemePrep;
one	: Det;
over_MANNERPREP	: MannerPrep;
own	: AP;
Paul	: PN;
people
phone	: CN;
problem	: CN;
read	: V2;
realize	: VQ;
really	: AdA;
restaurant	: CN;
run	: V2;
script	: CN;
sell	: V3;
she
show	: V3;
show	: V3;
since	: Subj;
started	: AP;
telephone	: CN;
than
the
their
there
they
thing
think	: VS;
this
those
to_RECIPIENTPREP	: RecipientPrep;
take	: V2;
Tracy	: PN;
try	: VV;
tutor	: CN;
two	: Det;
until_TIMEPREP	: TimePrep;
vegetable	: CN;
walk	: V2;
wash	: V2;
when	: Subj;
who
will
with_COAGENTPREP	: CoagentPrep;
Wonda	: PN;
working
work	: V;
you
young	: AP;

-- 5th edition

again	: Adv;
and	: Conj;
another	: Det;
answer	: V2;
as
ask	: V2S;
at_LOCPREP	: LocPrep;
beach resort	: CN;
being
camp counselor	: CN;
challenging	: AP;
college credits	: CN;
could	: VV;
a couple of	: Det;
earn	: V2;
email	: CN;
Emma	: PN;
enjoy	: V2;
for_BENEFICIARYPREP	: BeneficiaryPrep;
for
from_SOURCEPREP	: SourcePrep;
from_TIMEPREP	: TimePrep;
from
get	: V2;
get	: VV;
get	: VA;
get
intern	: CN;
internship	: CN;
job	: CN;
job
kind	: CN;
lead	: CN;
more
much
news website	: CN;
one of	: Predet;
opening	: CN;
pay	: V2;
post	: CN;
reader	: CN;
really	: AdA;
say	: VS;
summer camp	: CN;
summer job	: CN;
than
think	: VS;
Tyler	: PN;
work	: N;
would	: VV;
-}

-- vim: set ts=2 sts=2 sw=2 noet:
