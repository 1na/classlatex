#include <oxstd.h>
//version 1.0

class Latex
{     
public:
	Latex (const filename, ...);   	/* constructor */
	/*init the file then write the class, preamble and declarations */
	/*constructor has a variable number of arguments */
	/*the version with 1 arguments expects just the filename and path of
	  the latex output file, the version with more arguments additionally expects options. */
	/* Options
		"%c", compiles latex if you supply a valid output directory,
		"%w", width of the object, textwidth or textheight for landscape is default, you can use also
		\marginparwidth, or some absolute like x cm or y in, legal are also pt, em, ex and mm,
		"%p", can be all regular latex papers (a4paper, letterpaper, a5paper, b5paper, executivepaper,
		and legalpaper),
		"%ro", rotate (landscape), the document, experimental feature.*/

	~Latex();						/* destructor */

	GetPackageVersion();
	
	table ( ...);
	/* expects any of the following pairs of variables:
		"%h", string, goes above the table centered across columns,
		"%hc", count of header rows, default is 1,
		"%r", array of string, rowheaders last one should be for the total
		"%c", array of strings, column headers
		"%b", matrix of body (the numbers)
		"%t", matrix of totals
		"%l", string with the caption
		"%i", caption position can be above or below
		"%f", string with number format
		"%x", string for reference
		"%e", extra string after bottomrule but within tabular
		"%lo", value 1 results in lower diagonal print only, usefull for correlation matrix,
		"%sz", suppress zeros in table in favor of this string,
		"%ro", value 1 rotates table counterclockwise 90 degrees,
		"%td", table definition, the columns you want, defaults to a usefull set.*/

	line (const b);					/* line of text */
	
	distbar ( ...);					
	/* expects any of the following pairs of variables:
		"%pd", vector with percentile distribution to show default is given;
		"%b", matrix of body (the numbers) the distribution to show in this case, will be vectorized to
			form one distribution;
		"%h", string, goes above the table centered across columns;
		"%l", string with the caption;
		"%f", string with number format, default is set to 1 decimal;
		"%fe", string with number format extension, can be used to insert a %, default empty;
		"%x", string for reference;
		"%i", caption position above or below, defaults to below;
		"%dt", thickness of the bar, default 1 is sensible;
		"%dl", position from the left textmargin, default 0.1 is sensible;
		"%rc", right color is shade, default white;
		"%lc", left color in shade, default red;
		"%o", include one point no or yes, default is yes;
		"%c", string to name the distribution. */

	cfdist ( ...);
	/* expects any of the following pairs of variables:
		"%pd", matrix with percentile distributions to show,
		"%mm", matrix with exact means,
		"%b", matrix of body (the numbers) the distribution to show in this case,
		"%xv", vector of xlabels, defaults to year 1, 2 etc, 
		"%h", string, goes above the table centered across columns,
		"%l", string with the caption,
		"%f", string with number format for the labels, default is set to 1 decimal,
		"%x", string for reference,
		"%i", latex.above or latex.below caption position above or below, defaults to below 
		"%dt", double, thickness of the bar, default 1 is sensible,
		"%dl", double, position from the left textmargin, default 0.1 is sensible,
		"%rc", string, right color is shade, default white,
		"%lc", string, left color in shade, default red,
		"%o", latex.yes or latex.no include one point no or yes, default is yes,
		"%c", string to name the distribution.
		"%w", double width widt of bars, default is 0.5,this works well
		"%n", string, text width node to place in graph*/

	density ( ...);
	/* expects any of the following pairs of variables:
		"%pd", matrix with percentile distributions to show, default all observation;
		"%b", matrix of body (the numbers) the distribution to show in this case;
		"%h", string, goes above the table centered across columns;
		"%l", string with the caption;
		"%f", string with number format for labels on x-axis, default calculated;
		"%x", string for reference;
		"%i", caption position above or below, defaults to below;
		"%dt", thickness of the bar, default 1 is sensible;
		"%dl", double, position from the left textmargin, default 0.1 is sensible;
		"%ac", array of strings, colors for the distributions;
		"%an", (array of) strings to name the distribution(s);
		"%w", double width of bars, default is 0.5,this works well;
		"%n", string, text width node to place in graph;
		"%dh", double, smoothing constant in kernel defaults to 0.39;
		"%bp", string "points" plots the exact points of the distribution iso smooth intervals;
		"%fe", format extension, can be used to add someting (% eg.);
		"%xl", label to put on the x-axis, default is x;
		"%yl", label to put on the y-axis, default is p(x);
		"%gr", string of "coarse", "yes", "fine" or "no" for the grid coarse and yes same result;
		"%gc", string with grid parameters, default is sensible*/

	graph (...);
	/* expects any of the following pairs of variables:
		"%b", matrix of body (the numbers) the distribution to show in this case with the data in columns;
		"%nx", number of x-series, defaults to one, can only be equal to no of y-series or one;
		"%h", string, goes above the table centered across columns;
		"%l", string with the caption;
		"%f", string with number format, default is set to 1 decimal;
		"%x", string for reference;
		"%i", caption position above or below, defaults to below;
		"%dl", position from the left textmargin, default 0.1 is sensible;
		"%ac", right color is shade, default white;
		"%an", (array of) strings to name the distribution(s);
		"%n", text width node to place in graph;
		"%fe", format extension can be used to add percentage for exa. ("\%");
		"%xl", label to put on the x-axis, default is x;
		"%yl", label to put on the y-axis, default is p(x);
		"%gr", string of either "coarse", "yes", "fine", "no" for the grid, coarse and yes same result;
		"%gc", string with grid parameters, default is sensible.*/

	bargraph (...);
	
