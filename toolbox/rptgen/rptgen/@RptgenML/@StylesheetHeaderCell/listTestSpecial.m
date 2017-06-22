function testList = listTestSpecial
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    testList = vertcat(cellhorzcat('$position = ''right''', xlate('Position - Right')), cellhorzcat('$position = ''center''', xlate('Position - Center')), cellhorzcat('$position = ''left''', xlate('Position - Left')), cellhorzcat('$sequence = ''odd''', xlate('Page sequence - Odd')), cellhorzcat('$sequence = ''even''', xlate('Page sequence - Even')), cellhorzcat('$sequence = ''first''', xlate('Page sequence - First in chapter/section')), cellhorzcat('$sequence = ''blank''', xlate('Page sequence - Blank')), cellhorzcat('$pageclass = ''titlepage''', xlate('Title page')), cellhorzcat('$double.sided != 0', xlate('Double sided')), cellhorzcat('$double.sided != 0 and ($sequence = ''even'' or $sequence = ''blank'') and $position = ''left''', xlate('Double sided - Outer left')), cellhorzcat('$double.sided != 0 and ($sequence = ''odd'' or $sequence = ''first'') and $position = ''right''', xlate('Double sided - Outer right')), cellhorzcat('$double.sided = 0', xlate('Single sided')), cellhorzcat('$double.sided = 0 and $position=''center''', xlate('Single sided - Center')), cellhorzcat('($sequence=''odd'' or $sequence=''even'') and $position=''center'' and $pageclass != ''titlepage''', xlate('Body page - Center')), cellhorzcat(xlate(''), xlate('<Enter a custom condition>')));
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
end % function
