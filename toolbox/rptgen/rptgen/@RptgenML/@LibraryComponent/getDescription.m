function d = getDescription(libC, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if gt(length(varargin), 0.0) && ischar(varargin{1.0}) && strcmp(varargin{1.0}, '-deferred') && not(isClassLoaded(libC))
        % 10 14
        % 11 14
        % 12 14
        d = xlate('Loading description...');
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        libC.ComponentInstance = libC;
        % 21 24
        % 22 24
        feval(com.mathworks.jmi.Matlab, 'getDescription', cellhorzcat(libC, '-update'), 0.0, []);
        return;
        % 25 27
    end % if
    % 27 29
    try
        d = feval(horzcat(libC.ClassName, '.getDescription'));
    catch
        errMsg = lasterr;
        crLoc = findstr(errMsg, char(10.0));
        if not(isempty(crLoc))
            errMsg = errMsg(plus(crLoc(1.0), 1.0):end);
        end % if
        d = horzcat(xlate('No description available:'), char(10.0), errMsg);
    end % try
    % 38 41
    % 39 41
    if gt(nargin, 1.0) && ischar(varargin{1.0}) && strcmp(varargin{1.0}, '-update')
        % 41 43
        r = RptgenML.Root;
        if not(isempty(r.Editor))
            dlg = r.Editor.getDialog;
            if not(isempty(dlg))
                dlg.refresh;
            end % if
        end % if
    end % if
function isLoaded = isClassLoaded(this)
    % 51 55
    % 52 55
    % 53 55
    isLoaded = not(isempty(this.ComponentInstance));
    if not(isLoaded)
        dotLoc = findstr(this.ClassName, '.');
        if not(isempty(dotLoc))
            pkgName = this.ClassName(1.0:minus(dotLoc, 1.0));
            clsName = this.ClassName(plus(dotLoc, 1.0):end);
            pkg = findpackage(pkgName);
            if not(isempty(pkg)) && not(isempty(pkg.Classes))
                isLoaded = not(isempty(find(pkg.Classes, 'Name', clsName)));
            end % if
        end % if
    end % if