	newpage ();
	Push (const dX1, const dY1, const dX2, const dY2, const dMean, const dMedian, const dLabel);
			/* adds a box to the stack */
	Pop (const addX1, const addY1, const addX2, const addY2, const addIndex, const addPattern, const addLabel);
		/* takes one of stack */
	Add(); 	/* make room on stack */
	Reduce(); /* reduce stack */
	DrawBox(const dx, const dy, const dx2, const dy2, const sleftc, const srightc );
	DrawCF(const sleftc, const srightc, const dmin, const dmax, const dmaxx, const dwx, const dtick, const sformat);
	MakeTicks (dlimits, asformat);
	DrawGraph(my, mx, const acolor, const aname, const dminy,
		const dmaxy, const dminx, const dmaxx, const dtick, const sformat,
		const sxfe, const sxl, const syl, const sgr, const sgcolor);
	GetCount ();	/* give back number onstack */
	Interval(const vobs, const avint);
	decl m_i;
	decl inputfile;
	decl output;
	enum {above, below};
	enum {no, yes};
	decl strwidth;
protected:
//	static const decl inputfilename = "DCFPreamble.tex";
	static const decl StackIncrement =  100;
	decl m_mA, dirout, filename;
	const decl m_cols;
	static const decl dgr = 0.618033989;	  /* height = width x dgr */
}
Latex::Push (const dX1, const dY1, const dX2, const dY2, const dMean, const dMedian, const dLabel)
{
	if ( ! (m_i + 1 < rows(m_mA) ))
	{
		Add();
	}
	m_i ++;
	m_mA[m_i][] = dX1~dY1~dX2~dY2~dMean~dMedian~dLabel;

}
Latex::Pop (const addX1, const addY1, const addX2, const addY2, const addMean, const addMedian, const addLabel)
{
	if (m_i > -1)
	{
		addX1[0] 	= m_mA[m_i][0];
		addY1[0] 	= m_mA[m_i][1];
		addX2[0] 	= m_mA[m_i][2];
		addY2[0] 	= m_mA[m_i][3];
		addMean[0] = m_mA[m_i][4];
		addMedian[0] = m_mA[m_i][5];
		addLabel[0] = m_mA[m_i][6];
		m_i --;
		if (m_i < rows(m_mA) - StackIncrement - 1)
		{
			Reduce(); /* reduce stack */
		}
	}
}
Latex::Add()
{	m_mA = m_mA | new matrix [StackIncrement][m_cols];	}
Latex::Reduce()
{	m_mA = m_mA[rows(m_mA) - StackIncrement:][];	}
Latex::GetCount ()
{	return m_i;	}
Latex::Latex (const name, ...)
{
	decl args = va_arglist(), i;
	strwidth = "\\textwidth";
	decl strpaper = "notitlepage,a4paper";
	decl strclass = "article";
	decl brot = 0;
	dirout = "";
    for (i = 0; i < sizeof(args); i++)
	{
		if 		( args[i] == "%c" )
		{	dirout = args[i+1]; i++; }
		else if ( args[i] == "%w" )
		{	strwidth = args[i+1]; i++; }
		else if ( args[i] == "%p" )
		{	strpaper = args[i+1]; i++; }
		else if ( args[i] == "%c" )
		{ 	strclass = args[i+1]; i++; }
		else if ( args[i] == "%ro" )
		{ 	brot = args[i+1]; i++; }
	}
	filename = name;
	output = fopen(filename,"w");
	//headerimplementation
	decl aheader = {
	"%*************\n",
	"%preamble \n", 
	"%*************\n", 
	sprint("\t\documentclass[",strpaper)};
	if (brot == 1) {
		aheader ~= sprint(", landscape");
	}
	aheader ~= {sprint("]{", strclass,"}\n "),
	" \n"};
	aheader ~= {
	"%**********\n", 
	"%packages\n",
	"%**********\n",
	"\t\usepackage[english]{babel}%required allways\n",
	"\t\usepackage{booktabs}\t%required for bookstyle tables, without these the tables will have to be redraw\n",
	" \n",	
	"\t\usepackage{tikz}\t\t% required for linestyle graphics\n",
	"\t\usetikzlibrary{patterns}% required for fill styles\n",
	"\t\usetikzlibrary{plotmarks}% required for fill styles\n",
	"\t\usepgfmodule{plot}\t\t% for plots of functions\n",
	" \n",
	"\t\usepackage{float} \t\t% required for example and excercise styles\n",
	" \n",
	"\t\usepackage[intlimits]{amsmath}%provide option intlimits to\n",
	"\t\t\t\t% give boundaries of limits above/below integral sign\n",
	"\t\usepackage{rotating} \t%required for rotated tables\n",
	"\t\usepackage{graphicx} \t%required for including external graphics files\n",
	"\t\usepackage{caption}\n",
	"\t\usepackage[official]{eurosym}\n",
	" \n"};
	if (strfind(strwidth, "\\")==-1){
		aheader ~= {"\t\\newcommand{\mywidth}{", strwidth, "}\n"};
		strwidth = "*\mywidth";
	}
	aheader ~= {
	"%*************\n", 
	"%declarations\n",
	"%*************\n",
	"\t\setlength{\\topmargin}{0in}\n",
	"\t\setlength{\\textheight}{641pt}\n",
	"%\t\setlength{\oddsidemargin}{11pt}\n",
	"%\t\setlength{\evensidemargin}{11pt}\n",
	"%\t\setlength{\\textwidth}{431pt}\n",
	" \n",
	"\\begin{document}\n"};

	if (brot == 1 && strwidth == "\\textwidth"){
		strwidth = "\\textheight";
	}
	for (decl i = 0; i < sizeof(aheader); i++) {
		fwrite (output, aheader[i]); }


	m_cols = 7; // number of fields in the stack
	m_mA = new matrix [0][m_cols]; // implements stack
	m_i = -1; // stack is emplty
}

Latex::~Latex ()
	/* write closing of inputfile and close inputfile possibly call texify */
{
	fwrite (output, "\end{document} \n");
	fclose (output);
	if (dirout != "") {
		println (dirout);
		if (chdir(dirout)){
			print(getcwd());			
			println("\"C:/Program Files/MikTex/miktex/bin/texify\" -c -p --run-viewer "+filename);
			if (!systemcall("\"C:/Program Files/MikTex/miktex/bin/texify\"  -p --run-viewer "+filename)){
				println ("compile succesfull");
			}
		}
	}
}

