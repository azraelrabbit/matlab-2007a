function msg = sg_maab_msg(title)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    str = DAStudio.message(horzcat('Slvnv:styleguide:', title));
    msg = horzcat('<font size=-1>MathWorks Automotive Advisory Board Style Guideline: ', str, ' </font>');
end % function
