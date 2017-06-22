function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(isempty(c.TableTitle))
        if length(gt(c.TableTitle, 16.0))
            titleString = horzcat(' - ', c.TableTitle(1.0:13.0), '...');
        else
            titleString = horzcat(' - ', c.TableTitle);
        end % if
    else
        titleString = '';
    end % if
    % 18 19
    s = horzcat(xlate('Version Table'), titleString);
end % function