Latex::GetPackageVersion()
{	return "1.0";	}
Latex::table( ...)
{
    decl args = va_arglist();
	decl i, j;
	decl captionpos = below;
	decl arowheader =0, mbody =0, acolheader =0, mtotals = <>, header = 0, slabel = 0,	sref = 0, sformat = "%#6.2f";
	decl iheader = 1, sextra = "", blow = 0, sz = "", bro = 0, std = "";
	/* figure out contents */
    for (i = 0; i < sizeof(args); i++)
	{
		if 		( args[i] == "%h" )
		{	header = args[i+1]; i++; }
		else if ( args[i] == "%hc" )
		{	iheader = args[i+1]; i++; }
		else if ( args[i] == "%r" )
		{	arowheader = args[i+1]; i++; }
		else if ( args[i] == "%c" )
		{ 	acolheader = args[i+1]; i++; }
		else if ( args[i] == "%b" )
		{ 	mbody = args[i+1]; i++; }
		else if ( args[i] == "%t" )
		{	mtotals = args[i+1]; i++; }
		else if ( args[i] == "%l" )
		{	slabel = args[i+1]; i++; }
		else if ( args[i] == "%i" )
		{	captionpos = args[i+1]; i++; }
		else if ( args[i] == "%f" )
		{	sformat = args[i+1]; i++;}
		else if ( args[i] == "%x" )
		{	sref = args[i+1]; i++; }
		else if ( args[i] == "%e" )
		{	sextra = args[i+1]; i++; }
		else if ( args[i] == "%lo" )
		{	blow = args[i+1]; i++; }
		else if ( args[i] == "%sz" )
		{	sz = args[i+1]; i++; }
		else if ( args[i] == "%ro" )
		{	bro = args[i+1]; i++; }
		else if ( args[i] == "%td" )
		{	std = args[i+1]; i++; }
	}
	/* count columns */
	decl icolumns = columns (mbody);
	/* write top bit */
	if (bro) {
		fwrite(output, "\n\\begin{sidewaystable}[!h]\n");
	} else {
		fwrite(output, "\n\\begin{table}[!h]\n");
	}
	fwrite(output, "\t\centering\n");
	if (captionpos == above) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption*{", slabel, "}\n");
		}
	}
	/* table header */
	fwrite(output, "\t\\begin{tabular}{");
	if (std == ""){
		fwrite(output, "l ");
		for (i = 0 ; i < icolumns; i++ )
		{
			fwrite(output, "r ");
		}
	} else {
		fwrite(output, std);
	}
	fwrite(output, "}\n");
	if (columns (header) >0 )
	{
		if (columns (arowheader) > 0)
		{
			fprint (output, "\t\t\multicolumn{", icolumns+1, "}{c}{", header, "}\\\\\n");
		}
		else
		{
			fprint (output, "\t\t\multicolumn{", icolumns, "}{c}{", header, "}\\\\\n");
		}
	}
	fwrite(output, "\t\t\\toprule\n\t\t");
	/* meat of the table */
	if (columns (mtotals) != columns (mbody) && (columns(mtotals) > 0) ) 
	{	
		fprint(output, "\t\\Message from classLatex:table. ", 
			sprint("Number of columns in body (", columns(mbody),
			") is not equal to number of columns in totals (", columns(mtotals),
			" don't know how to make a table of this, trying to die gracefully"));
	}
	else
	{
		if (columns (arowheader) > 0) {
			icolumns ++;
			if (columns(acolheader) == icolumns -1) {
				acolheader = {""}~acolheader;
			}
		}
		/* header rows */ 
		if ( columns(acolheader) > 0 )
		{
			for ( i=0; i < iheader; i++)
			{
				for ( j=0; j < icolumns -1 ; j++)
				{
					if (columns(acolheader) > (i*(icolumns))+j ) {
						fprint (output, acolheader[(i*(icolumns))+j], " & ");
					}
					else {
						fprint (output, " & ");
					}
				}
				if (columns(acolheader) > (i*(icolumns))+j ) {
					fprint (output, acolheader[(i*(icolumns))+j], "\\\\\n\t\t ");
				}
				else {
					fprint (output, "\\\\\n");
				}
			}
			fprint (output, "\t\t\midrule \n\t\t");
		}
		if (columns (arowheader) > 0) {		   /* we have row headers */
			/* table rows first n-1 */	
			if (blow && (rows(mbody) == columns(mbody))) { /* only lower triangle */
				for ( i = 0; i < rows(mbody) -1 ; i++)
				{
					if (columns(arowheader)>i+1)
					{
						fprint (output,  arowheader[i] , " & ");
					}
					else
					{
						fprint (output, " & ");
					}
					for ( j=0; j < i ; j++)
						{
							if (mbody[i][j] == 0 && sizeof(sz) > 0) {
								fprint (output, sz, " &");
							}
							else
							{
								fprint (output, sformat, mbody[i][j], " &");
							}
						}
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz);
					}
					else
					{
						fprint (output, sformat, mbody[i][j]);
					}
					fprint (output, "\\\\\n\t\t");
				}
				/* table rows, last row */
				if (columns(arowheader)>i)
				{
					fprint (output,  arowheader[i] , " & ");
				}
				else
				{
					fprint (output, " & ");
				}
				for ( j=0; j < i ; j++)
				{
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz, " &");
					}
					else
					{
						fprint (output, sformat, mbody[i][j], " &");
					}

				}
				if (mbody[i][j] == 0 && sizeof(sz) > 0) {
					fprint (output, sz);
				}
				else
				{
					fprint (output, sformat, mbody[i][j]);
				}

				fprint (output, "\\\\\n");

			}
			else /* full matrix */
			{
				for ( i = 0; i < rows(mbody) -1 ; i++)
				{
					if (columns(arowheader)>i+1)
					{
						fprint (output,  arowheader[i] , " & ");
					}
					else
					{
						fprint (output, " & ");
					}
					for ( j=0; j < columns(mbody) -1 ; j++)
					{
						if (mbody[i][j] == 0 && sizeof(sz) > 0) {
							fprint (output, sz, " &");
						}
						else
						{
							fprint (output, sformat, mbody[i][j], " &");
						}
					}
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz);
					}
					else
					{
						fprint (output, sformat, mbody[i][j]);
					}

					fprint (output, "\\\\\n\t\t");
				}
				/* table rows, last row */
				if (columns(arowheader)>i)
				{
					fprint (output,  arowheader[i] , " & ");
				}
				else
				{
					fprint (output, " & ");
				}
				for ( j=0; j < columns(mbody) -1 ; j++)
				{
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz, " &");
					}
					else
					{
						fprint (output, sformat, mbody[i][j], " &");
					}

				}
				if (mbody[i][j] == 0 && sizeof(sz) > 0) {
					fprint (output, sz);
				}
				else
				{
					fprint (output, sformat, mbody[i][j]);
				}

				fprint (output, "\\\\\n");
				
				/* total row */
				if (columns(mbody) == columns(mtotals)) {
					fprint (output, "\t\t\midrule \n\t\t");
					if (columns(arowheader) > i+1)
					{
						fprint (output, arowheader[i+1], " & ");
					}
					else
					{
						fprint (output, "Total");
					}
					for ( j=0; j < columns(mtotals) -1 ; j++)
					{
						if (mtotals[0][j] == 0 && sizeof(sz) > 0) {
							fprint (output, sz, " &");
						}
						else
						{
							fprint (output, sformat, mtotals[0][j], " &");
						}
					}
					if (mtotals[0][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz);
					}
					else
					{
						fprint (output, sformat, mtotals[0][j]);
					}
					fprint (output, "\\\\\n");
				}
			}
		}
		else	/* we have no row headers */
		{
			if (blow && (rows(mbody) == columns(mbody))) { /* only lower triangle */
				for ( i = 0; i < rows(mbody) -1 ; i++)
				{
					if (columns(arowheader)>i+1)
					{
						fprint (output,  arowheader[i] , " & ");
					}
					else
					{
						fprint (output, " & ");
					}
					for ( j=0; j < i ; j++)
					{
						if (mbody[i][j] == 0 && sizeof(sz) > 0) {
							fprint (output, sz, " &");
						}
						else
						{
							fprint (output, sformat, mbody[i][j], " &");
						}

					}
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz);
					}
					else
					{
						fprint (output, sformat, mbody[i][j]);
					}

					fprint (output, "\\\\\n\t\t");
				}
				/* table rows, last row */
				if (columns(arowheader)>i)
				{
					fprint (output,  arowheader[i] , " & ");
				}
				else
				{
					fprint (output, " & ");
				}
				for ( j=0; j < i ; j++)
				{
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz, " &");
					}
					else
					{
						fprint (output, sformat, mbody[i][j], " &");
					}

				}
				if (mbody[i][j] == 0 && sizeof(sz) > 0) {
					fprint (output, sz);
				}
				else
				{
					fprint (output, sformat, mbody[i][j]);
				}

				fprint (output, "\\\\\n");
			}
			else /* full matrix */
			{
				/* table rows first n-1 */	
				for ( i = 0; i < rows(mbody) -1 ; i++)
				{
					for ( j=0; j < columns(mbody) -1 ; j++)
					{
						if (mbody[i][j] == 0 && sizeof(sz) > 0) {
							fprint (output, sz, " &");
						}
						else
						{
							fprint (output, sformat, mbody[i][j], " &");
						}

					}
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz);
					}
					else
					{
						fprint (output, sformat, mbody[i][j]);
					}

					fprint (output, "\\\\\n\t\t");
				}
				/* table rows, last row */
				for ( j=0; j < columns(mbody) -1 ; j++)
				{
					if (mbody[i][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz, " &");
					}
					else
					{
						fprint (output, sformat, mbody[i][j], " &");
					}

				}
				if (mbody[i][j] == 0 && sizeof(sz) > 0) {
					fprint (output, sz);
				}
				else
				{
					fprint (output, sformat, mbody[i][j]);
				}

				fprint (output, "\\\\\n");
				
				/* total row */
				if (columns(mbody) == columns(mtotals)) {
					fprint (output, "\t\t\midrule \n\t\t");
					{
						if (mtotals[0][j] == 0 && sizeof(sz) > 0) {
							fprint (output, sz, " &");
						}
						else
						{
							fprint (output, sformat, mtotals[0][j], " &");
						}
					}
					if (mtotals[0][j] == 0 && sizeof(sz) > 0) {
						fprint (output, sz);
					}
					else
					{
						fprint (output, sformat, mtotals[0][j]);
					}
					fprint (output, "\\\\\n");
				}
			}
		}
	}
	/* write last bit */
	fwrite(output, "\t\t\\bottomrule\n");
	if (sizeof(sextra) > 0) {
		fprint(output, "\t\t",sextra, "\n");
	}
	fwrite(output, "\t\end{tabular}\n");
	/* write label and possibly the caption */
	if (captionpos == below) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption{", slabel, "}\n");
		}
	}
	if (columns(sref) > 0)
	{
		fprint (output, "\t\label{", sref, "}\n");
	}
	if (bro){
	 	fwrite(output, "\end{sidewaystable}\n\n");	
	} else {
		fwrite(output, "\end{table}\n\n");
	}
}

