ENTRY
{
  author
  title
  publisher
  journal
  address
  year
  date
  pages
  translator
  booktitle
  institution
  country
  url
  volume
  number
  type
  id
  note
  language
}
{ entry.lang entry.is.electronic entry.numbered }
{ label extra.label sort.label short.list entry.mark entry.url }

STRINGS { s t}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

INTEGERS { lang.zh lang.ja lang.en lang.ru lang.other }

INTEGERS { charptr len }

INTEGERS { byte second.byte }

INTEGERS { char.lang tmp.lang }

STRINGS { tmp.str }

FUNCTION {get.str.lang}
{ 'tmp.str :=
  lang.other 'tmp.lang :=
  #1 'charptr :=
  tmp.str text.length$ #1 + 'len :=
    { charptr len < }
    { tmp.str charptr #1 substring$ chr.to.int$ 'byte :=
      byte #128 <
        { charptr #1 + 'charptr :=
          byte #64 > byte #91 < and byte #96 > byte #123 < and or
            { lang.en 'char.lang := }
            { lang.other 'char.lang := }
          if$
        }
        { tmp.str charptr #1 + #1 substring$ chr.to.int$ 'second.byte :=
          byte #224 <
            { charptr #2 + 'charptr :=
              byte #207 > byte #212 < and
              byte #212 = second.byte #176 < and or
                { lang.ru 'char.lang := }
                { lang.other 'char.lang := }
              if$
            }
            { byte #240 <
                { charptr #3 + 'charptr :=
                  byte #227 > byte #234 < and
                    { lang.zh 'char.lang := }
                    { byte #227 =
                        { second.byte #143 >
                            { lang.zh 'char.lang := }
                            { second.byte #128 > second.byte #132 < and
                                { lang.ja 'char.lang := }
                                { lang.other 'char.lang := }
                              if$
                            }
                          if$
                        }
                        { byte #239 =
                          second.byte #163 > second.byte #172 < and and
                            { lang.zh 'char.lang := }
                            { lang.other 'char.lang := }
                          if$
                        }
                      if$
                    }
                  if$
                }
                { charptr #4 + 'charptr :=
                  byte #240 = second.byte #159 > and
                    { lang.zh 'char.lang := }
                    { lang.other 'char.lang := }
                  if$
                }
              if$
            }
          if$
        }
      if$
      char.lang tmp.lang >
        { char.lang 'tmp.lang := }
        'skip$
      if$
    }
  while$
  tmp.lang
}

FUNCTION {check.entry.lang}
{ author field.or.null
  title field.or.null *
  get.str.lang
}

FUNCTION {set.entry.lang}
{ language empty$
    { check.entry.lang }
    { language "english" = 
        { lang.en }
        { language "chinese" =
            { lang.zh }
            { check.entry.lang }
          if$
        }
      if$
    }
  if$
  'entry.lang :=
}


INTEGERS{ l }
FUNCTION{ string.length }
{
    #1 'l :=
    {duplicate$ duplicate$ #1 l substring$ = not}
        {l #1 + 'l :=}
    while$
    pop$ l
}

FUNCTION {get.last.chr} {
  duplicate$ string.length
  duplicate$ #0 = {
    pop$
  } {
    #1 substring$
  } if$
}

FUNCTION {trim.start} {
  {duplicate$ #1 #1 substring$ " " =} {
    #2 global.max$ substring$
  } while$
}

FUNCTION {trim.end} {
  {duplicate$ get.last.chr " " =} {
    duplicate$ string.length #1 -
    #1 swap$ substring$
  } while$
}

FUNCTION {trim} {
  trim.start
  trim.end
}

FUNCTION {bbl.etal}
{ 
  "et~al."
}


FUNCTION {bib.begin}
{
    "\begin{thebibliography}{lo}"
    write$ newline$
    "\interlinepenalty=10000"
    write$ newline$
    "\setlength{\itemsep}{0bp}\setlength{\parskip}{0pt}\small"
    write$
    newline$
}

FUNCTION {bib.end}
{
    "\end{thebibliography}"
    write$
    newline$
}

FUNCTION {bibitem.begin}
{
    "\bibitem{" cite$ *
    "} " *
    write$
}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }


STRINGS  { bibinfo}

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                {
                  " " * bbl.etal *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {format.authors}
{
    author "author" format.names
}

FUNCTION {format.title}
{
    title "t" change.case$
}

FUNCTION {format.publisher}
{
    publisher
}

FUNCTION {format.booktitle}
{
    booktitle
}


FUNCTION {format.journal}
{
    journal
}

FUNCTION {format.address}
{
    address
}

FUNCTION {format.year}
{
    year
}

FUNCTION {format.date}
{
    date
}

FUNCTION {format.country}
{
    country
}

FUNCTION {format.type}
{
    type
}

FUNCTION {format.id}
{
    id
}

STRINGS{replace find text}
INTEGERS{find_length}
FUNCTION{find.replace}
{
    'replace :=
    'find :=
    'text :=
    find string.length 'find_length :=
    ""
        { text empty$ not }
        { text #1 find_length substring$ find =
            {
                replace *
                text #1 find_length + global.max$ substring$ 'text :=
            }
            {
                text #1 #1 substring$ *
                text #2 global.max$ substring$ 'text :=
            }
        if$
    }
    while$
}

FUNCTION {format.pages}
{
    pages "--" "-" find.replace
}

FUNCTION {format.institution}
{
    institution
}

FUNCTION {format.url}
{
    "\url{" url *
    "}" *
}
FUNCTION {add.period}
{
    ". " write$
}

FUNCTION {add.comma}
{
    ", " write$
}

FUNCTION {book}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[M]" * write$ add.period
    translator missing$
    'skip$
    {
        "(" translator "translator" format.names *
        ")" * write$
        add.period
    } if$
    address missing$
    'skip$
    {
    	format.address write$ ": " write$
    } if$
    format.publisher write$ add.comma
    format.year write$
    pages missing$
    'skip$
    {
    	add.comma
    	format.pages write$
    } if$
    newline$
}

FUNCTION {incollection}
{
    book
}

FUNCTION {conference}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[C]" * write$ add.period
    journal missing$
    {
        format.booktitle write$
    } {
        format.journal write$
    } if$

    add.comma
    address missing$
    'skip$
    {
    	format.address write$ add.comma
    } if$
    format.year write$ add.comma
    format.pages write$
    newline$
}

FUNCTION {proceedings}
{
    conference
}

FUNCTION {inproceedings}
{
    conference
}

FUNCTION {article}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[J]" * write$ add.period
    format.journal write$ add.comma
    format.year write$ 
	
	volume missing$
	{
        number missing$
		{
		} {
		    "(" write$ 
			number ")" * write$
		 } if$
    } {
	    number missing$
		{
		   add.comma 
		 	volume  "" * write$
		} {
			add.comma
			volume "(" *
		 	number *
			")" * write$
		 } if$
    } if$
	 ": "  write$
    format.pages write$
    newline$
}

FUNCTION {thesis}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[D]" * write$ add.period
    address missing$
    'skip$
    {
    	format.address write$ ": " write$
    } if$
    format.institution write$ add.comma
    format.year write$ add.comma
    format.pages write$
    newline$
}

FUNCTION {masterthesis}
{
    thesis
}

FUNCTION {phdthesis}
{
    thesis
}

FUNCTION {newspaper}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[N]" * write$ add.period
    journal missing$
    {
        format.booktitle write$
    } {
        format.journal write$
    } if$
    add.comma

    format.date write$
    newline$
}

FUNCTION {techreport}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[R]" * write$ add.period
    address missing$
    'skip$
    {
    	format.address write$ ": " write$
    } if$
    format.institution write$ add.comma
    format.date write$
    newline$
}

FUNCTION {patent}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[P]" * write$ add.period
    format.country write$ add.comma
    format.type write$ add.comma
    format.id write$ add.comma
    format.date write$
    newline$
}

FUNCTION {standard}
{
    bibitem.begin
    format.institution write$ add.period
    format.id write$ add.period
    format.title "[S]" * write$ add.period
    format.address write$ ": " write$
    format.publisher write$ add.comma
    format.date write$
    newline$
}

FUNCTION {digital}
{
    bibitem.begin
    format.authors write$ add.period
    format.title write$
    "[" format.type * "]" * write$ add.period
    format.url write$ add.comma
    format.date write$
    newline$
}

FUNCTION {onlynote}
{
	bibitem.begin
    note write$
    newline$
}

READ

EXECUTE {bib.begin}

ITERATE {call.type$}

EXECUTE {bib.end}
