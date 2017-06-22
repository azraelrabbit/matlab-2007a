function c = findClasses(varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    error(nargchk(1.0, 3.0, nargin));
    % 18 20
    if eq(nargin, 3.0) && ne(varargin{3.0}, 0.0)
        % 20 22
        c = find_leaf_subclasses(varargin{1.0:2.0});
    else
        if ge(nargin, 2.0)
            c = find_subclasses(varargin{:});
        else
            c = find_classes(varargin{:});
        end
    end
end
function c = find_classes(pkg)
    hpkg = findpackage(pkg);
    allClasses = hpkg.Classes;
    N = numel(allClasses);
    c = cell(N, 1.0);
    for i=1.0:N
        c{i} = allClasses(i).Name;
    end % for
end
function scNames = find_subclasses(pkg, base)
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    hpkg = findpackage(pkg);
    hbase = findclass(hpkg, base);
    % 47 51
    % 48 51
    % 49 51
    allClasses = setdiff(findclass(hpkg), hbase);
    % 51 54
    % 52 54
    N = length(allClasses);
    isSub = logical(zeros(N, 1.0));
    for i=1.0:N
        % 56 58
        sc = allClasses(i).Superclasses;
        if not(isempty(sc))
            % 59 61
            if gt(numel(sc), 1.0)
                error('Multiple superclasses found for class "%s" in package "%s"', allClasses(i).Name, pkg);
                % 62 64
            end
            % 64 66
            if strcmpi(sc.Name, base) && strcmpi(sc.Package.Name, pkg)
                % 66 68
                isSub(i) = 1.0;
            end
        end
    end % for
    % 71 74
    % 72 74
    scIndices = find(isSub);
    N = numel(scIndices);
    scNames = cell(N, 1.0);
    for i=1.0:N
        scNames{i} = allClasses(scIndices(i)).Name;
    end % for
end
function leafClasses = find_leaf_subclasses(pkg, baseClass)
    % 81 84
    % 82 84
    addClassToList('', true);
    recurse_leaf(pkg, cellhorzcat(baseClass));
    leafClasses = addClassToList;
    addClassToList('', true);
end
function recurse_leaf(pkg, baseClasses)
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    for i=1.0:numel(baseClasses)
        subClasses = find_subclasses(pkg, baseClasses{i});
        if not(isempty(subClasses))
            recurse_leaf(pkg, subClasses);
        else
            addClassToList(baseClasses{i});
        end
    end % for
end
function y = addClassToList(thisClass, reset)
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    persistent classList;
    if gt(nargin, 1.0) && reset
        % 110 112
        classList = {};
    end
    if gt(nargin, 0.0) && not(isempty(thisClass))
        if isempty(classList)
            classList = cellhorzcat(thisClass);
        else
            classList = vertcat(classList, thisClass);
        end
    end
    if gt(nargout, 0.0)
        y = classList;
    end
end