Latex::distbar ( ...)
{  /* set defaults and decls */
    decl args = va_arglist();
	decl snode;
	decl vpercdist = <.05, .2,  .5, .8, .95>, vdist = 0, sheader = 0, slabel = 0, sformat = "%6.1f";
	decl sref = 0, bcaptionpos = below, dthickness = 1, dloffset = 0.1, srightc = "white";
	decl sleftc = "red", bonep = yes, sdisttitle = 0;
	decl sxfe = "";
/* figure out contents */
    for (decl i = 0; i < sizeof(args); i++)
	{
		if 		( args[i] == "%pd" )
		{ vpercdist = args[i+1]; i++; }
		else if ( args[i] == "%b" )
		{	vdist = args[i+1]; 	i++; 		}
		else if ( args[i] == "%h" )
		{	sheader = args[i+1]; i++; 		}
		else if ( args[i] == "%l" )
		{	slabel = args[i+1]; i++; 		}
		else if ( args[i] == "%i" )
		{	bcaptionpos = args[i+1]; i++; 		}
		else if ( args[i] == "%f" )
		{	sformat = args[i+1]; i++; }
		else if ( args[i] == "%fe" )
		{	sxfe = args[i+1]; i++; 	}
		else if ( args[i] == "%x" )
		{	sref = args[i+1]; i++; 		}
		else if ( args[i] == "%dt" )
		{	dthickness = args[i+1]; i++; 		}
		else if ( args[i] == "%dl" )
		{	dloffset = args[i+1]; i++; 	}
		else if ( args[i] == "%lc" )
		{	sleftc = args[i+1]; i++; 		}
		else if ( args[i] == "%rc" )
		{	srightc = args[i+1]; i++; 		}
		else if ( args[i] == "%o" )
		{	bonep = args[i+1]; 	i++; 		}
		else if ( args[i] == "%c" )
		{	sdisttitle = args[i+1]; i++; }
	}
	decl problabel = new array[columns(vpercdist)];
    for (decl i = 0; i < columns(vpercdist); i++)
		if (vpercdist[i] == .5)
    		problabel[i] = sprint("Median");
    	else
        	problabel[i] = sprint(sformat, 100 * vpercdist[i]) ~ "\%";
	decl oneprob = sumc(vdist .< 1)/rows(vdist);
	vdist = quantilec(vec(vdist), vpercdist);
	decl min = minc (vpercdist');
	decl max = maxc (vpercdist');
	decl xdist = (vpercdist - min).*(1/(max-min)*(1-dloffset)) + dloffset;

	decl xone = sprint(double((oneprob - min)*(1/(max-min)*(1-dloffset)) + dloffset));
	decl onestring  = sprint(sformat, oneprob*100);
	fprint(output, "\\begin{figure}[h!]\n");
	fprint(output, "\centering\n");
	if (bcaptionpos == above) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption*{", slabel, "}\n");
		}
	}
	if (columns (sheader) >0 )
	{
		fprint (output, "\t\\begin{minipage}[c]{1", strwidth, "} ", sheader, " \t\end{minipage}\n");
	}
	fprint(output, "\t\\begin{tikzpicture}\n");
    fprint(output, "\t\t%labels", "\n");
    fprint(output, "\t\t\\node at(" + sprint(xdist[0]+0.1) , strwidth, ",-1.3) [below ]{\emph{Cumulative probability}};\n");
	fprint(output, "\t\t\\node at(" + sprint(xdist[0]+0.1) , strwidth, ",", sprint(dthickness +1.3), ") [above ]{\emph{", sdisttitle, "}};\n");
	fprint(output,
		"\t\t\%bar\n" + 
		"\t\t\shadedraw[left color=" + sprint(sleftc) + ", right color=" +sprint(srightc)+ "] " +
		"(" + sprint(xdist[0]), strwidth, ",0) \n"+
		"\t\t\t-- (" + sprint(xdist[columns(vpercdist)-1]), strwidth, ",0) \n"+
		"\t\t\t-- (" + sprint(xdist[columns(vpercdist)-1]), strwidth, ",", dthickness, ") \n"+
		"\t\t\t-- (" + sprint(xdist[0]), strwidth, ",", dthickness, ") \n"+
		"\t\t\t-- cycle;\n"
	);
	for (decl i = 0; i < columns(vpercdist); i++)
	{
		fprint(output, "\t\t%"+problabel[i], "\n");
		fprint(output, "\t\t\draw (", sprint(xdist[i]), strwidth, ", -0.1) node [below]{", problabel[i], "} ",
		"-- (", sprint(xdist[i]), strwidth, ", ", sprint(dthickness+0.1), ") node [above] {", sprint(sformat, vdist[i]), sxfe,"}; \n");
	}
	if (bonep)
	{
		fprint(output, "\t\t%1 time \n");
		fprint(output, 
			"\t\t\draw [thick,red](", xone, strwidth, ",-0.6) node [below]{", sprint(double(oneprob*100)), "\%} \n",
			"\t\t\t-- (" + xone, strwidth, ", ", sprint(dthickness+0.6), ") node [above]{One time} ;\n"
		);
	}
	fprint(output, "\t\end{tikzpicture}\n");
	if (bcaptionpos == below) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption{", slabel, "}\n");
		}
	}
	if (columns(sref) > 0)
	{
		fprint (output, "\t\label{", sref, "}\n");
	}
	fprint(output, "\end{figure}\n\n");
}
Latex::DrawBox(const dx, const dy, const dx2, const dy2, const sleftc, const srightc)
{
	/* draw perimeter */
	fprint(output, 
		"\t\t\shadedraw[bottom color=" +
		sprint(sleftc) +
		", top color=" +
		sprint(sleftc) +
		", middle color=" +
		sprint(srightc) +
		"] " +		
		"(" +
		sprint(dx, ", ", dy) + ")" +
		"\n\t\t\t--" + "(" +
		sprint(dx, ", ", dy2) + ")" +
		"\n\t\t\t--" + "(" +
		sprint(dx2, ", ", dy2) + ")" +
		"\n\t\t\t--" + "(" +
		sprint(dx2, ", ", dy) + ")" +
		"\n\t\t\t-- cycle;\n"
	);
	return 1;	   /* signal succes */
}
Latex::DrawCF(const sleftc, const srightc, const dminy, const dmaxy, const dmaxx, const dwx, const dtick, const sformat)
{
	decl dx, dy, dx2, dy2;
	decl sx, sy, sx2, sy2, dMean, dMedian, sMeany, sMediany, dLabel;
	decl dxoffset, dyoffset, dxscale, dyscale, dydistance, dxdistance;
	decl ci = 0;
	decl stick = sprint (dtick);		    /* was (dtick, "\\textwdith" )*/
	/* set scale */
	dxdistance = dmaxx; 	/* no need to calc x scale, it is by category */
	dxoffset = 0.1;
	dxscale = 0.8;
	dyscale = dxscale * dgr;

	/* to create a y scale calc this */
	decl slformat;
	decl dmaxscaley, dminscaley;
	decl mticks = MakeTicks(dmaxy~dminy, &slformat);
	println (slformat);
	if (sformat != "") {slformat = sformat;}   /* supersede with user supplied */
	dydistance = double(maxc(mticks)-minc(mticks));
	mticks =  (mticks/dydistance*dyscale) ~ mticks;
	dmaxscaley = double (maxc(mticks[][0]));
	dminscaley = double (minc(mticks[][0]));
	/* end y scale calculation */

	/* y axis */
	fprint(output,"\t\t%y-axes\n");
	fprint(output,"\t\t\draw[->,color=black] (0 ,",
		sprint((dminscaley-dtick),
		"", strwidth, ") -- \n\t\t(0, ",
		sprint (dmaxscaley+3*dtick),
		"", strwidth, ") node [above] {$CF$};\n"));
  	/* y-axis ticks */
	fprint(output,"\t\t%y-axis ticks\n");
	fprint(output, "\t\t\\foreach \y/\ytext in {");
	{fprint(output, mticks[0][0], "/", slformat, mticks[0][1]);}
	for (decl i = 1; i < rows (mticks); i++)
		{fprint(output, ",", mticks[i][0], "/", slformat, mticks[i][1]);}
	fprint(output, "}\n \t\t\draw[yshift=\y ", strwidth, "] (0pt,0pt) -- ",
		"(-3pt,0pt) node[left,fill=white] {$\ytext$};\n");

	/* draw bars */
	while (m_i > -1)
	{
		/* Calc bar */
		Pop (&dx, &dy, &dx2, &dy2, &dMean, &dMedian, &dLabel);
		sx = sprint ("%f", dx/dxdistance*dxscale, "", strwidth, "" );
		sx2 = sprint ("%f", dx2/dxdistance*dxscale, "", strwidth, "" );
		sy = sprint ("%f", dy/dydistance*dyscale, "", strwidth, "" );
		sy2 = sprint ("%f", dy2/dydistance*dyscale, "", strwidth, "" );
		sMeany = sprint ("%f", dMean/dydistance*dyscale, "", strwidth, "" );
		sMediany = sprint ("%f", dMedian/dydistance*dyscale, "", strwidth, "" );
		/* shadedraw */
		fprint(output, "\t\t%bars\n");
		if (sy != sy2) {
			DrawBox (sx, sy, sx2, sy2, sleftc, srightc);
		}
		/* Mean line */
        fprint(output,
			"\t\t%mean\n" +
			"\t\t\draw[color = black, thick] (" +
				sx + "-"+ stick + "," + sMeany + " )  \n\t\t\t -- (" +
				sx2 + "+" + stick + "," + sMeany + ") node [terminal, above] {" + sprint(slformat, dMean) + "};\n");
		/* Median line */
        fprint(output,
			"\t\t%median\n" +
			"\t\t\draw[color = red, dashed, thick] (" +
				sx +  "-"+ stick + "," + sMediany + " )  \n\t\t\t -- (" +
				sx2 + "+" + stick + "," + sMediany + ") ;\n");
		/* Scale point */
		if (dLabel != 0) {
			fprint(output,
				"\t\t%scale point\n" +
				"\t\t\draw[thin, color = black] (" +
				sprint((dx+dx2)/(2*dxdistance)*dxscale) +
				"", strwidth, ", 0) -- (" +
				sprint((dx+dx2)/2*dxscale/dxdistance) +
				"", strwidth, ", " + sprint(-dtick) +
				"", strwidth, ")\n\t\t node [anchor=north east, rotate=45] {" +
				sprint(dayofcalendar(dLabel)[0]) +	"/" +
				sprint(dayofcalendar(dLabel)[1]) +
				"};\n");
		}
		else
		{
			fprint(output,
				"\t\t%scale point\n" +
				"\t\t\draw[thin, color = black] (" +
				sprint((dx+dx2)/(2*dxdistance)*dxscale) +
				"", strwidth, ", 0) -- (" +
				sprint((dx+dx2)/2*dxscale/dxdistance) +
				"", strwidth, ", " + sprint(-dtick) +
				"", strwidth, ")\n\t\t node [below] {Year " +
				sprint(dmaxx - ci) +
				"};\n");
		}		
		++ci;
	}
	/* x axis */
	fprint(output,"\t\t%x-axes\n");
	if (dLabel != 0)
	{
		fprint(output,"\t\t\draw[color=black, thin] (" +
			sprint(dxscale+dtick) + "", strwidth, ", 0) -- (0,0);\n");
		fprint(output,"\t\t\\node at (0," + sprint(-dtick) +
			"", strwidth, ") [anchor = north east,rotate = 45] {Y/M};\n");
	}
	else
	{
		fprint(output,"\t\t\draw[color=black, thin] (" +
			sprint(dxscale+dtick) + "", strwidth, ", 0) -- (0,0);\n");
	}	
}
Latex::	bargraph (...)
{
}

