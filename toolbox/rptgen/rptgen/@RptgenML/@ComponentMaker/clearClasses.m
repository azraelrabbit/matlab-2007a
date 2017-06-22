function clearClasses(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    r = RptgenML.Root;
    % 7 9
    clsName = horzcat(this.PkgName, '.', this.ClassName);
    % 9 11
    if not(isempty(r.Library))
        % 11 13
        libComp = find(r.Library, '-isa', 'RptgenML.LibraryComponent', 'ClassName', clsName);
        % 13 16
        % 14 16
        if not(isempty(libComp))
            clearComponent(libComp(1.0));
        end % if
    end % if
    % 19 21
    openClass = find(r, '-isa', clsName);
    % 21 23
    if isempty(openClass)
        warnID = 'MATLAB:ClassInstanceExists';
        oldWarn = warning('query', warnID);
        warning('off', warnID);
        locClearClasses
        warning(oldWarn);
    else
        rptgen.displayMessage(sprintf('Objects of type "%s" (%s) exist.  Not clearing classes.  Component properties will not update.', this.DisplayName, clsName), 2.0);
        % 30 33
        % 31 33
        rptgen.displayMessage(xlate('To fix: Close any .rpt files using this component, then type "clear classes" at the command line.'), 5.0);
    end % if
function locClearClasses
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    clear('classes');
