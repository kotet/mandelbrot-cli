import std.complex;

void main(string[] args)
{
	import std.getopt : defaultGetoptPrinter, getopt, GetOptException,
		GetoptResult;
	import std.stdio : writeln;

	real top = 1.0;
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

	draw(top, left, height, width, row, column, judge_iter).writeln;
}

string draw(real top, real left, real height, real width, size_t row,
		size_t column, size_t judge_iter)
{
	string result;
	foreach (ro; 0 .. row)
	{
		foreach (co; 0 .. column)
		{
			// z(n+1) = z(n) ^ 2 + c; z(0) = 0
			Complex!real c;
			c.im = top - height * (cast(real) ro / row);
			c.re = left + width * (cast(real) co / column);
			if (isDiverge(c, judge_iter))
			{
				result ~= ' ';
			}
			else
			{
				result ~= '#';
			}
		}
		result ~= '\n';
	}
	return result;
}

bool isDiverge(Complex!real c, size_t judge_iter)
{
	auto z = complex!real(0, 0);

	foreach (i; 0 .. judge_iter)
	{
		z = z * z + c;
		if (2.0 < z.abs)
			return true;
	}
	return false;
}