//Cash flow distribution
Latex::cfdist ( ...)
{
    decl args = va_arglist();
	decl dy1, dy2, vdate= 0;

	/* set default values */
	decl vpercdist = <0.5>, mdist = 0,  sheader = 0, slabel = 0;
	decl snode = 0, sformat = "%6.1f", sref = 0, bcaptionpos = below;
	decl dthickness = 1, dloffset = 0.1, srightc = "green", sleftc = "white", sdisttitle = 0;
	decl dminy = 0, dmaxy = 0, dmaxx = 0, dwx = 0.5, dtick = 0.01, mmean = <>, brot = 0;
	/* figure out contents */
    for (decl i = 0; i < sizeof(args); i++)
	{
		if 		( args[i] == "%pd" )
		{ 	vpercdist = args[i+1]; 	i++; }
		else if ( args[i] == "%b" )
		{	mdist = args[i+1]; 	i++; 		}
		else if ( args[i] == "%h" )
		{	sheader = args[i+1]; 	i++; 	}
		else if ( args[i] == "%l" )
		{	slabel = args[i+1]; i++; }
		else if ( args[i] == "%i" )
		{	bcaptionpos = args[i+1]; i++; 	}
		else if ( args[i] == "%f" )
		{	sformat = args[i+1]; i++; }
		else if ( args[i] == "%x" )
		{	sref = args[i+1]; i++; 	}
		else if ( args[i] == "%dt" )
		{	dthickness = args[i+1]; i++; }
		else if ( args[i] == "%dl" )
		{	dloffset = args[i+1]; i++; }
		else if ( args[i] == "%lc" )
		{	sleftc = args[i+1]; i++; }
		else if ( args[i] == "%rc" )
		{	srightc = args[i+1]; i++; }
		else if ( args[i] == "%c" )
		{	sdisttitle = args[i+1]; i++; }
		else if ( args[i] == "%w" )
		{	dwx = args[i+1]; i++; }
		else if ( args[i] == "%n" )
		{	snode = args[i+1]; 	i++; }
		else if ( args[i] == "%mm" )
		{ 	mmean = args[i+1]; 	i++; }
		else if ( args[i] == "%xs" )
		{ 	vdate = args[i+1]; 	i++; }
	}
 	//Cash flow distribution
	if (vdate == 0) { vdate = zeros(1,columns(mdist)); }
	fprint(output, "\\begin{figure}[h!]\n");
	fprint(output, "\centering\n");
	if (bcaptionpos == above) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption*{", slabel, "}\n");
		}
	}
	if (columns (sheader) >0 )
	{
		fprint (output, "\t\\begin{minipage}[c]{1", strwidth, "} ", sheader, " \t\end{minipage}\n");
	}
	fprint(output, "\t\\begin{tikzpicture}[terminal/.style={\n", 
						"\t\tthick, draw=black,\n",
						"\t\trectangle,minimum size=6mm,rounded corners=3mm,\n",
                        "\t\ttop color=white, bottom color=white}]\n");
    for (decl t = 0; t < columns(mdist); t++)
    {
		dy1 = quantilec(mdist[][t], vpercdist[0]);
		dminy = min(dminy, dy1);
		dy2 = quantilec(mdist[][t], vpercdist[1]);
		dmaxy = max (dmaxy, dy2);
		dmaxx ++;
		if (columns(mmean)==columns(mdist)) {
			Push(t + dwx/2, dy1, t + dwx*3/2, dy2, mmean[][t], quantilec(mdist[][t]), vdate[t]);
		}
		else {
			Push(t + dwx/2, dy1, t + dwx*3/2, dy2, meanc(mdist[][t]), quantilec(mdist[][t]), vdate[t]);
		}
    }
	DrawCF(sleftc, srightc, dminy, dmaxy, dmaxx, dwx, dtick, sformat);

	if (columns(snode) > 0)
	{
		fprint (output, "\t\t\\node at (0.2", strwidth, ", 0.4", strwidth, ")[terminal]{", snode, "};\n");
	}

	fprint(output, "\t\end{tikzpicture}\n");
	if (bcaptionpos == below) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption{", slabel, "}\n");
		}
	}
	if (columns(sref) > 0)
	{
		fprint (output, "\t\label{", sref, "}\n");
	}
	fprint(output, "\end{figure}\n\n");
}

