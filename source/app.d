void main(string[] args)
{
	import std.getopt : defaultGetoptPrinter, getopt, GetOptException,
		GetoptResult;
	import std.stdio : writeln;

	real top = -1.0;
	real left = -2.0;
	real height = 2.0;
	real width = 4.0;
	size_t row = 20;
	size_t column = 80;
	size_t judge_iter = 20;

	GetoptResult helpinfo;
	try
	{
		helpinfo = getopt(args, "top", &top, "left", &left, "height",
				&height, "width", &width, "row", &row, "column", &column,
				"judge-iter", &judge_iter);
	}
	catch (Exception e)
	{
		writeln("Error: ", e.msg, "\nexit");
		return;
	}

	if (helpinfo.helpWanted)
		defaultGetoptPrinter("test", helpinfo.options);
}

string draw(real top, real left, real height, real width, size_t row,
		size_t column, size_t judge_iter);