Latex::density (...)
{	/* declarations and defaults */
	decl args = va_arglist();
	decl srightc, sleftc;
	decl mpercdist = <>, mdist = 0, sheader = 0, slabel = 0, snode = 0, sformat = "";
	decl sref = 0, bcaptionpos = below;
	decl dthickness = 1, dloffset = 0.1, adisttitle = {};
	decl dminy = 0, dmaxy = 0, dminx = 0, dmaxx = 0, dwx = 0.5, dtick = 0.01, dh = 0.39;
	decl acolor = {"black, dashed, thick", "red,solid", "blue, solid", "teal, dashed"};
	decl bp = "", sxfe = "", sxl = "$x$", syl = "$p(x)$";
	decl sgr = "no";
	decl sgcolor = "help lines";
	
	/* figure out contents */
    for (decl i = 0; i < sizeof(args); i++)
	{
		if 		( args[i] == "%pd" )
		{ 	mpercdist = args[i+1]; i++; }
		else if ( args[i] == "%b" )
		{	mdist = args[i+1]; i++; }
		else if ( args[i] == "%h" )
		{	sheader = args[i+1]; i++; }
		else if ( args[i] == "%l" )
		{	slabel = args[i+1]; i++; }
		else if ( args[i] == "%i" )
		{	bcaptionpos = args[i+1]; i++; }
		else if ( args[i] == "%f" )
		{	sformat = args[i+1]; i++; }
		else if ( args[i] == "%x" )
		{	sref = args[i+1]; i++; }
		else if ( args[i] == "%dt" )
		{	dthickness = args[i+1]; i++; }
		else if ( args[i] == "%dl" )
		{	dloffset = args[i+1]; i++; }
		else if ( args[i] == "%ac" )
		{	acolor = args[i+1]; i++; }
		else if ( args[i] == "%an" )
		{	adisttitle = args[i+1]; i++; }
		else if ( args[i] == "%w" )
		{	dwx = args[i+1]; i++; }
		else if ( args[i] == "%n" )
		{	snode = args[i+1]; i++; }
		else if ( args[i] == "%dh" )
		{	dh = args[i+1]; i++; }
		else if ( args[i] == "%bp" )
		{	bp = args[i+1]; i++; }
		else if ( args[i] == "%fe" )
		{	sxfe = args[i+1]; i++; 	}
		else if ( args[i] == "%xl" )
		{ 	sxl = args[i+1]; i++; }
		else if ( args[i] == "%yl" )
		{	syl = args[i+1]; i++; }
		else if ( args[i] == "%gr" )
		{	sgr = args[i+1]; i++; }
	}
	/**********************/
	/* open density graph */
	fprint(output, "\\begin{figure}[h!]\n");
	fprint(output, "\centering\n");
	if (bcaptionpos == above) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption*{", slabel, "}\n");
		}
	}
	if (columns (sheader) >0 )
	{
		fprint (output, "\t\\begin{minipage}[c]{1", strwidth, "} ", sheader, " \t\end{minipage}\n");
	}
	fprint(output, "\t\\begin{tikzpicture}\n");
//						[terminal/.style={\n", 
//						"\t\tthick, draw=black,\n",
//						"\t\trectangle,minimum size=6mm,rounded corners=3mm,\n",
//                        "\t\ttop color=white, bottom color=white}]\n");

	/********************************************/
	/* calc probabilities with kernel estimator */
	/* rescale */
	decl vsigmdist = sqrt(varc(mdist));
	decl vmeanmdist = meanc(mdist);
	mdist = (mdist-vmeanmdist)./vsigmdist;
	decl ma = new matrix[100][columns(mdist)];
	if (rows(mdist) < 100) {ma = new matrix [rows(mdist)][columns(mdist)];}
	if (bp == "points") { ma = mdist; }
	decl mamin = minc (mdist);
	decl mamax = maxc (mdist);

	for (decl i = 0; i < min(columns(mamin), rows(mpercdist)); i++){
		mamin[][i] = max(quantilec(mdist,min(mpercdist[i][])), mamin[][i]);
		mamax[][i] = min(quantilec(mdist,max(mpercdist[i][])), mamax[][i]);
	}

	/* create range */
	for (decl i = 0; i < columns(ma) ; i++) {
		if (bp == "points") {
			ma[][i] = sortc( mdist[][i]);
		}
		else {
			ma[][i] = range(mamin[0][i], mamax[0][i], (mamax[0][i] -mamin[0][i])/(rows(ma)-1))';
		}
	}
	
	/* calc prob */
	decl mprob = new matrix [rows(ma)][columns(ma)];
	for (decl i = 0; i < rows(ma) ; i++) {
		mprob[i][] = sumc(densn((ma[i][]-mdist)./dh))./(dh*rows(mdist));
	}
	/* scale back to origin */
	ma = ma .* vsigmdist + vmeanmdist;

	/* figure out distances */
	dminy = 0;
	dmaxy = max(vec(mprob));
	dminx = min(vec(ma)~0);	 // force to include zero
	dmaxx = max(vec(ma)~0);  // forec to include zero

	DrawGraph(mprob, ma, acolor, adisttitle, dminy, dmaxy, dminx, dmaxx,
		dtick, sformat, sxfe, sxl, syl, sgr, sgcolor);
	/***************/
	/* close graph */
	if (columns(snode) > 0)
	{
		fprint (output, "\t\\node at (0.2", strwidth, ", 0.4", strwidth, ")[terminal]{", snode, "};\n");
	}

	fprint(output, "\t\end{tikzpicture}\n");
	if (bcaptionpos == below) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption{", slabel, "}\n");
		}
	}
	if (columns(sref) > 0)
	{
		fprint (output, "\t\label{", sref, "}\n");
	}
	fprint(output, "\end{figure}\n\n");
}

Latex::DrawGraph (my, mx, const acolor, const aname, const dminy, const dmaxy,
	const dminx, const dmaxx, const dtick, const sformat, const sxfe, const sxl,
	const syl, const sgr, const sgcolor)
{
	decl dx, dy, dx2, dy2;
	decl sx, sy, sx2, sy2, dMean, dMedian, sMeany, sMediany;
	decl dxoffset, dyoffset, dxscale, dyscale, dydistance, dxdistance, syformat, sxformat;
	decl dmaxscaley, dminscaley, dmaxscalex, dminscalex, myticks, mxticks;

	decl ci = 0;
	decl stick = sprint (dtick); // , "", strwidth, "");
	/* set scale */
//	dxdistance = dmaxx - dminx;
//	dydistance = max(dmaxy,0) - min(dminy, 0);	// force inclusion of zero in the y axis
	dxscale = 0.8;
	dyscale = dxscale * dgr;
	/* to create a y scale calc this */
	myticks = MakeTicks (dmaxy~dminy~0, &syformat); //force to include zero in the y axis
	dydistance = maxc(myticks)-minc(myticks);
	myticks =  (myticks/dydistance*dyscale) ~ myticks; /* scale tickpoints, now in first columns */
	dmaxscaley = double (maxc(myticks[][0]));
	dminscaley = double (minc(myticks[][0]));
	/* end y scale calculation */
	/* to create an x  scale calc this */
	mxticks = MakeTicks (dmaxx~dminx, &sxformat);
	dxdistance = maxc(mxticks)-minc(mxticks);
	mxticks =  ((mxticks-dminx)*dxscale/dxdistance) ~ mxticks;
	dmaxscalex = double (max(mxticks[][0]));
	dminscalex = double (min(mxticks[][0]));
	/* end x scale calculation */
	/*include grid*/
	if (sgr == "yes" || sgr =="coarse" || sgr == "fine"){
		decl factor = 1;
		if (sgr == "fine") {factor = 10;}
		fprint(output,"\t%grid\n");
		fprint(output,sprint("\t\draw[",sgcolor,", xstep = ",
			"%#6.6f",(mxticks[1][0]-mxticks[0][0])/factor, "", strwidth, ", ystep = ",
			"%#6.6f",(myticks[1][0]-myticks[0][0])/factor, "", strwidth, "][xshift = ",
			"%#6.6f",mxticks[0][0], "", strwidth, "](",
			0, " , ",
			"%#6.6f",double(minc(myticks[][0]))-.001, "", strwidth,
			") grid (",
			"%#6.6f",double(maxc(mxticks[][0])-minc(mxticks[][0]))+.001, "", strwidth, " , ",
			"%#6.6f",double(maxc(myticks[][0]))+.001, "", strwidth, ");\n"));
			
		/* target string   \draw[help lines, xstep=0.01\textwidth,
				ystep=0.0070632\textwidth][xshift=-0.05\textwidth]
				(0,0) grid (0.8001\textwidth,0.494527\textwidth);*/
	}
	/* x axis */
	fprint(output,"\t%x-axes\n");
	fprint(output,"\t\draw[->,color=black, thin] (",
		sprint((dminscalex-dtick),
		"", strwidth, ", 0) -- \n\t\t(",
		sprint (dmaxscalex+3*dtick),
		"", strwidth, ",0) node [right] {", sxl, "} ;\n"));
  	/* x-axis ticks */
	fprint(output,"\t%x-axis ticks\n");
	fprint(output, "\t\\foreach \\x/\\xtext in {");
	if (columns (sformat) > 0 ) {
		fprint(output, sprint("%#6.6f", mxticks[0][0], "/", sformat, mxticks[0][1], sxfe));
		for (decl i = 1; i < rows (mxticks); i++)
			{fprint(output, ", ", sprint("%#6.6f", mxticks[i][0], "/", sformat, mxticks[i][1], sxfe));}
	}
	else
	{
		fprint(output, sprint("%#6.6f", mxticks[0][0], "/", sxformat, mxticks[0][1], sxfe));
		for (decl i = 1; i < rows (mxticks); i++)
			{fprint(output, ", ", sprint("%#6.6f", mxticks[i][0], "/", sxformat, mxticks[i][1], sxfe));}
	}
	if (strfind (sxformat, "e") > -1)
	{
		fprint(output, "}\n \t\t\draw[xshift=\\x ", strwidth, "] (0pt,0pt) -- ",
			"(0pt,-3pt) node[anchor = north east, rotate=45] {$\\xtext$};");
	}
	else
	{
		fprint(output, "}\n \t\t\draw[xshift=\\x ", strwidth, "] (0pt,0pt) -- ",
			"(0pt,-3pt) node[below] {$\\xtext$};");
	}
	/* y axis */
	fprint(output,"\n\t%y-axes\n");
	fprint(output,"\t\draw[->,color=black, thin](",
		dminscalex, "", strwidth, " ," ,
		sprint((dminscaley-dtick),
		"", strwidth, ") -- \n\t\t(",
		dminscalex, "", strwidth, ", ",
		sprint (dmaxscaley+3*dtick),
		"", strwidth, ") node[above] {", syl, "};\n"));
  	/* y-axis ticks */
	fprint(output,"\t%y-axis ticks\n");
	fprint(output, "\t\\foreach \y/\ytext in {");
	{fprint(output, sprint("%#6.6f", myticks[0][0], "/", syformat, myticks[0][1]));}
	for (decl i = 1; i < rows (myticks); i++)
		{fprint(output, sprint(",", "%#6.6f", myticks[i][0], "/", syformat, myticks[i][1]));}
	fprint(output, "}\n \t\t\draw[yshift=\y ", strwidth, "] (", dminscalex, "", strwidth, ", 0pt) -- ",
		"(", dminscalex, "", strwidth, " -3pt,0pt) node[left] {$\ytext$};\n");
	/* scale mx and my */
	mx = (mx-dminx) .* (dxscale/dxdistance);
	my = my .* (dyscale/dydistance);
	/* graph lines */
	fprint(output, "\t%density lines\n");
	for (decl j = 0; j < columns(my); j++ ){
		if (columns(acolor) > j) {
			if (strfind(acolor[j], "only marks")<0) {
				fprint(output, "\t\draw  [", acolor[j], "] plot [smooth] coordinates {\n" );
			} else {
				fprint(output, "\t\draw  [", acolor[j], "] plot coordinates {\n" );
			}
		}
		else {
				fprint(output, "\t\draw  plot [smooth] coordinates {\n" );
		}
		for (decl i = 0; i < rows(my); i++){
			fprint(output,"\t\t(",sprint("%#6.6f",mx[i][j]),"", strwidth, ",",
				sprint("%#6.6f",my[i][j]), "", strwidth, ")\n");
		}
		fprint (output, "\t};\n");
	}
	/* print legend */
	if (columns(aname) > 0) {
		fprint(output, "\t%legend\n");
		for (decl i = 0; i < min(columns(my),columns(aname)); i++) {
			if (columns(acolor) > i) {
				fprint (output, "\t\\node [", acolor[i], ", right] at (",
				sprint("%#6.6f",mx[max(1,round(2*rows(my)/3)-10*i)][i]+dtick*3),
				"", strwidth, ",",
				sprint("%#6.6f",my[max(1,round(2*rows(my)/3)-10*i)][i]),
				"", strwidth, "){", aname[i], "};\n"
			);	}
			else {
				fprint (output, "\t\\node [right] at (",
				sprint("%#6.6f",mx[max(1,round(2*rows(my)/3)-10*i)][i]+dtick*3),
				"", strwidth, ",",
				sprint("%#6.6f",my[max(1,round(2*rows(my)/3)-10*i)][i]),
				"", strwidth, "){", aname[i], "};\n");
			}
		}
	}
}

Latex::graph (...)
{ 	/* decl and defaults  */
	decl args = va_arglist();
	decl mdist = 0, sheader = 0, slabel = 0, sformat = "", sref = 0, bcaptionpos = below;
	decl dloffset = 0.1;
	decl adisttitle = {};
	decl dminy = 0, dmaxy = 0, dminx = 0, dmaxx = 0, dwx = 0.5, dtick = 0.01, snode = 0;
	decl acolor = {"black, dashed, thick", "red,solid", "blue, solid", "teal, dashed"};
	decl sxfe = "";
	decl sxl = "", syl = "", icx = 1;
	decl sgr = "no";
	decl sgcolor = "help lines";
	decl vdate = 0;
	/* figure out contents */
    for (decl i = 0; i < sizeof(args); i++)
	{	
		if ( args[i] == "%b" )
		{	mdist = args[i+1]; i++; 		}
		else if ( args[i] == "%h" )
		{	sheader = args[i+1]; i++; 		}
		else if ( args[i] == "%l" )
		{	slabel = args[i+1];	i++; 		}
		else if ( args[i] == "%i" )
		{	bcaptionpos = args[i+1]; i++; 	}
		else if ( args[i] == "%f" )
		{	sformat = args[i+1]; i++; 		}
		else if ( args[i] == "%x" )
		{	sref = args[i+1]; i++;			}
		else if ( args[i] == "%dl" )
		{	dloffset = args[i+1]; 	i++; 	}
		else if ( args[i] == "%ac" )
		{	acolor = args[i+1]; i++; 		}
		else if ( args[i] == "%an" )
		{	adisttitle = args[i+1]; i++; 	}
		else if ( args[i] == "%n" )
		{	snode = args[i+1]; i++; 		}
		else if ( args[i] == "%fe" )
		{	sxfe = args[i+1]; i++; 		}
		else if ( args[i] == "%xl" )
		{	sxl = args[i+1]; i++;			}
		else if ( args[i] == "%yl" )
		{	syl = args[i+1]; i++; 		}
		else if ( args[i] == "%nx" )
		{	icx = args[i+1]; i++;		}
		else if ( args[i] == "%xs" )
		{ 	vdate = args[i+1]; 	i++; }
		else if ( args[i] == "%gr" )
		{	sgr = args[i+1]; i++; }
		else if ( args[i] == "%gc" )
		{	sgcolor = args[i+1]; i++; }
	}
	/**********************/
	/* open graph */
	fprint(output, "\\begin{figure}[h!]\n");
	fprint(output, "\centering\n");
	if (bcaptionpos == above) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption*{", slabel, "}\n");
		}
	}
	if (columns (sheader) >0 )
	{
		fprint (output, "\t\\begin{minipage}[c]{1", strwidth, "} ", sheader, " \t\end{minipage}\n");
	}
	fprint(output, "\t\\begin{tikzpicture}\n");
//						[terminal/.style={\n", 
//						"\t\tthick, draw=black,\n",
//						"\t\trectangle,minimum size=6mm,rounded corners=3mm,\n",
//                        "\t\ttop color=white, bottom color=white}]\n");

	/********************************************/
	/* rescale */
	decl mprob, ma;
	if (icx == 1) {
		mprob = mdist[][1:];
		ma = mdist[][0];
		if (columns(mprob)>1) {
			ma = ma * constant(1, 1, columns(mprob));
		}
	}
	else if (columns(mdist)/icx == 2) {
		mprob = mdist[][icx:];
		ma	= mdist[][:icx-1];
	}
	else {
		fprint (output,sprint("\t\\Message from classLatex:graph. Number of columns in y-data is ",
			columns(mdist)-icx, " number of columns in x-data is ", icx,
			" don't know how to make a graph of this. Trying to die gracefully."));
		fprint(output, "\t\end{tikzpicture}\n");
		fprint(output, "\end{figure}\n\n");
		return;
	}
	/* figure out distances */
	dminy = min(vec(mprob));
	dmaxy = max(vec(mprob));

	dminx = min(vec(ma));
	dmaxx = max(vec(ma));
	
	
	DrawGraph(mprob, ma, acolor, adisttitle, dminy, dmaxy, dminx, dmaxx,
		dtick, sformat, sxfe, sxl, syl, sgr, sgcolor);

	/***************/
	/* close graph */
	if (columns(snode) > 0)
	{
		fprint (output, "\t\\node at (0.2", strwidth, ", 0.4", strwidth, ")[terminal]{", snode, "};\n");
	}

	fprint(output, "\t\end{tikzpicture}\n");
	if (bcaptionpos == below) {
		if (columns(slabel) > 0)
		{
			fprint (output, "\t\caption{", slabel, "}\n");
		}
	}
	if (columns(sref) > 0)
	{
		fprint (output, "\t\label{", sref, "}\n");
	}
	fprint(output, "\end{figure}\n\n");
}

Latex::line(const b)
{
	fwrite(output, "\t"+b+"\n");
}

Latex::newpage()
{
	line("\clearpage");
}

Latex::MakeTicks (dlimits, asformat)
/* to create a  scale calc this */
{
	decl msticks, vint;
	/* calc unit of scale (droot) and set number format */
	decl droot = Interval(dlimits, &vint);
	if (droot>-2) {
		asformat[0] = sprint ("%d"); /* return */
	}
	else
	{
		asformat[0] = sprint ("%#6.",-droot-1, "f"); /* return */
	}
	if (droot < -5)
	{
		asformat[0] = sprint ("%2.1e"); /* return */
	}
	/* end calc unit of scale */

	msticks = (range(vint[0],vint[1]).*vint[2])'; 
	return msticks;
}

Latex::Interval(const vobs, const avint)
{
	decl amin=(minc(vobs')'); 
   	decl amax=(maxc(vobs')'); 
	decl unit = (amax-amin)./10;
   	decl grade=floor(log10(unit));
	unit = unit./(10^grade);
	decl interval;
	interval = unit .< sqrt(50) .?
		(unit .< sqrt(10) .? (10^grade)*4 .:
			(unit .< sqrt(2) .? (10^grade)*2 .: 10^grade*10) )
		.: 10^grade*10; 
	grade = floor(log10(interval/10)); /* make grade consistent with selected interval */
	decl maxscale=ceil(amax./interval); 
   	decl minscale=floor(amin./interval);
	avint[0] = minscale~maxscale~interval;
	return(double(grade));
}